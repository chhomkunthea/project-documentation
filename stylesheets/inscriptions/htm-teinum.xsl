<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: htm-teinum.xsl 1739 2012-01-12 18:00:42Z gabrielbodard $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:t="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="t" version="2.0">
   <!-- Template in teinum.xsl -->
   <xsl:import href="teinum.xsl"/>

   <xsl:template match="t:num">
      <xsl:choose>
         <xsl:when
            test="$leiden-style=('ddbdp','sammelbuch') 
            and string(.)">
            <span>
               <xsl:attribute name="title">
                  <xsl:choose>
                     <xsl:when test="contains(@value,'/') or @type='fraction'">
                        <xsl:text>fraction</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text>number</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:choose>
                     <xsl:when test="string(@value)">
                        <xsl:text>: </xsl:text>
                        <xsl:value-of select="@value"/>
                     </xsl:when>
                     <xsl:when test="string(@atLeast) or string(@atMost)">
                        <xsl:text>: </xsl:text>
                        <xsl:if test="string(@atLeast)">
                           <xsl:value-of select="@atLeast"/>
                        </xsl:if>
                        <xsl:text>-</xsl:text>
                        <xsl:if test="string(@atMost)">
                           <xsl:value-of select="@atMost"/>
                        </xsl:if>
                     </xsl:when>
                  </xsl:choose>
                  <xsl:if test="child::t:certainty[@match='../@value']">
                     <xsl:text>(?)</xsl:text>
                  </xsl:if>
               </xsl:attribute>
               <xsl:apply-imports/>
            </span>
         </xsl:when>
          <xsl:when test="$leiden-style='campa' and t:gap[@reason='lost' and @unit='character']">
              <xsl:text>[</xsl:text>
              <xsl:variable name="digits">####################################################################################</xsl:variable>
              <xsl:value-of select="substring($digits, 1, t:gap/@extent)"/>
              <xsl:text>]</xsl:text>
          </xsl:when>
         <xsl:when
            test="$leiden-style = 'panciera' and
            ancestor::t:*[@xml:lang][1][@xml:lang = 'la']">
            <span class="latinnum">
               <xsl:apply-imports/>
            </span>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-imports/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

</xsl:stylesheet>
