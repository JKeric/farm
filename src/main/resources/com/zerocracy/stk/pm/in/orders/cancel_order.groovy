/**
 * Copyright (c) 2016-2017 Zerocracy
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to read
 * the Software only. Permissions is hereby NOT GRANTED to use, copy, modify,
 * merge, publish, distribute, sublicense, and/or sell copies of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package com.zerocracy.stk.pm.in.orders

import com.jcabi.xml.XML
import com.zerocracy.farm.Assume
import com.zerocracy.jstk.Project
import com.zerocracy.jstk.SoftException
import com.zerocracy.pm.ClaimIn
import com.zerocracy.pm.ClaimOut
import com.zerocracy.pm.in.Orders
import com.zerocracy.pm.staff.Roles

def exec(Project project, XML xml) {
  new Assume(project, xml).type('Cancel order')
  ClaimIn claim = new ClaimIn(xml)
  String job = claim.param('job')
  Orders orders = new Orders(project).bootstrap()
  if (!orders.assigned(job)) {
    throw new SoftException(
      String.format('Job `%s` is not assigned to anyone.', job)
    )
  }
  String performer = orders.performer(job)
  Roles roles = new Roles(project).bootstrap()
  if (!roles.hasRole(performer, 'PO', 'ARC')
    && claim.hasAuthor()
    && claim.author() != performer) {
    throw new SoftException(
      String.format(
        'The job `%s` is assigned to @%s, you @%s cannot resign, since you are not a PO or ARC.',
        job, performer, claim.author()
      )
    )
  }
  orders.resign(job)
  claim.reply(
    String.format(
      '@%s resigned from `%s`, please stop working.',
      performer, job
    )
  ).postTo(project)
  new ClaimOut()
    .type('Order was canceled')
    .param('job', job)
    .param('voluntarily', claim.hasAuthor() && claim.author() == performer)
    .param('login', performer)
    .postTo(project)
}
