<?php
if(isset($proj)) {
  echo
  '<li><a href=\'project_page.php?id=test_doc&proj=' .$proj. '\'>Example file</a></li>
  <li><a href=\'project_page.php?id=b11&proj=' .$proj. '\'>Seth Bakes</a></li>';
  }
elseif(isset($_GET['proj'])) {
  $proj = $_GET['proj'];
  echo
  '<li><a href=\'project_page.php?id=test_doc&proj=' .$proj. '\'>Example file</a></li>
  <li><a href=\'project_page.php?id=b11&proj=' .$proj. '\'>Seth Bakes</a></li>';
  }
?>
