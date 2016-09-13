<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
    xmlns:rng="http://relaxng.org/ns/structure/1.0">
    <!--xpath-default-namespace="http://www.tei-c.org/ns/1.0"-->
    <xsl:output method="xml" indent="yes"/>

    <!--stylesheet for annotated format version (created for P1 2016-07-12)-->

    <!--     this template is not needed because the XML is added to a div in an already-existing HTML5 document
-->
    <xsl:template match="DOC">
        <html>
            <head>
                <title/>
                <link rel="stylesheet" type="text/css" href="./css/main.css"/>
            </head>
            <body>
                <div id="container">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="docHead">
        <div id="head">
            <h2 class="assign_title">
                <xsl:value-of select="./title"/>
            </h2>
            <h3>Author: <xsl:value-of select="./author"/></h3>
            <xsl:for-each select="version">
                <xsl:if test="not(following-sibling::version)">
                    <h4>Date: <xsl:value-of select="@date"/></h4>
                </xsl:if>
            </xsl:for-each>




        </div>
    </xsl:template>

    <xsl:template match="body">
        <div id="text">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="body/div">
        <xsl:variable name="attribute-value" select="./@type"/>
        <div id="{$attribute-value}">

            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!--templates specific to annotated bib assignment-->
    <xsl:template match="annotated_bib">
        <div id="text">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="problem_stmt">
        <p class="problem">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="citation">
        <p class="citation">
            <strong>
                <xsl:apply-templates/>
            </strong>
        </p>
    </xsl:template>

    <xsl:template match="annotated_bib//title">
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
    </xsl:template>

    <xsl:template match="annotated_bib//author">
        <span class="author">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="annotation">
        <p class="annotation">
            <xsl:for-each select="child::background | summary | relevance">
                <xsl:variable name="type" select="./@type"/>
                <xsl:variable name="rng"
                    select="document('../schema_3302.rng')//rng:attribute/value[. eq $type]"/>
                <xsl:variable name="rng_doc" select="document('../schema_3302.rng')//$rng/child::a:documentation[1]"/>

                <span class="{name()}" data-tooltip="{name()}: {$rng_doc}"
                    data-tooltip-position="bottom">
                    <xsl:apply-templates/>
                </span>
            </xsl:for-each>
        </p>
    </xsl:template>

    <!-- <xsl:template name="doc" match="annotation/*/@type">
        <span class="rollover">This text has been tagged as a part of the <strong><xsl:value-of select="name(..)"/></strong>: 
        <xsl:variable name="type" select="."/>
        <xsl:variable name="rng" select="document('../schema_3302.rng')//rng:value[. eq $type]"/>
            <xsl:value-of select="$rng/following-sibling::a:documentation[1]"/>
        </span>
    </xsl:template>-->

    <!--<xsl:template match="text/*/@type">
        <span class="rollover">This text has been tagged as a part of the <strong><xsl:value-of select="name(..)"
        /></strong>. Type <!-\- insert content for rollover box -\->
            <xsl:variable name="type_val" select="."/>
            <xsl:variable name="rng" select="document('abstract_schema.rng')//rng:value[. eq $type_val]"/> <!-\-this variable matches the type attibute value to the corresponding attribute documentation from the associated rng schema -\->
            <xsl:value-of select="$rng/following-sibling::a:documentation[1]"/>
        </span>
    </xsl:template>
    
    <xsl:template match="annotated_bib//ref">
        <xsl:variable name="href" select="text()"/>
        <a href="{$href}"><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="annotation//q">
        “<xsl:apply-templates/>”
    </xsl:template>-->
    <!--end annotated bib templates-->

    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="note">
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
                    <a href="#" data-tooltip="Student {$get_id}: {text()}"
                        data-tooltip-position="bottom">[p.n.]</a>
                </sup>
                <!--<span class="{$attribute-value}"><xsl:value-of select="//docReview/reviewer"/>: <xsl:apply-templates/></span>-->

            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="docFoot">
        <div id="foot">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="listBibl">
        <h3>References</h3>
        <ol>
            <xsl:apply-templates select="bibl"/>
        </ol>
    </xsl:template>
    <xsl:template match="bibl">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>



    <!-- This section processes the reviews/end notes for the document -->
    <xsl:template match="docReview">
        <div id="reviews">
            <xsl:apply-templates select="report"/>
        </div>
    </xsl:template>

    <xsl:template match="report">
        <div class="report">
            <xsl:choose>
                <xsl:when test="@type = 'peer'">
                    <h3>Peer review</h3>
                    <h4>
                        <xsl:value-of select="//docReview/reviewer"/>
                    </h4>

                </xsl:when>
                <xsl:when test="@type = 'instructor'">
                    <h3>Instructor Note</h3>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

</xsl:stylesheet>
