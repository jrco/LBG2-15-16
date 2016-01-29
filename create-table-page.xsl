<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/">
        <html lang="en">

            <head>

                <meta charset="utf-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <meta name="description" content=""/>
                <meta name="author" content=""/>

                <title>LB Group 2</title>

                <!-- Bootstrap Core CSS -->
                <link href="css/bootstrap.css" rel="stylesheet"/>

                <!-- Custom CSS -->
                <link href="css/scrolling-nav.css" rel="stylesheet"/>
            </head>

            <!-- The #page-top ID is part of the scrolling feature - the data-spy and data-target are part of the built-in Bootstrap scrollspy function -->

            <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
                <!-- Navigation -->
                <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                    <div class="container">
                        <div class="navbar-header page-scroll">
                            <a class="navbar-brand page-scroll" href="index.html#genomaanalise"
                                style="font-size:13pt">Home</a>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse navbar-ex1-collapse">
                            <ul class="nav navbar-nav">
                                <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                                <li>
                                    <a class="page-scroll" href="#genomaanalise"
                                        style="font-size:13pt">Table</a>
                                </li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.container -->
                </nav>
                <!-- Intro Section -->
                <section id="intro" class="tableinfo">
                    <h1>Annotating the <i> Treponema pallidum pallidum </i> Genome</h1>
                    <br/><br/><br/><br/><br/><br/>
                        <p>The table was generated from the information present on NCBI <a href="index.html#bibliography">[5]</a>.</p>
                        <p>This table has information extracted from NCBI such as: protein name, protein ID, Swissprot number, among others, and report relating to each protein, added by us. On these reports are also included a summary about the protein's functions and the sources that we used to get the information.</p>
                    <p>We used bioinformatics tools, like Biopython <a href="index.html#bibliography">[6]</a> (extract the information from genebank file and to do the BLAST), CDD, BRENDA <a href="index.html#bibliography">[7]</a>, KEGG <a href="index.html#bibliography">[8]</a> and membrane transport database <a href="index.html#bibliography">[8]</a>, to create and complete the table.</p>
                    
                </section>

                <!-- Table Section -->
                <section id="genomaanalise" class="table-sectionnew">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1>Annotating the Treponema Genome</h1>
                                <p class="fontsizecenter"> Information about all the proteins known between
                                    position 131901bp to 241800bp of genome (Table 2). </p>
                            </div>
                        </div>
                    </div>
                                <table class="table table-hover">
                                    <caption> Table 2 - Extracted information from the gene bank
                                        file using biopython. (<a ng-href="" title="Legend"
                                            data-toggle="popover" data-placement="right" id="test"
                                                ><span class="badge"/> See and Close the
                                        Legend</a>)</caption>
                                    <thead>
                                        <tr>
                                            <th class="centerednr">#</th>
                                            <th class="centeredec">EC_Number</th>
                                            <th class="centeredge">GeneID</th>
                                            <th class="centeredsw">Swissprot</th>
                                            <th class="centeredlc">Locus tag</th>
                                            <th class="centerednp">Name Product</th>
                                            <th class="centeredpi">Protein ID</th>
                                            <th class="centeredst">Strand</th>
                                            <th class="centeredse">Sequence</th>
                                            <th class="centeredle">Length</th>
                                            <th class="centeredcl">Class</th>
                                            <th class="centeredbr">Blast Result</th>
                                            <th class="centeredre">Report</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:apply-templates/>
                                    </tbody>
                                </table>
                                <div id="myPopoverContent" hidden="hidden">
                                    <table class="table centered-table">
                                        <tr>
                                            <td>Metabolism</td>
                                            <td class="metabolismx"></td>
                                        </tr>
                                        <tr>
                                            <td>Transport</td>
                                            <td class="transportx"></td>
                                        </tr>
                                        <tr>
                                            <td>DNA Processing</td>
                                            <td class="procDNAx"></td>
                                        </tr>
                                        <tr>
                                            <td>RNA Processing</td>
                                            <td class="procRNAx"></td>
                                        </tr>
                                        <tr>
                                            <td>Transcription Regulator</td>
                                            <td class="transRegx"></td>
                                        </tr>
                                        <tr>
                                            <td>Structure</td>
                                            <td class="structurex"></td>
                                        </tr>
                                        <tr>
                                            <td>Protein Processing</td>
                                            <td class="protProcx"></td>
                                        </tr>
                                        <tr>
                                            <td>Unknown</td>
                                            <td class="unknownx"></td>
                                        </tr>
                                    </table>
                                </div>
                </section>
                
                <!-- jQuery -->
                <script src="js/demo.min.js"/>
                <script src="js/Chart.js"/>
                <script src="js/jquery.js"/>

                <!-- Bootstrap Core JavaScript -->
                <script src="js/bootstrap.min.js"/>

                <!-- Scrolling Nav JavaScript -->
                <script src="js/jquery.easing.min.js"/>
                <script src="js/scrolling-nav.js"/>
            </body>

        </html>

    </xsl:template>

    <xsl:template match="gene">

        <xsl:variable name="var">
            <xsl:choose>
                <xsl:when test="./class = 'Metabolism'">
                    <xsl:value-of select="'metabolism'"/>
                </xsl:when>
                <xsl:when test="./class = 'Transport'">
                    <xsl:value-of select="'transport'"/>
                </xsl:when>
                <xsl:when test="./class = 'DNA Processing'">
                    <xsl:value-of select="'procDNA'"/>
                </xsl:when>
                <xsl:when test="./class = 'RNA Processing'">
                    <xsl:value-of select="'procRNA'"/>
                </xsl:when>
                <xsl:when test="./class = 'Transcription Regulator'">
                    <xsl:value-of select="'transReg'"/>
                </xsl:when>
                <xsl:when test="./class = 'Structure'">
                    <xsl:value-of select="'structure'"/>
                </xsl:when>
                <xsl:when test="./class = 'Protein Processing'">
                    <xsl:value-of select="'protProc'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'unknown'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="class" select="$var"/>

        <tr>
            <td class="{$class} pos">
                <xsl:value-of select="@id"/>
            </td>
            <td class="{$class} ecnumber">
                <xsl:value-of select="ecNumber"/>
            </td>
            <td class="{$class} geneid">
                <xsl:value-of select="geneID"/>
            </td>
            <td class="{$class} swiss">
                <xsl:value-of select="swissprot"/>
            </td>
            <td class="{$class} locus">
                <xsl:value-of select="locus-tag"/>
            </td>
            <td class="{$class} nameproduct">
                <xsl:value-of select="product"/>
            </td>
            <td class="{$class} protein">
                <xsl:value-of select="proteinID"/>
            </td>
            <td class="{$class} strand">
                <xsl:value-of select="strand"/>
            </td>
            <td class="{$class} sequence">
                <xsl:value-of select="substring(sequence/text(), 1, 10)"/> ... <xsl:value-of
                    select="substring(sequence/text(), number(lensequence/text()) - 10, number(lensequence/text()))"
                />
            </td>
            <td class="{$class} length">
                <xsl:value-of select="lensequence"/>
            </td>
            <td class="{$class} class">
                <xsl:value-of select="class"/>
            </td>
            <td class="{$class} blast">
                <xsl:value-of select="blastresult"/>
            </td>
            <td class="{$class} report">
                <xsl:apply-templates select="report"/>
            </td>

        </tr>
    </xsl:template>

    <xsl:template match="report">
        <a target="_blank" href="reports/{.}">Open</a>
    </xsl:template>

</xsl:stylesheet>
