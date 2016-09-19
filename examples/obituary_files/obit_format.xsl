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
    
    <xsl:template match="obit">
        <h3><xsl:value-of select="./*[1]"/></h3>
        <xsl:for-each select="./p"><p><xsl:value-of select="."/></p></xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>