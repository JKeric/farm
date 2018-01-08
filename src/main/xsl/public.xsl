<?xml version="1.0"?>
<!--
Copyright (c) 2016-2018 Zerocracy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to read
the Software only. Permissions is hereby NOT GRANTED to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
  <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="/xsl/inner-layout.xsl"/>
  <xsl:template match="page" mode="head">
    <title>
      <xsl:value-of select="title"/>
    </title>
  </xsl:template>
  <xsl:template match="page" mode="inner">
    <p>
      <img src="http://www.0crat.com/badge/{project}.svg"/>
    </p>
    <p>
      <xsl:text>The project is managed by Zerocrat according to this </xsl:text>
      <a href="http://datum.zerocracy.com/pages/policy.html">
        <xsl:text>Policy</xsl:text>
      </a>
      <xsl:text>. </xsl:text>
      <xsl:text>If you want to join as a developer, start at </xsl:text>
      <a href="http://datum.zerocracy.com/pages/policy.html#2">
        <xsl:text>&#xA7;2</xsl:text>
      </a>
      <xsl:text>. </xsl:text>
      <xsl:text>We also recommend you to join this </xsl:text>
      <a href="https://t.me/joinchat/AAAAAEJFMRzsRTRxM3ec6A">
        <xsl:text>Telegram chat</xsl:text>
      </a>
      <xsl:text> to find someone who can </xsl:text>
      <a href="http://datum.zerocracy.com/pages/policy.html#1">
        <xsl:text>invite</xsl:text>
      </a>
      <xsl:text> you and explain how Zerocrat works.</xsl:text>
    </p>
  </xsl:template>
</xsl:stylesheet>