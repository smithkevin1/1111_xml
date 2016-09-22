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
    <xsl:template match="essay">
        <div id="essay">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="DOC/essay/docHead">
        <div id="head">
            <div>
                <ul class="right-just">
                    <li>
                        <xsl:value-of select="./author"/>
                    </li>
                    <li>
                        <xsl:value-of select="./date"/>
                    </li>
                </ul>
            </div>
        </div>
        <h1>
            <xsl:value-of select="./title"/>
        </h1>
    </xsl:template>

    <xsl:template match="body">
        <div id="text">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="body/div">
        <xsl:variable name="attribute-value" select="./@title"/>
        <div id="{$attribute-value}">
            <xsl:if test="./@title = true()">
                <h4>
                    <xsl:value-of select="./@title"/>
                </h4>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="essay//div/p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="DOC//citation">
        <a class="cit" href="{@source}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="essay//q">
        &#147;<xsl:apply-templates/>&#148;
    </xsl:template>


    <!--    <xsl:template match="DOC//title[not(parent::blog_post)]">
        <xsl:choose>
            <xsl:when test="./@level = 'a'">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <span class="italics">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->

    <xsl:template match="DOC//note">
        <xsl:variable name="attribute-value" select="./@type"/>
        <xsl:choose>
            <xsl:when test="$attribute-value = 'instructor'">
                <sup>
                    <a href="#" data-tooltip="Instructor note: {text()}"
                        data-tooltip-position="bottom">[i.n.]</a>

                    <!--<span class="{$attribute-value}">K.Smith: <xsl:apply-templates/></span>-->
                </sup>
            </xsl:when>
            <xsl:when test="$attribute-value != 'instructor'">
                <xsl:variable name="get_id" select="//docReview/reviewer"/>
                <sup>
                    <a href="#" data-tooltip="{$get_id}: {text()}" data-tooltip-position="bottom"
                        >[p.n.]</a>
                </sup>
                <!--<span class="{$attribute-value}"><xsl:value-of select="//docReview/reviewer"/>: <xsl:apply-templates/></span>-->

            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="docFoot">
        <div id="footer">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="docFoot/title">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <xsl:template match="listBibl">
        <div id="references">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="bibl">
        <li class="hanging_indent" id="{@xml:id}">
            <xsl:apply-templates/>
        </li>
    </xsl:template>


    <xsl:template match="DOC//style">
        <xsl:if test="@type = 'italics'">
            <span class="italics">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
        <xsl:if test="@type = 'underline'">
            <span class="underline">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
        <xsl:if test="@type = 'bold'">
            <span class="bold">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
    </xsl:template>

    <!-- This section processes the reviews/end notes for the document -->
    <xsl:template match="docReview">
        <div id="reviews">
            <xsl:apply-templates select="report"/>
        </div>
    </xsl:template>

    <xsl:template match="docReview//report">
        <div class="report">
            <xsl:choose>
                <xsl:when test="@type = 'peer'">
                    <h3>Peer review</h3>
                    <!--<h4><xsl:value-of select="//docReview/reviewer"/></h4>-->
                </xsl:when>
                <xsl:when test="@type = 'instructor'">
                    <h3>Instructor Note</h3>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="docReview//report/p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

</xsl:stylesheet>
