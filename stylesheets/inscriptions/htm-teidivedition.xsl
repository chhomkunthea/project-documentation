<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: htm-teidivedition.xsl 1753 2012-02-29 20:38:41Z sarcanon $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:t="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="t" version="2.0">

   <!-- Other div matches can be found in htm-teidiv.xsl -->

   <!-- Text edition div -->
   <xsl:template match="t:div[@type = 'edition']" priority="1">
      <div id="edition">
         <!-- Found in htm-tpl-lang.xsl -->
         <xsl:call-template name="attr-lang"/>
         <xsl:apply-templates/>

         <!-- Apparatus creation: look in tpl-apparatus.xsl for documentation and templates -->
         <xsl:if test="$apparatus-style = 'ddbdp'">
            <!-- Framework found in htm-tpl-apparatus.xsl -->
            <xsl:call-template name="tpl-apparatus"/>
         </xsl:if>

      </div>
   </xsl:template>


   <!-- Textpart div -->
   <xsl:template match="t:div[@type='textpart']" priority="1">
       <xsl:variable name="div-type">
           <xsl:for-each select="ancestor::t:div[@type!='edition']">
               <xsl:value-of select="@type"/>
               <xsl:text>-</xsl:text>
           </xsl:for-each>
       </xsl:variable>
       <xsl:variable name="div-loc">
         <xsl:for-each select="ancestor::t:div[@type='textpart']">
            <xsl:value-of select="@n"/>
            <xsl:text>-</xsl:text>
         </xsl:for-each>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$edn-structure='campa' and ancestor::t:div[@type='edition' or @type='translation']">
            <div class="textpart">
               <xsl:variable name="theid" select="@xml:id"/>
               <xsl:if test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:if>
               <xsl:if test="@n and not(t:head) and //t:locus[substring-after(@target, '#')=$theid]"><span class="textpart-number"><xsl:value-of select="@n"/></span></xsl:if>
               <xsl:apply-templates/>
            </div>
         </xsl:when>
         <xsl:otherwise>
            <span class="textpartnumber" id="{$div-type}ab{$div-loc}{@n}">
               <!-- add ancestor textparts -->
               <xsl:if test="($leiden-style = 'ddbdp' or $leiden-style = 'sammelbuch') and @subtype">
                  <xsl:value-of select="@subtype"/>
                  <xsl:text> </xsl:text>
               </xsl:if>
               <xsl:if test="@n">
                  <xsl:value-of select="@n"/>
               </xsl:if>
            </span>
            <!--<xsl:element name="br"/>-->
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>

   </xsl:template>
</xsl:stylesheet>
