<?php
if(isset($proj)) {
  echo
  '<li><a href=\'project_page.php?id=test&proj=' .$proj. '\'>Example file</a></li>
  <li><a href=\'project_page.php?id=al.su&proj=' .$proj. '\'>Sultan Abdullah Aldabal</a></li>
  <li><a href=\'project_page.php?id=bu.an&proj=' .$proj. '\'>Andrew Burcham</a></li>
  <li><a href=\'project_page.php?id=ch.an&proj=' .$proj. '\'>Anders Chen</a></li>
  <li><a href=\'project_page.php?id=dh.mo&proj=' .$proj. '\'>Mohit Dhinakaran
</a></li>
  <li><a href=\'project_page.php?id=ga.ar&proj=' .$proj. '\'>Arlen Gaba</a></li>
  <li><a href=\'project_page.php?id=ho.jo&proj=' .$proj. '\'>Jack Hoyt</a></li>
  <li><a href=\'project_page.php?id=ko.di&proj=' .$proj. '\'>Divit Koradia</a></li>
  <li><a href=\'project_page.php?id=li.em&proj=' .$proj. '\'>Emma Lindberg</a></li>
  <li><a href=\'project_page.php?id=lo.va&proj=' .$proj. '\'>Valentina Longcroft</a></li>
  <li><a href=\'project_page.php?id=mi.as&proj=' .$proj. '\'>Ashwin Misra</a></li>
  <li><a href=\'project_page.php?id=ro.dy&proj=' .$proj. '\'>Dylan Robinson</a></li>
  <li><a href=\'project_page.php?id=sa.jh&proj=' .$proj. '\'>Jhadley Sanchez</a></li>
  <li><a href=\'project_page.php?id=to.fr&proj=' .$proj. '\'>Francheska Torres</a></li>
  <li><a href=\'project_page.php?id=we.sp&proj=' .$proj. '\'>Spencer Webb</a></li>';
  }
elseif(isset($_GET['proj'])) {
  $proj = $_GET['proj'];
  echo
  '<li><a href=\'project_page.php?id=test&proj=' .$proj. '\'>Example file</a></li>
  <li><a href=\'project_page.php?id=al.su&proj=' .$proj. '\'>Sultan Abdullah Aldabal</a></li>
  <li><a href=\'project_page.php?id=bu.an&proj=' .$proj. '\'>Andrew Burcham</a></li>
  <li><a href=\'project_page.php?id=ch.an&proj=' .$proj. '\'>Anders Chen</a></li>
  <li><a href=\'project_page.php?id=dh.mo&proj=' .$proj. '\'>Mohit Dhinakaran
</a></li>
  <li><a href=\'project_page.php?id=ga.ar&proj=' .$proj. '\'>Arlen Gaba</a></li>
  <li><a href=\'project_page.php?id=ho.jo&proj=' .$proj. '\'>Jack Hoyt</a></li>
  <li><a href=\'project_page.php?id=ko.di&proj=' .$proj. '\'>Divit Koradia</a></li>
  <li><a href=\'project_page.php?id=li.em&proj=' .$proj. '\'>Emma Lindberg</a></li>
  <li><a href=\'project_page.php?id=lo.va&proj=' .$proj. '\'>Valentina Longcroft</a></li>
  <li><a href=\'project_page.php?id=mi.as&proj=' .$proj. '\'>Ashwin Misra</a></li>
  <li><a href=\'project_page.php?id=ro.dy&proj=' .$proj. '\'>Dylan Robinson</a></li>
  <li><a href=\'project_page.php?id=sa.jh&proj=' .$proj. '\'>Jhadley Sanchez</a></li>
  <li><a href=\'project_page.php?id=to.fr&proj=' .$proj. '\'>Francheska Torres</a></li>
  <li><a href=\'project_page.php?id=we.sp&proj=' .$proj. '\'>Spencer Webb</a></li>';
  }
?>
