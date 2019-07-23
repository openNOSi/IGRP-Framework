<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/daterangepicker.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/IGRP.daterangepicker.css?v={$version}"/><style/></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-55ab3b55"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/nome_exame"><div class="form-group col-sm-3   gen-fields-holder" item-name="nome_exame" item-type="text"><label for="{rows/content/form_1/fields/nome_exame/@name}"><span><xsl:value-of select="rows/content/form_1/fields/nome_exame/label"/></span></label><input type="text" value="{rows/content/form_1/fields/nome_exame/value}" class="form-control  " id="{rows/content/form_1/fields/nome_exame/@name}" name="{rows/content/form_1/fields/nome_exame/@name}" maxlength="250" placeholder=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/nome_exame"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/form_1/fields/data_exame"><div class="form-group col-sm-3  gen-date-picker-wrapper gen-fields-holder" item-name="data_exame" item-type="date"><label for="{rows/content/form_1/fields/data_exame/@name}"><span><xsl:value-of select="rows/content/form_1/fields/data_exame/label"/></span></label><div class="input-group"><input type="text" value="{rows/content/form_1/fields/data_exame/value}" data-range="false" class="form-control gen-date-picker " id="data_exame" name="{rows/content/form_1/fields/data_exame/@name}" format="" maxlength="250"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/data_exame"/></xsl:call-template></input><span class="datepicker-clear fa fa-times"/><span class="input-group-btn gen-date-icon"><a class="btn btn-primary"><i class="fa fa-calendar"/></a></span></div></div></xsl:if><xsl:if test="rows/content/form_1/fields/imagem_raios_x"><div class="form-group col-sm-3  gen-fields-holder" item-name="imagem_raios_x" item-type="file"><label for="{rows/content/form_1/fields/imagem_raios_x/@name}"><span><xsl:value-of select="rows/content/form_1/fields/imagem_raios_x/label"/></span></label><div class="input-group"><input type="text" class="form-control not-form" readonly=""/><span class="input-group-btn"><span class="btn btn-primary file-btn-holder"><i class="fa fa-upload"/><input id="{rows/content/form_1/fields/imagem_raios_x/@name}" name="{rows/content/form_1/fields/imagem_raios_x/@name}" value="{rows/content/form_1/fields/imagem_raios_x/value}" target-rend="" class="transparent " type="file" accept=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/imagem_raios_x"/></xsl:call-template></input></span></span></div></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/core/moment/moment.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/datepicker2/daterangepicker.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/datepicker2/IGRP.daterangepicker.config.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/datepicker2/locale/dp.locale.pt.js?v={$version}"/></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=31"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=31"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=31"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=31"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=31"/></xsl:stylesheet>
