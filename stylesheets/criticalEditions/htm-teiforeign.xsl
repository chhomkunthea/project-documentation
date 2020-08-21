<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id$ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="t"
                version="2.0">

  <xsl:template match="t:foreign">
    <xsl:param name="parm-leiden-style" tunnel="yes" required="no"/>
      <span class="lang">
      <!-- Found in htm-tpl-lang.xsl -->
      <xsl:if test="not($parm-leiden-style = 'dharma')">
      <xsl:call-template name="attr-lang"/>
    </xsl:if>
      <i>
         <xsl:apply-templates/>
      </i>
    </span>
  </xsl:template>

</xsl:stylesheet>
