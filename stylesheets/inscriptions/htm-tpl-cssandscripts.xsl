<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id$ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:t="http://www.tei-c.org/ns/1.0"

   exclude-result-prefixes="t"
   version="2.0">
   <!-- Called from start-edition.xsl -->

   <xsl:template name="css-script">
      <xsl:param name="parm-css-loc" tunnel="yes" required="no"></xsl:param>
      <xsl:param name="parm-leiden-style" tunnel="yes" required="no"></xsl:param>

      <link rel="stylesheet" type="text/css">
         <xsl:attribute name="href">
            <xsl:value-of select="$parm-css-loc"/>
         </xsl:attribute>
      </link>
   </xsl:template>
</xsl:stylesheet>
