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
        <!--
            <!-\- DELETE After testing (until /head) -\->
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
            </head>-->
        <xsl:if test="child::essay">
            <xsl:call-template name="essay_legend"/>
        </xsl:if>
        <xsl:if test="child::movie_review">
            <xsl:call-template name="review_legend"/>
        </xsl:if>
        <xsl:if test="child::article">
            <xsl:call-template name="article_legend"/>
        </xsl:if>
        <xsl:if test="child::op_ed">
            <xsl:call-template name="op_legend"/>
        </xsl:if>
        <xsl:if test="child::resume">
            <xsl:call-template name="any_other_root_legend"/>
        </xsl:if>

        <!-- DELETE body after testing -->
        <div id="contain">
            <xsl:apply-templates/>
        </div>


    </xsl:template>

    <xsl:include href="normal_format.xsl"/>
    <!-- include normal format -->


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

    <!-- moview review annotations -->
    <xsl:template
        match="movie_review//intro/p/*[not(self::quotes) and not(self::citation) and not(self::note) and not(self::figure) and not(self::style)]">
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
        match="movie_review//body/p/*[not(self::quotes) and not(self::citation) and not(self::note) and not(self::figure) and not(self::style)]">
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
        match="movie_review//conclusion/p/*[not(self::quotes) and not(self::citation) and not(self::note) and not(self::figure) and not(self::style)]">
        <xsl:if test="@type = true()">
            <span class="{name()} {@type}"> [<xsl:value-of select="name()"/> (type = <xsl:value-of
                    select="@type"/>): <xsl:apply-templates/>] </span>
        </xsl:if>
        <xsl:if test="@type = false()">
            <span class="{name()}"> [<xsl:value-of select="name()"/>: <xsl:apply-templates/>]
            </span>
        </xsl:if>
    </xsl:template>

    <!-- satirical article annotation -->
    <xsl:template match="article//quote">
        <span class="{name()}"> [<xsl:value-of select="name()"/>: <xsl:apply-templates/>] </span>
    </xsl:template>
    <xsl:template match="article//source">
        <span class="{name()}"> [<xsl:value-of select="name()"/>: <xsl:apply-templates/>] </span>
    </xsl:template>

    <!-- op_ed annotations -->
    <xsl:template
        match="op_ed//intro/p/*[not(self::quote) and not(self::citation) and not(self::note) and not(self::figure) and not(self::picture) and not(self::style)]">
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
        match="
            op_ed//body_para/*[not(self::quote) and not(self::citation) and not(self::note) and not(self::figure)
            and not(self::picture) and not(self::style)]">
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
        match="op_ed//p/*[not(self::quote) and not(self::citation) and not(self::note) and not(self::figure) and not(self::picture) and not(self::style)]">
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

    <xsl:template name="review_legend">
        <div id="legend">
            <ul>
                <li class="synopsis"><strong>synopsis</strong>: Paragraph summarising the movie plot
                    points, themes. Can be used in intro, or under p [requires @type attribute]</li>
                <li class="context"><strong>context</strong>: Can be separate element if not placed
                    in the same paragraph as synopsis, contains the information required to
                    understand the movie such as who the actors are and their roles, the director
                    and his role, and the optional attribute of the history of the franchise (if
                    franchise). This tag can be used anywhere, within any other tag. </li>
                <li class="opinions"><strong>opinions</strong>: Direct author's argument that may or
                    may not be based on drawn out analysis. A movie review may contain more than one
                    opinion tag. This tag can be used anywhere, within any other tag</li>
                <li class="comparison"><strong>comparison</strong>: A direct comparison between a
                    medium of choice according to the author. The type attribute being book, if the
                    movie is based off a book, or another movie </li>
                <li class="aesthetics"><strong>aesthetics</strong>: The analysis of the production
                    quality that focuses on the visual cinematography, the music score, the
                    locations and scenery and everything that does not include the story plot
                    elements </li>
                <li class="summary"><strong>summary</strong>: Contains optional attributes gross
                    income, rating and release date; usually ties up the analysis in a succinct
                    fashion, oftentimes summarizing the main opinion with a rating scale of the
                    movie. Can only be within conclusion</li>
                <li class="date"><strong>date</strong>: Element for the date of the review, or the
                    date of movie premiere</li>
            </ul>
        </div>
    </xsl:template>
    <xsl:template name="article_legend">
        <div id="legend">
            <ul>
                <li class="quote"><strong>quote</strong>: Surrounded by quotation marks, a grouping
                    of words, ranging from phrases to multiples sentences.</li>
            </ul>
            <ul>
                <li class="source"><strong>source</strong>: Attributing information from a specific
                    website or a person without having direct quotes. Typically any source given
                    would be fake, or, if the source was real, then the information from there would
                    be fake.</li>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="op_legend">
        <div id="legend">
            <ul>
                <li class="opinion"><strong>opinion</strong>: Element that contains the author’s
                    stance on a certain subject or situation. This tag can be used anywhere, within
                    any other tag. [Has the following @types: main: The main opinion on which the Op
                    Ed is based around; opposing : An opinion that directly opposes the author’s
                    main opinion; general: A general tag for most types of opinions; critique: An
                    opinion on how the author thinks the situation could be improved. </li>
                <li class="evidence"><strong>evidence</strong>: Container element for evidence that
                    supports any of the types of opinions. This tag can be used anywhere, within any
                    other tag, even within itself. [Has the following types: @statistics: Any type
                    of statistics or numbers relating to relevant information. @anecdote: Describes
                    personal experience of the author or of other people. @supporting: General tag
                    for evidence that supports an opinion.] </li>
                <li class="bg_info"><strong>bg_info</strong>: (background information) Container
                    element of background information that helps the reader to understand a certain
                    topic. This tag can be used anywhere, within any other tag. </li>
                <li class="example"><strong>example</strong>: An example used to express the main
                    opinion (removed in p3 revisions)</li>
                <li class="situation"><strong>situation</strong>: (rhetorical situation) This tag
                    describes an event that relates to the author’s main opinion. It is tied to the
                    reason the author is writing the Op Ed. This tag can be used anywhere, within
                    any tag. </li>
            </ul>
        </div>
    </xsl:template>
    <xsl:template name="any_other_root_legend">
        <div id="legend">
            <ul>
                <li class="element"><strong>annotations</strong>: none</li>
            </ul>
        </div>
    </xsl:template>



    <!--    <xsl:template match="essay//pattern">
        <span class="pattern {@type}"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="essay//claim">
        <span class="claim {@type}"><xsl:apply-templates/></span>
    </xsl:template>-->

</xsl:stylesheet>
