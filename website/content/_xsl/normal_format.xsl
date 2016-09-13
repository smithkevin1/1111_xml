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

    <xsl:template match="DOC/docHead">
        <div id="head">
            <h3>Title: <xsl:value-of select="./title"/></h3>
            <h3>Author: <xsl:value-of select="./author"/></h3>
            <h4>Date: <xsl:value-of select="version"/></h4>

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
    <xsl:template match="DOC//annotated_bib">
        <div id="text">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="annotated_bib//problem_stmt">
        <p class="problem">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="DOC//citation">
        <p class="citation">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="DOC//title[not(parent::blog_post)]">
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

    <xsl:template match="annotated_bib//annotation">
        <p class="annotation">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="annotated_bib//p">
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
                    <a href="#" data-tooltip="{$get_id}: {text()}" data-tooltip-position="bottom"
                        >[p.n.]</a>
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
    <!-- templates for blog posts -->
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
    <xsl:template match="DOC//blog_post">
        <div id="blog_post">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="blog_post/title">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="blog_post//background">
        <div class="blog.background">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="blog_post//answer">
        <div class="blog.answer">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="blog_post//hr">
        <hr/>
    </xsl:template>
    <!-- global elements -->
    <xsl:template match="blog_post//pb">
        <br/>
        <br/>
    </xsl:template>
    <xsl:template match="blog_post//visual">
        <figure>
            <img src="{@url}" alt="{child::text()}"/>
            <figcaption>
                <xsl:value-of select="child::text()"/>
            </figcaption>
        </figure>
    </xsl:template>
    <xsl:template match="blog_post//ref">
        <a href="{@url}" alt="{@type}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="blog_post//section_header[not(ancestor::list)]">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <xsl:template match="blog_post//important_idea">
        <span class="italics">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="blog_post//list">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="blog_post//list//pb">
        <br/>
    </xsl:template>
    <xsl:template match="blog_post//list//section_header">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>
    <!-- templates for feasibility reports -->
    <xsl:template match="DOC//fsb_rpt">
        <div id="fsb_rpt">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt//pb">
        <br/>
        <br/>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[1]">
        <div class="page" id="title">
            <h1>
                <xsl:value-of select="title"/>
            </h1>
            <h3>
                <xsl:value-of select="subTitle"/>
            </h3>
            <p>
                <xsl:value-of select="contributors"/>
            </p>
            <p>
                <xsl:value-of select="date"/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[@type = 'tbl_contents']">
        <div class="page" id="tbl_contents">
            <h3>Table of Contents</h3>
            <ul>
                <xsl:for-each select="sect">
                    <xsl:choose>
                        <xsl:when test="@lvl = false() or @lvl = 1">
                            <li>
                                <xsl:value-of select="text()"/>
                            </li>
                        </xsl:when>
                        <xsl:when test="@lvl = 2">
                            <ul>
                                <xsl:if test="@n = 1">
                                    <li>A. <xsl:value-of select="text()"/></li>
                                </xsl:if>
                                <xsl:if test="@n = 2">
                                    <li>B. <xsl:value-of select="text()"/></li>
                                </xsl:if>
                                <xsl:if test="@n = 3">
                                    <li>C. <xsl:value-of select="text()"/></li>
                                </xsl:if>
                                <xsl:if test="@n = 4">
                                    <li>D. <xsl:value-of select="text()"/></li>
                                </xsl:if>
                                <xsl:if test="@n = 5">
                                    <li>E. <xsl:value-of select="text()"/></li>
                                </xsl:if>
                            </ul>
                        </xsl:when>
                        <xsl:otherwise>
                            <ul>
                                <ul>
                                    <xsl:if test="@n = 1">
                                        <li>1. <xsl:value-of select="text()"/></li>
                                    </xsl:if>
                                    <xsl:if test="@n = 2">
                                        <li>2. <xsl:value-of select="text()"/></li>
                                    </xsl:if>
                                    <xsl:if test="@n = 3">
                                        <li>3. <xsl:value-of select="text()"/></li>
                                    </xsl:if>
                                    <xsl:if test="@n = 4">
                                        <li>4. <xsl:value-of select="text()"/></li>
                                    </xsl:if>
                                    <xsl:if test="@n = 5">
                                        <li>5. <xsl:value-of select="text()"/></li>
                                    </xsl:if>
                                </ul>
                            </ul>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[@type = 'exec_sum']">
        <div class="page" id="exec_sum">
            <h3>Executive Summary</h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[@type = 'pre_req_ana']">
        <div class="page" id="pre_req_ana">
            <h3>Preliminary requirements analysis</h3>
            <xsl:for-each select="child::*">
                <xsl:choose>
                    <xsl:when test="@title = true()">
                        <p><span class="italics"><xsl:value-of select="@title"/></span>:
                            <xsl:apply-templates/></p>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>
                            <xsl:apply-templates/>
                        </p>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[@type = 'fsb']">
        <div class="page" id="fsb">
            <h3>Feasibility</h3>
            <xsl:for-each select="child::*">
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="page//app_ovr"/>
    <xsl:template match="fsb_rpt/page[@type = 'sccs_crt']">
        <div class="page" id="sccs_crt">
            <h3>Success criteria</h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt//req_sect">
        <span class="underline">
            <xsl:value-of select="child::text()[not(ancestor-or-self::req)]"/>
        </span>
        <ul>
            <xsl:for-each select="req">
                <xsl:choose>
                    <xsl:when test="@title = true()">
                        <li><span class="italics"><xsl:value-of select="@title"/></span>:
                            <xsl:apply-templates/></li>
                    </xsl:when>
                    <xsl:otherwise>
                        <li>
                            <xsl:apply-templates/>
                        </li>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="fsb_rpt/page[@type = 'dsn']">
        <div class="page" id="dsn">
            <h3>Design</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt//img">
        <figure>
            <img src="{@url}" alt="{child::text()}"/>
            <figcaption>
                <xsl:value-of select="child::text()"/>
            </figcaption>
        </figure>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[@type = 'cost']">
        <div class="page" id="cost">
            <h3>Cost Estimates</h3>
            <xsl:for-each select="child::*">

                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[@type = 'rpt']">
        <div class="page" id="rpt">
            <h3>Report</h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="tmln">
        <li>
            <strong><xsl:value-of select="@date"/>: </strong>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[@type = 'rsk_ana']">
        <div class="page" id="rsk_ana">
            <h3>Risk Analysis</h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[@type = 'fnc']">
        <div class="page" id="fnc">
            <h3>Financial</h3>
            <xsl:for-each select="child::*">
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="fsb_rpt/page[@type = 'conc']">
        <div class="page" id="conc">
            <h3>Conclusion</h3>
            <xsl:for-each select="child::*">
                <p>
                    <xsl:apply-templates/>
                </p>

            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- templates for public initiative proposals -->
    <xsl:template match="pub_init_proposal">
        <div id="proposal">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="pub_init_proposal/cover_page">
        <div class="page" id="cover">
            <h3>
                <xsl:value-of select="./title"/>
            </h3>
            <ul style="list-style-type:none">
                <li>
                    <strong>
                        <xsl:value-of select="author"/>
                    </strong>
                </li>
                <li>
                    <xsl:value-of select="submit_date"/>
                </li>
                <li>Attention to: <xsl:value-of select="audience"/></li>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="pub_init_proposal/tbl_cont">
        <div class="page" id="tbl_cont">
            <h3>Table of Contents</h3>
            <ul>
                <xsl:for-each select="section">
                    <li>
                        <xsl:value-of select="text()"/>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="pub_init_proposal//p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="pub_init_proposal/intro">
        <div class="page" id="intro">
            <h3>
                <xsl:value-of select="@type"/>
            </h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="pub_init_proposal/background">
        <div class="page" id="background">
            <h3>Background</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="pub_init_proposal/purpose">
        <div class="page" id="purpose">
            <h3>Purpose</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="pub_init_proposal/approach">
        <div class="page" id="approach">
            <h3>Approach</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="pub_init_proposal/feasibility">
        <div class="page" id="feasibility">
            <h3>Feasibility</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="pub_init_proposal/conclu">
        <div class="page" id="conclusion">
            <h3>Conclusion</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="pub_init_proposal/references">
        <div class="page" id="references">
            <h3>References</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <!-- templates for cover letters -->
    <xsl:template match="cover_letter//pb[not(ancestor::list)]">
        <br/>
        <br/>
    </xsl:template>
    <xsl:template match="cover_letter">
        <div id="cover_letter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="cover_letter/header">
        <div class="header">
            <ul style="list-style-type:none;">
                <xsl:apply-templates/>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="cover_letter/header/name">
        <li>
            <strong>
                <xsl:apply-templates/>
            </strong>
        </li>
    </xsl:template>
    <xsl:template match="cover_letter//contact">
        <xsl:choose>
            <xsl:when test="@url=true()">
                <li>
                    <a href="{@url}"><xsl:apply-templates/></a>
                </li>
            </xsl:when>
            <xsl:otherwise>
                <li>
                    <xsl:apply-templates/>
                </li>
            </xsl:otherwise>
            
        </xsl:choose>
    </xsl:template>
    <xsl:template match="cover_letter//contact/@url"/>
    <xsl:template match="cover_letter//greeting">
        <p class="greeting">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="cover_letter//intro_para">
        <p class="intro">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="cover_letter//para_background">
        <p class="background">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="cover_letter//para_closing">
        <p class="closing">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="cover_letter//signature">
        <ul style="list-style-type:none;">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="cover_letter//signature/salutation | name">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="cover_letter//img">
        <figure>
            <img src="{@url}" alt="{child::text()}"/>
        </figure>
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
