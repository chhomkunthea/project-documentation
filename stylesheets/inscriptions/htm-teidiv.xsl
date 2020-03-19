<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: htm-teidiv.xsl 1725 2012-01-10 16:08:31Z gabrielbodard $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="t" 
                version="2.0">

  <xsl:template match="t:div">
    <!-- div[@type = 'edition']" and div[starts-with(@type, 'textpart')] can be found in htm-teidivedition.xsl -->
        <div>
          <xsl:if test="parent::t:body and @type">
            <xsl:choose>
              <xsl:when test="$edn-structure='campa'">
                <xsl:attribute name="class">
                  <xsl:value-of select="@type"/>
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="id">
                  <xsl:value-of select="@type"/>
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            
          </xsl:if>
          <!-- Temporary headings so we know what is where -->
          <xsl:if test="not(t:head)">
            <xsl:choose>
              <xsl:when test="$edn-structure='campa'">
                <xsl:if test="@type='translation' and count(//t:div[@type='translation']) &gt; 1">
                  <p class="translation-language">
                    <xsl:value-of select="/t:TEI/t:teiHeader/t:profileDesc/t:langUsage/t:language[@ident = current()/@xml:lang]"/>
                  </p>
                </xsl:if>
              </xsl:when>
              <xsl:when test="@type = 'translation'">
                  <h2>
                     <xsl:value-of select="/t:TEI/t:teiHeader/t:profileDesc/t:langUsage/t:language[@ident = current()/@xml:lang]"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="@type"/>
                  </h2>
              </xsl:when>
              <xsl:otherwise>
                  <h2>
                     <xsl:value-of select="@type"/>
                     <xsl:if test="string(@subtype)">
                        <xsl:text>: </xsl:text>
                        <xsl:value-of select="@subtype"/>
                     </xsl:if>
                  </h2>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>

          <!-- Body of the div -->
          <xsl:apply-templates/>

        </div>

  </xsl:template>

</xsl:stylesheet>