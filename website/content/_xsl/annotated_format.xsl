<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- this template is not needed because the XML is added to a div in an already-existing HTML5 document
       
       <xsl:template match="DOC">
        <html>
            <head>
                <title></title>
                <link rel="stylesheet" type="text/css" href="abstract_style.css"/>
            </head>
            <body>
                <div id="container">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template>-->
    
    <xsl:template match="DOC">
        <xsl:call-template name="legend"/>
        <div id="contain">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:include href="normal_format.xsl"/>
    
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