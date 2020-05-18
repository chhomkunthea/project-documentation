<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: teilb.xsl 1725 2012-01-10 16:08:31Z gabrielbodard $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="t"
                version="2.0">
  <!-- Imported by [htm|txt]-teilb.xsl -->

  <xsl:template match="t:lb">
    <xsl:param name="parm-leiden-style" tunnel="yes" required="no"></xsl:param>
      <xsl:if test="ancestor::t:l">
         <xsl:choose>
            <xsl:when test="@break='no'">
               <xsl:text></xsl:text> <!--no space-->
            </xsl:when>
            <xsl:otherwise>
               <xsl:text> </xsl:text>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:choose>
        <!-- If verse-line is needed in ddbdp and @n is not a number eg 2a -->
        <xsl:when test="$verse-lines = 'on' and not(number(@n)) and ($leiden-style = 'ddbdp' or $leiden-style = 'sammelbuch')">
               <xsl:call-template name="lb-content"/>
            </xsl:when>
          <xsl:when test="number(@n) and @n mod $line-inc = 0 and not(@n = 0) and not(starts-with($leiden-style, 'edh'))">
               <xsl:call-template name="lb-content"/>
            </xsl:when>
        </xsl:choose>
      </xsl:if>
     <xsl:if test="$leiden-style=('ddbdp','sammelbuch') and @rend">
        <xsl:text>(</xsl:text>
        <xsl:value-of select="@rend"/>
        <xsl:text>)</xsl:text>
     </xsl:if>
  </xsl:template>

  <xsl:template match="t:lb">
    <xsl:param name="parm-leiden-style" tunnel="yes" required="no"></xsl:param>
    <xsl:if test="$leiden-style = 'dharma'">
      <br/>
      <xsl:call-template name="lb-content"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="lb-content">
      <xsl:choose>
         <xsl:when test="@break='no' or @type='inWord'">
          <sup class="versenumber">
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>)</xsl:text>
          </sup>
         </xsl:when>
         <xsl:otherwise>
           <sup class="versenumber">
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>)</xsl:text>
          </sup>
         </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
