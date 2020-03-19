<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: htm-tpl-lang.xsl 1725 2012-01-10 16:08:31Z gabrielbodard $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="t" version="2.0">
   <!-- Contains all language related named templates -->

   <xsl:template name="attr-lang">
      <xsl:param name="selective">no</xsl:param>
      <xsl:if test="$selective='no' or ($selective='yes' and ./@xml:lang)">
         <xsl:if test="ancestor-or-self::t:*[@xml:lang]">
            <xsl:attribute name="xml:lang">
               <xsl:value-of select="ancestor-or-self::t:*[@xml:lang][1]/@xml:lang"/>
            </xsl:attribute>
         </xsl:if>
      </xsl:if>
   </xsl:template>

</xsl:stylesheet>
