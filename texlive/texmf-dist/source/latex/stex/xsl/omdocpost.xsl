<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for transforming LaTeXML islands to OMDoc (Open Mathematical Documents). 
     $Id: omdocpost.xsl 1858 2011-08-30 16:14:23Z kohlhase $
     $HeadURL: https://svn.kwarc.info/repos/stex/branches/stex+xhtml/xsl/omdocpost.xsl $
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes" cdata-section-elements="data"/>
<xsl:strip-space elements="*"/>
<xsl:param name="math-format" select="'om'"/>

<!-- the fallback: copy the whole thing recursively, until there is something to do -->
<xsl:template match="*">
  <xsl:copy><xsl:copy-of select="@*"/><xsl:apply-templates/></xsl:copy>
</xsl:template>

<!-- all the other functionality must be treated specially --> 
<xsl:include href="doc.xsl"/>
<xsl:include href="notations.xsl"/>
<!-- old <xsl:include href="graphics.xsl"/>, replaced by LaTeXML treatment -->
<xsl:include href="symbols.xsl"/>
<xsl:include href="math.xsl"/>
<!-- old <xsl:include href="listings.xsl"/>, replaced by LaTeXML treatment -->
<xsl:include href="LaTeXML/LaTeXML-common.xsl"/>
<xsl:include href="LaTeXML/LaTeXML-inline-xhtml.xsl"/>
<xsl:include href="LaTeXML/LaTeXML-block-xhtml.xsl"/>
<xsl:include href="LaTeXML/LaTeXML-para-xhtml.xsl"/>
<!-- <xsl:include href="LaTeXML/LaTeXML-math-mathml.xsl"/> -->
<xsl:include href="LaTeXML/LaTeXML-tabular-xhtml.xsl"/>
<xsl:include href="LaTeXML/LaTeXML-structure-xhtml.xsl"/>
<xsl:include href="LaTeXML/LaTeXML-bib-xhtml.xsl"/>
</xsl:stylesheet>
