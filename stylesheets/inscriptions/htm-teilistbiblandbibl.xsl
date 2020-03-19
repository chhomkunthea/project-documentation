<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: htm-teilistbiblandbibl.xsl 1725 2012-01-10 16:08:31Z gabrielbodard $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0" 
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="t" 
                version="2.0">
  
  <xsl:template match="t:listBibl">
      <ul>
         <xsl:apply-templates/>
      </ul>
  </xsl:template>


  <xsl:template match="t:bibl[local-name(..)='listBibl']">
      <li>
         <xsl:apply-templates/>
      </li>
  </xsl:template>
    
    <xsl:template match="t:bibl[local-name(..) != 'listBibl']">
        <xsl:text></xsl:text><span class="bibl"><xsl:apply-templates/></span><xsl:text></xsl:text>
    </xsl:template>

</xsl:stylesheet>