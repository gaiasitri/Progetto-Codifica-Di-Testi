<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Diari di Emanuele Artom</title>
                <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
                <script src="script.js"></script>
                <link href="stile.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <nav class="navMenu">
                    <ul>
                        <li>
                            <a href="#info">Informazioni</a>
                        </li>
                        <li>
                            <a href="#p153">Pagina 153</a>
                        </li>
                        <li>
                            <a href="#p156">Pagina 156</a>
                        </li>
                        <li>
                            <a href="#p174">Pagina 174</a>
                        </li>
                        <li>
                            <a href="#append">Riferimenti</a>
                        </li>
                    </ul>
                </nav>

                <header>
                    <h1>
                        <xsl:value-of select="//tei:title[@xml:lang='it']" />
                    </h1>
                </header>

                <xsl:apply-templates select="//tei:sourceDesc"/>
                <xsl:apply-templates select="//tei:encodingDesc"/>
                <xsl:apply-templates select="//tei:text"/>
                <xsl:apply-templates select="//tei:listBibl"/>
                <xsl:apply-templates select="//tei:listPlace"/>
                
                <div class="flex">
                    <xsl:apply-templates select="//tei:listPerson"/>
                <div class="flex-container">
                    <div><img src="img/foto1.jpg"/><p class="caption">Emanuele Artom</p></div>
                    <div><img src="img/foto2.jpg"/><p class="caption">Vincenzo Modica</p></div>
                </div>
                <div class="flex-container">
                    <div><img src="img/foto3.jpg"/><p class="caption">Pompeo Colajanni</p></div>
                    <div><img src="img/foto4.jpg"/><p class="caption">Silvio Federico Baridon</p></div>
                </div>
                </div>

                <div id="append">
                    <h3 id="about">Riferimenti</h3>
                    <xsl:apply-templates select="//tei:editionStmt"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:sourceDesc">
    <div id="info">
        <article>
            <h1>Informazioni sul manoscritto</h1>
            <div class="info_manoscritto">
                <div>
                    <h3>L'autore</h3>
                    <xsl:apply-templates select="//tei:note[@xml:id='biografia']" />
                </div>
                <div>
                    <h3>Il diario</h3>
                    <xsl:apply-templates select="//tei:origin" />
                </div>
                <div>
                    <h3>La struttura</h3>
                    <xsl:apply-templates select="//tei:physDesc" />
                </div>
                <div>
                    <xsl:value-of select="//tei:setting"/>
                </div>
            </div>
        </article>
    </div>
    
        <section id="progetto" class="section">
            <div>
                <p> Il progetto è stato realizzato da Gaia Sitri per l'esame di Codifica di Testi, laurea triennale in Informatica Umanistica.</p>
            </div>
        </section>
    
        <div id="fenomeni">
            <h1>Fenomeni notevoli</h1>
                <ul class="legend">
                    <li>
                        <span class="persname"></span><button id="btn-pers">Nomi di persona</button></li>
                    <li>
                        <span class="placename"></span><button id="btn-luogo">Nomi di luogo</button></li>
                    <li>
                        <span class="add"></span><button id="btn-add">Aggiunte</button></li>
                    <li>
                        <span class="del"></span><button id="btn-del">Cancellazioni</button></li>
                    <li>
                        <span class="choice"></span><button id="btn-choice">Scelte del codificatore</button></li>
                    <li>
                        <span class="number"></span><button id="btn-number">Numeri</button></li>
                    <li>
                        <button id="btn-hide">Nascondi fenomeni notevoli</button></li>
                </ul>
        </div>
    </xsl:template>

    <xsl:template match="tei:text">
        <article id="p153">
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag153']" />
                        </div>
                        <div class="text">
                            <h2> Pagina 153 </h2>
                            <xsl:apply-templates select="//tei:body/tei:ab[@n = '2']" />
                        </div>
                    </div>
                </article>

                <article id="p156">
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag156']" />
                        </div>
                        <div class="text">
                            <h2> Pagina 156 </h2>
                            <xsl:apply-templates select="//tei:body/tei:ab[@n = '1']" />
                        </div>
                    </div>
                </article>

                <article id="p174">
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag174']" />
                        </div>
                        <div class="text">
                            <h2> Pagina 174 </h2>
                            <xsl:apply-templates select="//tei:body/tei:ab[@n = '3']" />
                        </div>
                    </div>
            </article>
    </xsl:template>

    <xsl:template match="tei:encodingDesc">
        <div class="encodingDesc">
            <h3>La Codifica</h3>
            <xsl:apply-templates select="tei:editorialDecl"/>
        </div>
    </xsl:template>

    <xsl:template match="tei:editorialDecl">
        <div class="editorialDecl">
        <xsl:apply-templates select="tei:p"/>
            <xsl:apply-templates select="tei:correction"/>
            <xsl:apply-templates select="tei:punctuation"/>
            <xsl:apply-templates select="tei:segmentation"/>
            <xsl:apply-templates select="tei:stdVals"/>
        </div>
    </xsl:template> 

    <xsl:template match="tei:listBibl">
        <article>
            <h2 id="bibliog">Bibliografia</h2>
            <xsl:apply-templates select="//tei:bibl" />
        </article>
    </xsl:template>

    <xsl:template match="tei:listPerson">
        <article>
            <h2 id="persone">Lista delle Persone</h2>
            <xsl:apply-templates select="//tei:person" />
        </article>
    </xsl:template>

    <xsl:template match="tei:listPlace">
        <article>
            <h2 id="luoghi">Lista dei Luoghi</h2>
            <xsl:apply-templates select="//tei:place" />
        </article>
    </xsl:template>

    <xsl:template match="tei:bibl">
        <li class="bibl">
            <a>
                <xsl:apply-templates />
            </a>
        </li>
    </xsl:template>

    <xsl:template match="tei:person">
        <li class="person">
            <a>
                <xsl:apply-templates />
            </a>
        </li>
    </xsl:template>

    <xsl:template match="tei:place">
        <li class="luogo">
            <a>
                <xsl:apply-templates />
            </a>
        </li>
    </xsl:template>


    <xsl:template match="tei:editionStmt">
        <p>
            <xsl:value-of select="current()/tei:edition"></xsl:value-of>
        </p>
        <p>Progetto a cura di: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='GS']"></xsl:value-of>
        </p>
        <p>Coordinato da: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AMDG']"></xsl:value-of>
        </p>
    </xsl:template>


    <xsl:template match="tei:gap">
        <gap>?</gap>
    </xsl:template>


    <xsl:template match="tei:placeName">
        <placename>
            <xsl:apply-templates />
        </placename>
    </xsl:template>

    <xsl:template match="tei:del">
        <del>
            <xsl:apply-templates />
        </del>
    </xsl:template>

    <xsl:template match="tei:add">
        <add>
            <xsl:apply-templates />
        </add>
    </xsl:template>

    <xsl:template match="tei:choice">
        <choice>
            <xsl:apply-templates />
        </choice>
    </xsl:template>

    <xsl:template match="tei:num">
        <number>
            <xsl:apply-templates />
        </number>
    </xsl:template>

    <xsl:template match="tei:persName">
        <persname>
            <xsl:apply-templates/>
        </persname>
    </xsl:template>


    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="concat('img/', @xml:id, '.jpg')" />
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
