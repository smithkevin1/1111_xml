<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/main.css">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <div class="header-container">
            <header class="wrapper clearfix">
                <h1 class="title">AWD 3302: Project Files</h1>
                <nav>
                    <ul>
                        <li><a href="http://su16awd.kevingeraldsmith.com">Course Site</a></li>
                        <li><a href="http://su16awd.kevingeraldsmith.com/projects/crib_sheet.php">Element List</a></li>
                    </ul>
                </nav>
            </header>
        </div>

        <div class="main-container">
            <div class="main wrapper clearfix">

                <article>

                      <header>
                        <h2>Project 1</h1>
                      </header>
                      <section>
                        <p>
                          <ul class="students">
                            <?php
                            $proj=1;
                            include('list_students.php')
                            ?>
                          </ul>
                        </p>
                  </section>
                </article>
                <aside>
                    <h3>Project page</h3>
                    <p>This is a project page for AWD3302. As you complete individual writing projects 1-3, this page will be populated with links to the transformed views of the XML documents that you push to GitHub.</p>
                </aside>
                <article>

                      <header>
                        <h2>Project 2</h1>
                      </header>
                      <section>
                        <p>
                          <ul class="students">
                            <?php
                            $proj=2;
                            include('list_students.php')
                            ?>
                          </ul>
                        </p>
                  </section>
                </article>

<article>
                <header>
                  <h2>Project 3</h1>
                </header>
                <section>
                  <p>
                    <ul class="students">
                      <?php
                      $proj=3;
                      include('list_students.php')
                      ?>
                    </ul>
                  </p>
            </section>
          </article>


            </div> <!-- #main -->
        </div> <!-- #main-container -->

        <div class="footer-container">
            <footer class="wrapper">
                <h3></h3>
            </footer>
        </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.js"><\/script>')</script>

        <script src="js/main.js"></script>
    </body>
</html>
