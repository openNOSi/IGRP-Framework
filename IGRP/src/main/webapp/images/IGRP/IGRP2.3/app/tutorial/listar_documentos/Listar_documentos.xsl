<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/treemenu/treemenu.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/daterangepicker.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/IGRP.daterangepicker.css?v={$version}"/><style>.igrp-vertical-menu&gt;.list-group&gt;a[position="documentos_relacionados"]{  display:none;}</style></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-0b6c6bbc"><div class="gen-column col-sm-3"><div class="gen-inner"><xsl:if test="rows/content/treemenu_1"><div class="treemenu box gen-container-item " gen-structure="treemenu" gen-class="" item-name="treemenu_1"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/treemenu_1/fields"/><xsl:apply-templates select="rows/content/treemenu_1" mode="treemenu"><xsl:with-param name="target" select="'void'"/><xsl:with-param name="target_fields" select="''"/><xsl:with-param name="style" select="'default'"/><xsl:with-param name="app" select="'webapps?r=tutorial'"/><xsl:with-param name="gentype" select="'java'"/><xsl:with-param name="package" select="'Listar_documentos'"/><xsl:with-param name="toggle" select="'remote'"/><xsl:with-param name="search" select="'true'"/></xsl:apply-templates></div></xsl:if></div></div><div class="gen-column col-sm-9"><div class="gen-inner"><xsl:if test="rows/content/sectionheader_1"><section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1"><h2 class="disable-output-escaping"><xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/></h2></section></xsl:if><xsl:if test="rows/content/box_controll"><div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_controll"><div class="box-body" gen-preserve-content="true"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_controll/fields"/><div><div class="row " id="row-fe615eef"><div class="gen-column col-sm-12"><div class="gen-inner"><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item clean" gen-class="clean" item-name="form_1"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/form_1_plaintext_1"><div class="col-sm-12  form-group  ff-fix gen-fields-holder" item-name="form_1_plaintext_1" item-type="plaintext"><xsl:value-of select="rows/content/form_1/fields/form_1_plaintext_1/value" disable-output-escaping="yes"/></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if><xsl:if test="rows/content/view_1"><div class="box clearfix view-block gen-container-item clean" has-img="false" template="default" gen-class="clean" item-name="view_1"><div class="box-body"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/view_1/fields"/><xsl:if test="rows/content/view_1/fields/view_1_img"><img src="{rows/content/view_1/fields/view_1_img/value}"/></xsl:if><div class="view-body clearfix "><xsl:if test="rows/content/view_1/fields/atualizado_em"><div class="view-item text-{rows/content/view_1/fields/atualizado_em/@class} gen-fields-holder" item-name="atualizado_em" style="font-size:11px;"><xsl:if test="rows/content/view_1/fields/atualizado_em/@img != ''"><i class="fa {rows/content/view_1/fields/atualizado_em/@img} view-img"><xsl:if test="rows/content/view_1/fields/atualizado_em/@showlabel = 'false'"><xsl:attribute name="title"><xsl:value-of select="rows/content/view_1/fields/atualizado_em/label"/></xsl:attribute></xsl:if></i></xsl:if><xsl:if test="rows/content/view_1/fields/atualizado_em/@showlabel != 'false' or not(rows/content/view_1/fields/atualizado_em/@showlabel)"><span class="view-label"><xsl:value-of select="rows/content/view_1/fields/atualizado_em/label"/></span></xsl:if><span class="view-value"><xsl:value-of select="rows/content/view_1/fields/atualizado_em/value"/></span></div></xsl:if></div></div></div></xsl:if></div></div></div></div></div></div></xsl:if><xsl:if test="rows/content/sectionheader_2"><section class="content-header gen-container-item " gen-class="" item-name="sectionheader_2"><h2 class="disable-output-escaping"><xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_2/fields/sectionheader_2_text/value"/></h2></section></xsl:if><xsl:if test="rows/content/documentos_relacionados"><div class="igrp-vertical-menu gen-container-item " gen-fields=".list-group .btn" template="clean" gen-class="" item-name="documentos_relacionados"><xsl:call-template name="box-header"><xsl:with-param name="title" select="rows/content/documentos_relacionados/@title"/><xsl:with-param name="collapsible" select="'false'"/><xsl:with-param name="collapsed" select="''"/></xsl:call-template><div class="list-group"><xsl:apply-templates select="rows/content/documentos_relacionados" mode="gen-buttons"><xsl:with-param name="vertical" select="'true'"/></xsl:apply-templates></div></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/plugins/treemenu/treemenu.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/core/moment/moment.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/datepicker2/daterangepicker.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/datepicker2/IGRP.daterangepicker.config.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/datepicker2/locale/dp.locale.pt.js?v={$version}"/><script>$(function(){      $.IGRP.targets.void.action = function(p){        var _form = $('form');            $.IGRP.utils.transformXMLNodes({        nodes : ['form_1','documentos_relacionados','sectionheader_1','view_1'],        url   : $.IGRP.utils.getSubmitParams(p.url,_form,false),        data  : _form.serialize(),        success:function(c){          $.IGRP.utils.loading.hide();        },        error:function(){          $.IGRP.utils.loading.hide();                  }     });  }});</script></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=28"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=28"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=28"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=28"/><xsl:include href="../../../xsl/tmpl/IGRP-treemenu.tmpl.xsl?v=28"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=28"/></xsl:stylesheet>
