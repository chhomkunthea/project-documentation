<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id$ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="t"
    version="2.0">

    <xsl:template match="t:q" mode="#all">
        <xsl:param name="parm-leiden-style" tunnel="yes" required="no"></xsl:param>
        <xsl:param name="parm-edn-structure" tunnel="yes" required="no"></xsl:param>
        <xsl:choose>
            <xsl:when test="($parm-edn-structure = 'rib')">
                <xsl:text>&#8216;</xsl:text><xsl:apply-templates/><xsl:text>&#8217;</xsl:text>
            </xsl:when>
            <xsl:when test="($parm-leiden-style = 'ddbdp' or $parm-leiden-style = 'sammelbuch')">
                <xsl:text>'</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>'</xsl:text>
            </xsl:when>
            <xsl:when test="$parm-leiden-style = 'dharma'">
              <xsl:choose>
                <xsl:when test="@rend='block'">
                  <xsl:element name="span">
                  <xsl:attribute name="class">block</xsl:attribute>
                  <xsl:apply-templates/>
                </xsl:element>
                </xsl:when>
                <xsl:otherwise>
              <xsl:text>‘</xsl:text>
              <xsl:apply-templates/>
              <xsl:text>’</xsl:text>
            </xsl:otherwise>
            </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
