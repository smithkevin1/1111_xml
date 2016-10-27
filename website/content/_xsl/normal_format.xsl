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

    <xsl:template match="essay/body">
        <div id="text">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!--    <xsl:template match="body/div">
        <xsl:variable name="attribute-value" select="./@title"/>
        <div id="{$attribute-value}">
            <xsl:if test="./@title = true()">
                <h4>
                    <xsl:value-of select="./@title"/>
                </h4>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>-->



    <xsl:template match="essay/body/intro/p">
        <p class="intro">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="essay/body/bodyPara">
        <p class="bodyPara">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="essay/body/concl/p">
        <p class="concl">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="DOC//citation">
        <a class="cit" href="{@source}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="essay//q"> "<xsl:apply-templates/>" </xsl:template>

    <xsl:template match="DOC//note"><!-- template for rollover instructor and peer review notes -->
        <xsl:variable name="attribute-value" select="./@type"/>
        <xsl:choose>
            <xsl:when test="$attribute-value = 'instructor'">
                <sup>
                    <a href="#" data-tooltip="Instructor note: {text()}"
                        data-tooltip-position="bottom">[i.n.]</a>
                </sup>
            </xsl:when>
            <xsl:when test="$attribute-value != 'instructor'">
                <sup>
                    <a href="#" data-tooltip="Peer note: {text()}" data-tooltip-position="bottom">[p.n.]</a>
                </sup>
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
    
    <xsl:template match="DOC//figure">
        <figure>
            <img src="{@url}" alt="{child::text()}"/>
            <figcaption>
                <xsl:value-of select="child::text()"/>
            </figcaption>
        </figure>
    </xsl:template>
    <xsl:template match="DOC//list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="DOC//list/item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <!-- end essay templates -->
    <!-- G1: movie reviews -->
    <xsl:template match="DOC/movie_review">
        <div id="review">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="movie_review/header">
        <div id="review_header">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="movie_review/header/title[@type='title_review']">
        <h1 class="{@type}"><xsl:apply-templates/></h1>
    </xsl:template>
    <xsl:template match="movie_review/header/title[@type='title_movie']">
        <h3 class="{@type}"><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="movie_review/header/title[@type='photo_movie']">
        <figure>
            <img src="{text()}" alt=""/>
            <figcaption>
                <xsl:value-of select="//title[@type='title_movie']"/>
            </figcaption>
        </figure>
    </xsl:template>
    <xsl:template match="movie_review/header/author">
        <h3 class="{name()}"><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="movie_review/header/date">
        <p class="{@type}"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="movie_review/header/contact_info">
        <p class="{name()}"><xsl:apply-templates/></p>
    </xsl:template>
    

    
    
    <xsl:template match="movie_review/content">
        <div id="review_content">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="movie_review/content/intro_para">
        <p class="review_intro"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="movie_review/content/body">
        <div id="review_body"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="movie_review/content/body/p">
        <p class="review_body_p"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="movie_review/content/conclusion">
        <p class="review_conclusion"><xsl:apply-templates/></p>
    </xsl:template>
    
    <!-- G3: resume templates -->
    <xsl:template match="resume">
        <div id="resume">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="resume/title">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    <xsl:template match="resume//header">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="resume/contact_information">
        <ul id="contact">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="resume/contact_information/contact">
        <xsl:choose><xsl:when test="@type='email'">
            <li class="email_contact"><a href="mailto:{text()}"><xsl:apply-templates/></a></li>
        </xsl:when>
            <xsl:otherwise>
                <li class="{@type}_contact"><xsl:apply-templates/></li>
            </xsl:otherwise>
        </xsl:choose>      
    </xsl:template>
    <xsl:template match="resume/objectives">
        <p class="objectives">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="resume/qualifications">
        <div id="qualifications">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="resume//work_experience">
        <ul id="work_exp">
            <xsl:for-each select="job"><li><xsl:apply-templates/></li></xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="resume//affiliations">
        <ul id="affiliations">
            <xsl:for-each select="affiliation"><li><xsl:apply-templates/></li></xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="resume//education">
        <p class="education"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="resume//additional_information">
        <p class="additional_information"><xsl:apply-templates/></p>
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
