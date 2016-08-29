function loadXMLDoc(test_doc2)
{
if (window.ActiveXObject)
  {
  xhttp = new ActiveXObject("Msxml2.XMLHTTP");
  }
else
  {
  xhttp = new XMLHttpRequest();
  }
xhttp.open("GET", test_doc2, false);
try {xhttp.responseType = "msxml-document"} catch(err) {} // Helping IE11
xhttp.send("");
return xhttp.responseXML;
}

function displayResult()
{
xml = loadXMLDoc("../_xml/test_doc2.xml");
xsl = loadXMLDoc("../_xsl/normal_format.xsl");
// code for IE
if (window.ActiveXObject || xhttp.responseType == "msxml-document")
  {
  ex = xml.transformNode(xsl);
  document.getElementById("example").innerHTML = ex;
  }
// code for Chrome, Firefox, Opera, etc.
else if (document.implementation && document.implementation.createDocument)
  {
  xsltProcessor = new XSLTProcessor();
  xsltProcessor.importStylesheet(xsl);
  resultDocument = xsltProcessor.transformToFragment(xml, document);
  document.getElementById("example").appendChild(resultDocument);
  }
}
