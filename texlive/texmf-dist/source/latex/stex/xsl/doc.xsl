<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for transforming LaTeXML islands to OMDoc (Open Mathematical Documents). 
     $Id: doc.xsl 1858 2011-08-30 16:14:23Z kohlhase $
     $HeadURL: https://svn.kwarc.info/repos/stex/branches/stex+xhtml/xsl/doc.xsl $
     send bug-reports, patches, suggestions to users@omdoc.org or developers@omdoc.org 

     Copyright (c) 2000 - 2002 Michael Kohlhase, 
     XSLT 2.0 port by Christoph Lange 2006

     This library is free software; you can redistribute it and/or
     modify it under the terms of the GNU Lesser General Public
     License as published by the Free Software Foundation; either
     version 2.1 of the License, or (at your option) any later version.

     This library is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
     Lesser General Public License for more details.

     You should have received a copy of the GNU Lesser General Public
     License along with this library; if not, write to the Free Software
     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://omdoc.org/ns"
  xmlns:omdoc="http://omdoc.org/ns"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:ltx="http://dlmf.nist.gov/LaTeXML"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  exclude-result-prefixes="xsl omdoc xhtml ltx dc">

<xsl:output method="xml" indent="yes" cdata-section-elements="data"/>
<xsl:strip-space elements="*"/>

<xsl:template match="/">
  <xsl:comment>This OMDoc document is generated from an sTeX-encoded one via LaTeXML, you may want to reconsider editing it.</xsl:comment>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="omdoc:omdoc">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
    <!-- not needed any more
    <xsl:comment>The data elements</xsl:comment>
    <xsl:apply-templates mode="extract-data"/>  --> 
  </xsl:copy>
</xsl:template>

<xsl:template match="ltx:ERROR"/>
<xsl:template match="*|text()" mode="extract-data">
  <xsl:apply-templates mode="extract-data"/>
</xsl:template>

<!-- we directly access the content of titles -->
<xsl:template match="ltx:title"/>
<xsl:template match="ltx:part|ltx:chapter|ltx:part|ltx:section|ltx:subsection|ltx:subsubsection|ltx:paragraph|ltx:subparagraph">
  <omgroup layout="sectioning" class="{local-name()}">
    <xsl:copy-of select="@*"/>
    <metadata>
      <dc:title><xsl:apply-templates select="ltx:title/*|ltx:title/text()"/></dc:title>
    </metadata>
    <xsl:apply-templates/>
  </omgroup>
</xsl:template>

<!-- get rid of the mock-omdoc sectioning commands -->
<xsl:template match="omdoc:part|omdoc:chapter|omdoc:section|omdoc:subsection|omdoc:subsubsection|omdoc:paragraph|omdoc:subparagraph">
  <omgroup class="{local-name()}">
    <xsl:copy-of select="@*|*"/>
  </omgroup>
</xsl:template>

<xsl:template match="ltx:para">
  <omtext><xsl:copy-of select="@*"/><CMP><xsl:apply-templates/></CMP></omtext>
</xsl:template>

<!-- not needed any more
<xsl:template match="ltx:text">
  <xhtml:span>
    <xsl:copy-of select="@*"/>
    <xsl:if test="@font">
      <xsl:attribute name="class"><xsl:value-of select="@font"/></xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </phrase>
</xsl:template>  --> 

<!-- for citations we just extract the bibrefs at the moment. -->
<xsl:template match="ltx:cite"><xsl:apply-templates select="ltx:bibref"/></xsl:template>
<xsl:template match="ltx:bibref">
  <citation><xsl:copy-of select="@bibrefs"/></citation>
</xsl:template>

<xsl:template match="ltx:break"><xhtml:br/></xsl:template>

<!-- for LaTeXML references from \url -->
<xsl:template match="ltx:ref[@class='url']">
  <link href="{@href}" class="url">
    <xsl:value-of select="ltx:text"/>
  </link>
</xsl:template>

<xsl:template match="ltx:ref[@labelref]">
  <ref type="cite" xref="{@labelref}"/>
</xsl:template>

</xsl:stylesheet>
