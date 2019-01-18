<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/><style/></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-2693af52"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:if test="rows/content/sectionheader_1"><section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1"><h2><xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/></h2></section></xsl:if><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/tipo_contribuinte"><div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_contribuinte" item-type="select" required="required"><label for="{rows/content/form_1/fields/tipo_contribuinte/@name}"><xsl:value-of select="rows/content/form_1/fields/tipo_contribuinte/label"/></label><select class="form-control select2 " id="form_1_tipo_contribuinte" name="{rows/content/form_1/fields/tipo_contribuinte/@name}" required="required"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/tipo_contribuinte"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/tipo_contribuinte/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/nif"><div class="form-group col-sm-3   gen-fields-holder" item-name="nif" item-type="number"><label for="{rows/content/form_1/fields/nif/@name}"><span><xsl:value-of select="rows/content/form_1/fields/nif/label"/></span></label><input type="number" value="{rows/content/form_1/fields/nif/value}" class="form-control " id="{rows/content/form_1/fields/nif/@name}" name="{rows/content/form_1/fields/nif/@name}" min="" max="" maxlength="250" placeholder=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/nif"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/form_1/fields/nome_form"><div class="form-group col-sm-3   gen-fields-holder" item-name="nome_form" item-type="text"><label for="{rows/content/form_1/fields/nome_form/@name}"><span><xsl:value-of select="rows/content/form_1/fields/nome_form/label"/></span></label><input type="text" value="{rows/content/form_1/fields/nome_form/value}" class="form-control " id="{rows/content/form_1/fields/nome_form/@name}" name="{rows/content/form_1/fields/nome_form/@name}" maxlength="250" placeholder=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/nome_form"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/form_1/fields/n_documento_form"><div class="form-group col-sm-3   gen-fields-holder" item-name="n_documento_form" item-type="number"><label for="{rows/content/form_1/fields/n_documento_form/@name}"><span><xsl:value-of select="rows/content/form_1/fields/n_documento_form/label"/></span></label><input type="number" value="{rows/content/form_1/fields/n_documento_form/value}" class="form-control " id="{rows/content/form_1/fields/n_documento_form/@name}" name="{rows/content/form_1/fields/n_documento_form/@name}" min="" max="" maxlength="250" placeholder=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/n_documento_form"/></xsl:call-template></input></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if><xsl:if test="rows/content/table_1"><div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1"><div class="box-body "><div class="table-contents-head"><div class="table-contents-inner"></div></div><div class="table-box"><div class="table-box-inner"><table id="table_1" class="table table-striped  igrp-data-table  " exports=""><thead><tr><xsl:if test="rows/content/table_1/fields/nif_tab"><th align="left" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/table_1/fields/nif_tab/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/nome_tab"><th align="left" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/table_1/fields/nome_tab/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/dt_nascimento"><th align="left" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/table_1/fields/dt_nascimento/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/nome_pai"><th align="left" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/table_1/fields/nome_pai/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/nome_mae"><th align="left" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/table_1/fields/nome_mae/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/documento_tab"><th align="left" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/table_1/fields/documento_tab/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/table/context-menu/item"><th class="igrp-table-ctx-th"/></xsl:if></tr></thead><tbody><xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]"><tr><xsl:apply-templates mode="context-param" select="context-menu"/><xsl:if test="nif_tab"><td align="left" data-order="{nif_tab}" data-row="{position()}" data-title="{../../../fields/nif_tab/label}" class="number" item-name="nif_tab"><span class="lookup-parser"><xsl:value-of select="nif_tab"/></span></td></xsl:if><xsl:if test="nome_tab"><td align="left" data-order="{nome_tab}" data-row="{position()}" data-title="{../../../fields/nome_tab/label}" class="text" item-name="nome_tab"><span class="lookup-parser"><xsl:value-of select="nome_tab"/></span></td></xsl:if><xsl:if test="dt_nascimento"><td align="left" data-order="{dt_nascimento}" data-row="{position()}" data-title="{../../../fields/dt_nascimento/label}" class="text" item-name="dt_nascimento"><span class="lookup-parser"><xsl:value-of select="dt_nascimento"/></span></td></xsl:if><xsl:if test="nome_pai"><td align="left" data-order="{nome_pai}" data-row="{position()}" data-title="{../../../fields/nome_pai/label}" class="text" item-name="nome_pai"><span class="lookup-parser"><xsl:value-of select="nome_pai"/></span></td></xsl:if><xsl:if test="nome_mae"><td align="left" data-order="{nome_mae}" data-row="{position()}" data-title="{../../../fields/nome_mae/label}" class="text" item-name="nome_mae"><span class="lookup-parser"><xsl:value-of select="nome_mae"/></span></td></xsl:if><xsl:if test="documento_tab"><td align="left" data-order="{documento_tab}" data-row="{position()}" data-title="{../../../fields/documento_tab/label}" class="number" item-name="documento_tab"><span class="lookup-parser"><xsl:value-of select="documento_tab"/></span></td></xsl:if><xsl:if test="//rows/content/table_1/table/context-menu/item"><td class="igrp-table-ctx-td"><xsl:apply-templates select="../../context-menu" mode="table-context-inline"><xsl:with-param name="row-params" select="context-menu"/></xsl:apply-templates></td></xsl:if></tr></xsl:for-each></tbody></table></div></div></div></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=17"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=17"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=17"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=17"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=17"/><xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=17"/></xsl:stylesheet>
