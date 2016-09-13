<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" 
    xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0" 
    xmlns:rng="http://relaxng.org/ns/structure/1.0">

    <xsl:template match="rng:element except rn">
        <section>
            <h3>&lt;<xsl:value-of select="@name"/>&gt;</h3>
            <p><xsl:value-of select="child::a:documentation[1]/text()"/>
            <xsl:if test="child::rng:attribute">
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </xsl:if></p>
        </section>
    </xsl:template>
    <xsl:template match="rng:attribute">
        <h4>posssible values of @<xsl:value-of select="@name"/></h4>
        <xsl:for-each select="rng:value"><li><xsl:value-of select="text()"/>: <xsl:value-of select="following-sibling::a:documentation[1]/text()"/></li></xsl:for-each>
    </xsl:template>
</xsl:stylesheet>