<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="DOC">
        <html>
            <head>
                <title>Modeling Exercise</title>
            </head>
            <body><h1>Modeling Exercise</h1>
                <div>
                    <xsl:for-each select="page">
                        <div><h2>Death Notices (example <xsl:number count="page"/>)</h2>
                            <xsl:apply-templates/></div>
                    </xsl:for-each>
                    
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="obit/*[1]">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="obit/p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="page[2]//p/*">
        <span style="background:yellow">[start: <xsl:value-of select="name()"/>]<xsl:apply-templates/>[end: <xsl:value-of select="name()"/>]</span>
    </xsl:template>
    
    <xsl:template match="page[4]//p/*">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
    
    <xsl:template match="page[3]/obit/p/description[@type='death']">
        <span style="color:red"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="page[3]/obit/p/description[@type='illness']">
        <span style="color:blue"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>