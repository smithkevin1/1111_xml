<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="DOC"><!-- TEMPORARY TEMPLATE FOR OFFLINE TESTING (REMEMBER TO DELETE) -->
        <html>
            <head>
                <title>
                    <xsl:value-of select="//docHead/title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="../website/css/main.css"/>
                <link rel="stylesheet" type="text/css" href="./website/css/main.css"/>
            </head>
            <body>
                <xsl:call-template name="legend"/>
                <div id="container">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template> <!-- DELETE AFTER TESTING -->
    
   <!-- <xsl:template match="DOC">
        <xsl:call-template name="legend"/>
        <div id="contain">
            <xsl:apply-templates/>
        </div>
    </xsl:template>   REACTIVATE AFTER TESTING-->
    
    <xsl:include href="normal_format.xsl"/>
    
    <xsl:template match="essay//intro">
        <div id="ann_intro">
            <h3>Introduction</h3>
            <xsl:apply-templates/>
        </div>
        <h3>Body</h3>
    </xsl:template>
<!--    <xsl:template match="DOC/essay/body/bodyPara[1]">
            <xsl:apply-templates/>
    </xsl:template>-->
    <xsl:template match="essay//concl">
        <div id="ann_concl">
            <h3>Conclusion</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- END NORMAL FORMAT; BEGIN STYLESHEETS FOR ANNOTATION -->
    <xsl:template name="legend">
        <div id="legend">
            <p>color key:</p>
            <ul>
                <li class=""></li>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template match="essay//pattern">
        <span class="pattern"><xsl:apply-templates/></span>
    </xsl:template>
    
<!--    <xsl:template match="essay//pattern">
        <span class="pattern {@type}"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="essay//claim">
        <span class="claim {@type}"><xsl:apply-templates/></span>
    </xsl:template>-->
    
</xsl:stylesheet>