<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/croppie/croppie.css?v={$version}"/><style>$(function(){   var img = $('#id-img_1');  img.attr('initfilter',100);  //img.attr('initfilter',100).attr('initfilt',100);     $.IGRP.targets.void.action = function(p){    var obj = $(p.clicked),        action = obj.attr('position'),        filter = img.attr('initfilter')*1;       if(action == 'diminuir_bril')      {      filter = filter - 10;    img.attr('initfilter', filter).css({'filter' : 'brightness('+filter+'%)'});       }   else if(action == 'aumentar_bril')     {      filter = filter + 10;       img.attr('initfilter', filter).css({'filter' : 'brightness('+filter+'%)'});      }           else if(action == 'diminuir_cont')       {      filter = filter - 10;      img.attr('initfilter', filter).css({'filter' : 'contrast('+filter+'%)'});        }   else if(action == 'aumentar_cont')     {      filter = filter + 10;      img.attr('initfilter', filter).css({'filter' : 'contrast('+filter+'%)'});       }         else if(action == 'diminuir_inv')       {      filter = filter - 10;      img.attr('initfilter', filter).css({'filter' : 'invert('+filter+'%)'});        }   else if(action == 'aumentar_inv')     {      filter = filter + 10;      img.attr('initfilter', filter).css({'filter' : 'invert('+filter+'%)'});       }     console.log('ok');    }  });</style></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-47784e1e"><div class="gen-column col-sm-3"><div class="gen-inner"><xsl:if test="rows/content/form_4"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_4"><xsl:call-template name="box-header"><xsl:with-param name="title" select="rows/content/form_4/@title"/><xsl:with-param name="collapsible" select="'false'"/><xsl:with-param name="collapsed" select="'false'"/></xsl:call-template><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_4/fields"/></div></div><xsl:apply-templates select="rows/content/form_4/tools-bar" mode="form-buttons"/></div></xsl:if><xsl:if test="rows/content/form_2"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2"><xsl:call-template name="box-header"><xsl:with-param name="title" select="rows/content/form_2/@title"/><xsl:with-param name="collapsible" select="'false'"/><xsl:with-param name="collapsed" select="'false'"/></xsl:call-template><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/></div></div><xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/></div></xsl:if><xsl:if test="rows/content/form_3"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_3"><xsl:call-template name="box-header"><xsl:with-param name="title" select="rows/content/form_3/@title"/><xsl:with-param name="collapsible" select="'false'"/><xsl:with-param name="collapsed" select="'false'"/></xsl:call-template><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_3/fields"/></div></div><xsl:apply-templates select="rows/content/form_3/tools-bar" mode="form-buttons"/></div></xsl:if></div></div><div class="gen-column col-sm-9"><div class="gen-inner"><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/img_1"><div class="col-sm-12  holder-croppie gen-fields-holder" item-name="img_1"><div class="row"><img src="{rows/content/form_1/fields/img_1/value}" data-label="{rows/content/form_1/fields/img_1/label}" name="img_1" id="id-img_1" width="550" height="600" class=" croppie "/></div></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/croppie/croppie.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/croppie/croppie.js?v={$version}"/><script>$(function(){  var img = $('#id-img_1');  img.attr('initfilter',100);  img.attr('initfiltro',100);  img.attr('initfilt',0);  $.IGRP.targets.void.action = function(p){    var obj = $(p.clicked),        action = obj.attr('position'),        filter = img.attr('initfilter')*1,        filt = img.attr('initfilt')*1,        filtro = img.attr('initfiltro')*1;    console.log('ok');    if(action == 'diminuir_bril'){      filter = filter - 10;      img.attr({'initfilter':filter, 'initfiltro':filtro, 'initfilt':filt}).css({'filter' : 'brightness('+filter+'%) contrast('+filtro+'%) invert('+filt+'%)'});    }    if(action == 'aumentar_bril'){      filter = filter + 10;      img.attr({'initfilter':filter, 'initfiltro':filtro, 'initfilt':filt}).css({'filter' : 'brightness('+filter+'%) contrast('+filtro+'%) invert('+filt+'%)'});    }    if(action == 'diminuir_cont'){      filtro = filtro - 10;      img.attr({'initfilter':filter, 'initfiltro':filtro, 'initfilt':filt}).css({'filter' : 'brightness('+filter+'%) contrast('+filtro+'%) invert('+filt+'%)'});    }    if(action == 'aumentar_cont'){      filtro = filtro + 10;      img.attr({'initfilter':filter, 'initfiltro':filtro, 'initfilt':filt}).css({'filter' : 'brightness('+filter+'%) contrast('+filtro+'%) invert('+filt+'%)'});    }    if(action == 'aumentar_inv'){      filt = filt + 10;      img.attr({'initfilter':filter, 'initfiltro':filtro, 'initfilt':filt}).css({'filter' : 'brightness('+filter+'%) contrast('+filtro+'%) invert('+filt+'%)'});    }    if(action == 'diminuir_inv'){      filt = filt - 10;      img.attr({'initfilter':filter, 'initfiltro':filtro, 'initfilt':filt}).css({'filter' : 'brightness('+filter+'%) contrast('+filtro+'%) invert('+filt+'%)'});    }  }});</script></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=18"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=18"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=18"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=18"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=18"/></xsl:stylesheet>
