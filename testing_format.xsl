<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0">
    <xsl:output method="xml" indent="yes"/>


    <xsl:template match="DOC">
        <html>
            <head>
                <title>
                    <xsl:choose>
                        <xsl:when test="child::article">
                            <xsl:value-of select="//article_title"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="//title[1]"/>
                        </xsl:otherwise>
                    </xsl:choose>
                     
                </title>
                <link rel="stylesheet" type="text/css" href="../website/css/main.css"/>
                <link rel="stylesheet" type="text/css" href="./website/css/main.css"/>
            </head>
            <body>
                <div id="container">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:include href="./website/content/_xsl/normal_format.xsl"/>

</xsl:stylesheet>
