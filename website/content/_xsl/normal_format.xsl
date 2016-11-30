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

    <xsl:template match="DOC//note">
        <!-- template for rollover instructor and peer review notes -->
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
                    <a href="#" data-tooltip="Peer note: {text()}" data-tooltip-position="bottom"
                        >[p.n.]</a>
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
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <!-- end essay templates -->

    <!-- G1: movie reviews -->
    <xsl:template match="DOC/movie_review">
        <div id="review" class="root">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="movie_review/header">
        <div id="review_header">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="movie_review/header/title[@type = 'title_review']">
        <h1 class="{@type}">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <!--    <xsl:template match="movie_review/header/title[@type = 'title_movie']">
        <p class="{@type}">
            <strong><xsl:apply-templates/></strong>
        </p>
    </xsl:template>-->
    <xsl:template match="movie_review/header/title[@type = 'title_movie']"/>
    <xsl:template match="movie_review/header/title[@type = 'photo_movie']">
        <figure>
            <img src="{text()}" alt=""/>
            <figcaption>
                <xsl:value-of select="//title[@type = 'title_movie']"/>
            </figcaption>
        </figure>
        <hr/>
    </xsl:template>
    <xsl:template match="movie_review/header/author">
        <p class="{name()}">
            <strong><xsl:apply-templates/></strong> | <a href="mailto:{../contact_info[text()]}"
                    ><xsl:value-of select="../contact_info"/></a> | <xsl:value-of
                select="../date[@type = 'review_date']"/>
        </p>

        <hr/>
    </xsl:template>
    <xsl:template match="movie_review/header/date[@type = 'review_date']"/>
    <xsl:template match="movie_review/header/date[@type = 'movie_premiere']">
        <p class="{@type}">
            <span class="italics"><xsl:value-of select="../title[@type = 'title_movie']"/> premieres
                on <xsl:apply-templates/></span>
        </p>
    </xsl:template>

    <xsl:template match="movie_review/header/contact_info"/>




    <xsl:template match="movie_review/content">
        <div id="review_content">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="movie_review/content/intro">
        <div id="review_intro">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="movie_review/content/intro/p">
        <p class="review_intro">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="movie_review/content/body">
        <div id="review_body">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="movie_review/content/body/p">
        <p class="review_body_p">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="movie_review/content/conclusion">
        <div id="review_concl"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="movie_review/content/conclusion/p">
        <p class="review_conclusion">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- G2: satirical article templates -->
    <xsl:template match="article">
        <div id="article" class="root">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="article/header">
        <div id="article_header">
            <h1 id="article_title">
                <xsl:value-of select="article_title"/>
            </h1>
            <!--<h3>
                <xsl:value-of select="author"/>
            </h3>-->
            <div id="article_data">
                <p>
                    <a href="#"><xsl:value-of select="category"/></a> | <xsl:value-of select="date"
                    /> | VOL <xsl:value-of select="identification[@type = 'volume']"/> ISSUE
                        <xsl:value-of select="identification[@type = 'issue']"/>
                </p>
                <p>
                    <xsl:for-each select="tags">
                        <a href="#">
                            <xsl:value-of select="text()"/>
                            <xsl:text> </xsl:text>
                        </a>
                    </xsl:for-each>
                </p>
                <hr/>
                <!--<div id="share" style="display:inline-block;">
                <a href="http://facebook.com"><img src="https://cdn1.iconfinder.com/data/icons/logotypes/32/square-facebook-512.png" alt="share"/></a>
                <a href="http://twitter.com"><img src="http://1img.org/wp-content/uploads/2015/09/twitter-icon-2.jpg" alt="share"/></a>
                <a href="mailto:{text()}"><img src="http://www.freeiconspng.com/uploads/iconmonstr-email-4-icon-27.png" alt="email"/></a>
            </div>-->
                <!-- Sharingbutton Facebook -->
                <div id="sharing">
                    <a class="resp-sharing-button__link"
                        href="https://facebook.com/sharer/sharer.php?u={text()}" target="_blank"
                        aria-label="Facebook">
                        <div
                            class="resp-sharing-button resp-sharing-button--facebook resp-sharing-button--medium"
                                ><div aria-hidden="true"
                                class="resp-sharing-button__icon resp-sharing-button__icon--solid">
                                <svg version="1.1" x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24" enable-background="new 0 0 24 24" xml:space="preserve">
        <g>
            <path d="M18.768,7.465H14.5V5.56c0-0.896,0.594-1.105,1.012-1.105s2.988,0,2.988,0V0.513L14.171,0.5C10.244,0.5,9.5,3.438,9.5,5.32 v2.145h-3v4h3c0,5.212,0,12,0,12h5c0,0,0-6.85,0-12h3.851L18.768,7.465z"/>
        </g>
    </svg></div>Facebook</div>
                    </a>

                    <!-- Sharingbutton Twitter -->
                    <a class="resp-sharing-button__link"
                        href="https://twitter.com/intent/tweet/?text=This%20article%20is%20great;url={share[@type='facebook']/text()}"
                        target="_blank" aria-label="Twitter">
                        <div
                            class="resp-sharing-button resp-sharing-button--twitter resp-sharing-button--medium"
                                ><div aria-hidden="true"
                                class="resp-sharing-button__icon resp-sharing-button__icon--solid">
                                <svg version="1.1" x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24" enable-background="new 0 0 24 24" xml:space="preserve">
        <g>
            <path d="M23.444,4.834c-0.814,0.363-1.5,0.375-2.228,0.016c0.938-0.562,0.981-0.957,1.32-2.019c-0.878,0.521-1.851,0.9-2.886,1.104 C18.823,3.053,17.642,2.5,16.335,2.5c-2.51,0-4.544,2.036-4.544,4.544c0,0.356,0.04,0.703,0.117,1.036 C8.132,7.891,4.783,6.082,2.542,3.332C2.151,4.003,1.927,4.784,1.927,5.617c0,1.577,0.803,2.967,2.021,3.782 C3.203,9.375,2.503,9.171,1.891,8.831C1.89,8.85,1.89,8.868,1.89,8.888c0,2.202,1.566,4.038,3.646,4.456 c-0.666,0.181-1.368,0.209-2.053,0.079c0.579,1.804,2.257,3.118,4.245,3.155C5.783,18.102,3.372,18.737,1,18.459 C3.012,19.748,5.399,20.5,7.966,20.5c8.358,0,12.928-6.924,12.928-12.929c0-0.198-0.003-0.393-0.012-0.588 C21.769,6.343,22.835,5.746,23.444,4.834z"/>
        </g>
    </svg></div>Twitter</div>
                    </a>

                    <!-- Sharingbutton E-Mail -->
                    <a class="resp-sharing-button__link"
                        href="https://twitter.com/intent/tweet/?text=This%20article%20is%20great;body={text()}"
                        target="_self" aria-label="E-Mail">
                        <div
                            class="resp-sharing-button resp-sharing-button--email resp-sharing-button--medium"
                                ><div aria-hidden="true"
                                class="resp-sharing-button__icon resp-sharing-button__icon--solid">
                                <svg version="1.1" x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24" enable-background="new 0 0 24 24" xml:space="preserve">
        <path d="M22,4H2C0.897,4,0,4.897,0,6v12c0,1.103,0.897,2,2,2h20c1.103,0,2-0.897,2-2V6C24,4.897,23.103,4,22,4z M7.248,14.434 l-3.5,2C3.67,16.479,3.584,16.5,3.5,16.5c-0.174,0-0.342-0.09-0.435-0.252c-0.137-0.239-0.054-0.545,0.186-0.682l3.5-2 c0.24-0.137,0.545-0.054,0.682,0.186C7.571,13.992,7.488,14.297,7.248,14.434z M12,14.5c-0.094,0-0.189-0.026-0.271-0.08l-8.5-5.5 C2.997,8.77,2.93,8.46,3.081,8.229c0.15-0.23,0.459-0.298,0.691-0.147L12,13.405l8.229-5.324c0.232-0.15,0.542-0.084,0.691,0.147 c0.15,0.232,0.083,0.542-0.148,0.691l-8.5,5.5C12.189,14.474,12.095,14.5,12,14.5z M20.934,16.248 C20.842,16.41,20.673,16.5,20.5,16.5c-0.084,0-0.169-0.021-0.248-0.065l-3.5-2c-0.24-0.137-0.323-0.442-0.186-0.682 s0.443-0.322,0.682-0.186l3.5,2C20.988,15.703,21.071,16.009,20.934,16.248z"/>
    </svg></div>E-Mail</div>
                    </a>

                </div>
                <hr/>
            </div>

        </div>
    </xsl:template>
    <xsl:template match="article/body">
        <div id="article_body">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="article/body/image">
        <figure>
            <img src="{@url}" alt="{child::text()}"/>
            <figcaption>
                <xsl:value-of select="child::text()"/>
            </figcaption>
        </figure>
    </xsl:template>
    <xsl:template match="article/body/p">
        <p class="article_p">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="article/body/p[1]/location">
        <span class="caps"><xsl:apply-templates/>--</span>
    </xsl:template>
    <xsl:template match="footer">
        <div id="article_footer">
            <hr/>
            <p>SHARE THIS STORY: </p>
            <!-- Sharingbutton Facebook -->
            <a class="resp-sharing-button__link"
                href="https://facebook.com/sharer/sharer.php?u={text()}" target="_blank"
                aria-label="Facebook">
                <div
                    class="resp-sharing-button resp-sharing-button--facebook resp-sharing-button--medium"
                        ><div aria-hidden="true"
                        class="resp-sharing-button__icon resp-sharing-button__icon--solid">
                        <svg version="1.1" x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24" enable-background="new 0 0 24 24" xml:space="preserve">
        <g>
            <path d="M18.768,7.465H14.5V5.56c0-0.896,0.594-1.105,1.012-1.105s2.988,0,2.988,0V0.513L14.171,0.5C10.244,0.5,9.5,3.438,9.5,5.32 v2.145h-3v4h3c0,5.212,0,12,0,12h5c0,0,0-6.85,0-12h3.851L18.768,7.465z"/>
        </g>
    </svg></div>Facebook</div>
            </a>

            <!-- Sharingbutton Twitter -->
            <a class="resp-sharing-button__link"
                href="https://twitter.com/intent/tweet/?text=This%20article%20is%20great;url={share[@type='facebook']/text()}"
                target="_blank" aria-label="Twitter">
                <div
                    class="resp-sharing-button resp-sharing-button--twitter resp-sharing-button--medium"
                        ><div aria-hidden="true"
                        class="resp-sharing-button__icon resp-sharing-button__icon--solid">
                        <svg version="1.1" x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24" enable-background="new 0 0 24 24" xml:space="preserve">
        <g>
            <path d="M23.444,4.834c-0.814,0.363-1.5,0.375-2.228,0.016c0.938-0.562,0.981-0.957,1.32-2.019c-0.878,0.521-1.851,0.9-2.886,1.104 C18.823,3.053,17.642,2.5,16.335,2.5c-2.51,0-4.544,2.036-4.544,4.544c0,0.356,0.04,0.703,0.117,1.036 C8.132,7.891,4.783,6.082,2.542,3.332C2.151,4.003,1.927,4.784,1.927,5.617c0,1.577,0.803,2.967,2.021,3.782 C3.203,9.375,2.503,9.171,1.891,8.831C1.89,8.85,1.89,8.868,1.89,8.888c0,2.202,1.566,4.038,3.646,4.456 c-0.666,0.181-1.368,0.209-2.053,0.079c0.579,1.804,2.257,3.118,4.245,3.155C5.783,18.102,3.372,18.737,1,18.459 C3.012,19.748,5.399,20.5,7.966,20.5c8.358,0,12.928-6.924,12.928-12.929c0-0.198-0.003-0.393-0.012-0.588 C21.769,6.343,22.835,5.746,23.444,4.834z"/>
        </g>
    </svg></div>Twitter</div>
            </a>

            <!-- Sharingbutton E-Mail -->
            <a class="resp-sharing-button__link"
                href="https://twitter.com/intent/tweet/?text=This%20article%20is%20great;body={text()}"
                target="_self" aria-label="E-Mail">
                <div
                    class="resp-sharing-button resp-sharing-button--email resp-sharing-button--medium"
                        ><div aria-hidden="true"
                        class="resp-sharing-button__icon resp-sharing-button__icon--solid">
                        <svg version="1.1" x="0px" y="0px" width="24px" height="24px" viewBox="0 0 24 24" enable-background="new 0 0 24 24" xml:space="preserve">
        <path d="M22,4H2C0.897,4,0,4.897,0,6v12c0,1.103,0.897,2,2,2h20c1.103,0,2-0.897,2-2V6C24,4.897,23.103,4,22,4z M7.248,14.434 l-3.5,2C3.67,16.479,3.584,16.5,3.5,16.5c-0.174,0-0.342-0.09-0.435-0.252c-0.137-0.239-0.054-0.545,0.186-0.682l3.5-2 c0.24-0.137,0.545-0.054,0.682,0.186C7.571,13.992,7.488,14.297,7.248,14.434z M12,14.5c-0.094,0-0.189-0.026-0.271-0.08l-8.5-5.5 C2.997,8.77,2.93,8.46,3.081,8.229c0.15-0.23,0.459-0.298,0.691-0.147L12,13.405l8.229-5.324c0.232-0.15,0.542-0.084,0.691,0.147 c0.15,0.232,0.083,0.542-0.148,0.691l-8.5,5.5C12.189,14.474,12.095,14.5,12,14.5z M20.934,16.248 C20.842,16.41,20.673,16.5,20.5,16.5c-0.084,0-0.169-0.021-0.248-0.065l-3.5-2c-0.24-0.137-0.323-0.442-0.186-0.682 s0.443-0.322,0.682-0.186l3.5,2C20.988,15.703,21.071,16.009,20.934,16.248z"/>
    </svg></div>E-Mail</div>
            </a>
            <xsl:if test="child::related_links">
                <p>RELATED LINKS: <xsl:for-each select="related_links">
                        <a href="{@url}">
                            <xsl:value-of select="text()"/>
                        </a>
                    </xsl:for-each>
                    <!--<xsl:for-each select="ad">
                    <figure>
                        <img src="{@url}" alt="{child::text()}"/>
                        <figcaption>
                            <xsl:value-of select="child::text()"/>
                        </figcaption>
                    </figure>
                </xsl:for-each>-->
                </p>
            </xsl:if>

        </div>
    </xsl:template>

    <!-- G3: op-ed templates -->
    <xsl:template match="op_ed">
        <div id="op_ed" class="root">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="DOC/op_ed/docHead">
        <div id="op_header">
            <h1 id="op_title">
                <xsl:value-of select="./title"/>
            </h1>
            <hr/>
            <p>
                <xsl:value-of select="./author"/> | <xsl:value-of select="./date"/>
            </p>
            <hr/>

        </div>
    </xsl:template>
    <xsl:template match="DOC/op_ed/header">
        <div id="op_header">
            <h1 id="op_title">
                <xsl:value-of select="./title"/>
            </h1>
            <hr/>
            <p>
                <xsl:value-of select="./author"/> | <xsl:value-of select="./date"/>
            </p>
            <hr/>
            
        </div>
    </xsl:template>
    <xsl:template match="op_ed/intro">
        <div id="op_intro">
            <p class="intro">
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="op_ed/body/p[@type='intro']">
        <div id="op_intro">
            <p class="intro">
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>

    <xsl:template match="op_ed/body_para">
        <p class="op_body">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="op_ed/body/p[@type='body']">
        <p class="op_body">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="op_ed//picture">
        <figure>
            <img src="{@url}" alt="{child::text()}"/>
            <figcaption>
                <xsl:value-of select="child::text()"/>
            </figcaption>
        </figure>
    </xsl:template>
    <xsl:template match="op_ed/conclusion">
        <p class="op_concl">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="op_ed/body/p[@type='conclusion']">
        <p class="op_concl">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="op_ed//source">
        <ul>
            <xsl:for-each select="citation">
                <li><a href="{text()}"><xsl:apply-templates/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <!-- G4: resume templates -->
    <xsl:template match="resume">
        <div id="resume" class="root">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="resume/title">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="resume//header">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <xsl:template match="resume/contact_information">
        <ul id="contact">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="resume/contact_information/contact">
        <xsl:choose>
            <xsl:when test="@type = 'email'">
                <li class="email_contact">
                    <a href="mailto:{text()}">
                        <xsl:apply-templates/>
                    </a>
                </li>
            </xsl:when>
            <xsl:otherwise>
                <li class="{@type}_contact">
                    <xsl:apply-templates/>
                </li>
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
        <div id="work_exp">
            <xsl:for-each select="job">
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="job_title">
        <div class="job_head">
            <strong>
                <xsl:value-of select="text()[1]"/>
            </strong>
            <span class="resume_date">
                <xsl:value-of select="job_date"/>
            </span>
            <br/>
            <span class="resume_location">
                <xsl:value-of select="text()[2]"/>
            </span>
        </div>
        <ul>
            <xsl:for-each select="following-sibling::job_summary"><li>
                <xsl:value-of select="text()"/>
            </li></xsl:for-each>
        </ul>
        
    </xsl:template>
    <xsl:template match="job_summary"/>
<!--    <xsl:template match="job_summary">
        <ul>
            <xsl:for-each select="../job_summary">
                <li>
                    <xsl:value-of select="text()"/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>-->
    <xsl:template match="resume//affiliations">
        <ul id="affiliations">
            <xsl:for-each select="affiliation">
                <li>
                    <xsl:apply-templates/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="resume//education">
        <p class="education">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="resume//additional_information[1]">
        <ul>
            <xsl:for-each select="../additional_information">
                <li class="additional_informatio">
                    <xsl:apply-templates/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="resume//additional_information[position()>1]"/>


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
