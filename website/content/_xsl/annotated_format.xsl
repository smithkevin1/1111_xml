<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- <xsl:template match="DOC">
          TEMPORARY TEMPLATE FOR OFFLINE TESTING (REMEMBER TO DEACTIVATE)
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
    </xsl:template>
     DELETE AFTER TESTING -->

    <!-- test for genre root and call appropriate legend -->
    <xsl:template match="DOC">
        <xsl:if test="child::essay">
            <xsl:call-template name="essay_legend"/>
        </xsl:if>
        <xsl:if test="child::movie_review">
            <xsl:call-template name="any_other_root_legend"/>
        </xsl:if>
        <xsl:if test="child::article">
            <xsl:call-template name="any_other_root_legend"/>
        </xsl:if>
        <xsl:if test="child::op_ed">
            <xsl:call-template name="any_other_root_legend"/>
        </xsl:if>
        <xsl:if test="child::resume">
            <xsl:call-template name="any_other_root_legend"/>
        </xsl:if>
        <div id="contain">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:include href="normal_format.xsl"/> <!-- include normal format -->
    
    
    <!-- ESSAY structure -->
    <xsl:template match="essay//intro">
        <div id="ann_intro">
            <h3>Introduction</h3>
            <xsl:apply-templates/>
        </div>
        <h3>Body</h3>
    </xsl:template>
    <xsl:template match="essay//concl">
        <div id="ann_concl">
            <h3>Conclusion</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!-- essay annotations -->
    <xsl:template match="essay//p//*[not(self::q) and not(self::citation) and not(self::note)]">
        <xsl:if test="@type = true()">
            <span class="{name()} {@type}"> [<xsl:value-of select="name()"/> (type = <xsl:value-of
                    select="@type"/>): <xsl:apply-templates/>] </span>
        </xsl:if>
        <xsl:if test="@type = false()">
            <span class="{name()}"> [<xsl:value-of select="name()"/>: <xsl:apply-templates/>]
            </span>
        </xsl:if>
    </xsl:template>

    <xsl:template
        match="essay//bodyPara//*[not(self::q) and not(self::citation) and not(self::note)]">
        <xsl:if test="@type = true()">
            <span class="{name()} {@type}"> [<xsl:value-of select="name()"/> (type = <xsl:value-of
                    select="@type"/>): <xsl:apply-templates/>] </span>
        </xsl:if>
        <xsl:if test="@type = false()">
            <span class="{name()}"> [<xsl:value-of select="name()"/>: <xsl:apply-templates/>]
            </span>
        </xsl:if>
    </xsl:template>

    <!-- legend builds -->
    <xsl:template name="essay_legend">
        <div id="legend">
            <ul>
                <li class="scene"><strong>scene</strong>: indicates a scene, a place where
                    rhetorical interaction occurs in order to accomplish shared objective(s)</li>
                <li class="genre"><strong>genre</strong>: indicates a genre; a way of responding to
                    a situation that repeats itself within a scene</li>
                <li class="situation"><strong>situation</strong>: indicates the rhetorical
                    interactions happening within a scene, involving participants, subjects,
                    settings and purposes [can include participants and settings tags]</li>
                <li class="participants"><strong>participants</strong>: indicates participants, the
                    entities that are involved and active in a scene [can appear inside the
                    situation tag]</li>
                <li class="setting"><strong>setting</strong>: indicates the location and
                    surroundings in which a scene takes place [can appear inside the situation
                    tag]</li>
                <li class="context"><strong>context</strong>: indicates information provided to
                    better understand a claim, argument, or idea. Typically precedes an idea, claim
                    or argument that warrant background info</li>
                <li class="aesthetics"><strong>aesthetics</strong>: indicates aesthetic elements of
                    a composition, including pictures, font styles, colors, other material
                    properties, etc.</li>
                <li class="sim"><strong>sim</strong>: (similarities) indicates text that points to
                    similarities between two or more texts [can optionally contain any other essay
                    content elements]</li>
                <li class="diff"><strong>diff</strong>: (differences) indicates text that points to
                    differences between two or more texts [can optionally contain any other essay
                    content elements]</li>
                <li class="argument"><strong>argument</strong>: (interpretive claim/argument)
                    indicates a claim/argument made based on evidence presented or to be presented
                    in an essay [requires @type attribute, values of 'main,' 'supporting,' or
                    'opposing']</li>
                <li class="evidence"><strong>evidence</strong>: (evidence) indicates evidence in
                    support of a claim or argument</li>
                <li class="pattern"><strong>pattern</strong>: (generic pattern) indicates an
                    identifiable trait, characteristic, and/or example of a pattern within a genre
                    [requires @type attribute of user-defined value]</li>
            </ul>
        </div>
    </xsl:template>
    <xsl:template name="any_other_root_legend"><!-- format for legend builds -->
        <div id="legend">
            <li class="element"><strong>element</strong>: documentation</li>
        </div>
    </xsl:template>


    <!--    <xsl:template match="essay//pattern">
        <span class="pattern {@type}"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="essay//claim">
        <span class="claim {@type}"><xsl:apply-templates/></span>
    </xsl:template>-->

</xsl:stylesheet>
