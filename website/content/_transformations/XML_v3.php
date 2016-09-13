    <div class="xsl_v2"><?php
    // Load XML file
    $xml = new DOMDocument;
    $xml->load(dirname(__FILE__) . '/../_xml/p' .$proj. '_' .$id.  '.xml');

    // Load XSL file
    $xsl = new DOMDocument;
    $xsl->load(dirname(__FILE__) . '/../_xsl/annotated_format.xsl');

    // Configure the transformer
    $proc = new XSLTProcessor;

    // Attach the xsl rules
    $proc->importStyleSheet($xsl);

    echo $proc->transformToXML($xml);
    ?></div>
