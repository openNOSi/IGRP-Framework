<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/><style/></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-e8efcd07"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:if test="rows/content/sectionheader_1"><section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1"><h2 class="disable-output-escaping"><xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/></h2></section></xsl:if><xsl:if test="rows/content/toolsbar_1"><div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1"><div class="btns-holder  btn-group-justified" role="group"><xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"><xsl:with-param name="vertical" select="'true'"/><xsl:with-param name="outline" select="'false'"/></xsl:apply-templates></div></div></xsl:if><xsl:if test="rows/content/table_1"><div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1"><div class="box-body "><div class="table-contents-head"><div class="table-contents-inner"></div></div><div class="table-box"><div class="table-box-inner"><table id="table_1" class="table table-striped  igrp-data-table IGRP_contextmenu " exports=""><thead><tr><xsl:if test="rows/content/table_1/fields/id"><th class="bs-checkbox gen-fields-holder" align="left"><label class="container-box "><span><xsl:value-of select="rows/content/table_1/fields/id/label"/></span><input type="checkbox" class="IGRP_checkall" check-rel="id" data-title="" data-toggle="tooltip"/><span class="checkmark"/></label></th></xsl:if><xsl:if test="rows/content/table_1/fields/descricao"><th td-name="descricao" align="left" show-label="true" class="plaintext  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/table_1/fields/descricao/label"/></span></th></xsl:if></tr></thead><tbody><xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]"><tr><xsl:apply-templates mode="context-param" select="context-menu"/><input type="hidden" name="p_processid_fk" value="{processid}"/><input type="hidden" name="p_processid_fk_desc" value="{processid_desc}"/><input type="hidden" name="p_task_id_fk" value="{task_id}"/><input type="hidden" name="p_task_id_fk_desc" value="{task_id_desc}"/><input type="hidden" name="p_env_fk_fk" value="{env_fk}"/><input type="hidden" name="p_env_fk_fk_desc" value="{env_fk_desc}"/><xsl:if test="id"><td align="left" data-row="{position()}" data-title="{../../label/id}" class="bs-checkbox" item-name="id" data-order="{id_check=id}"><xsl:if test="id != '-0'"><label class="container-box "><input type="checkbox" name="p_id_fk" value="{id}" check-rel="id" class="checkdcontrol"><xsl:if test="id_check=id"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="//rows/content/table_1/fields/id"/></xsl:call-template></input><span class="slider round"/><span class="checkmark"/></label></xsl:if><input type="hidden" name="p_id_check_fk" class="id_check"><xsl:if test="id_check=id"><xsl:attribute name="value"><xsl:value-of select="id_check"/></xsl:attribute></xsl:if></input><xsl:if test="id_check!=id"><input type="hidden" name="p_id_fk" value="{id}" class="id"/></xsl:if></td></xsl:if><xsl:if test="descricao"><td align="left" data-order="{descricao}" data-row="{position()}" data-title="{../../../fields/descricao/label}" class="plaintext" item-name="descricao"><span class=" ff-fix"><xsl:value-of select="descricao" disable-output-escaping="yes"/></span></td></xsl:if></tr></xsl:for-each></tbody></table><xsl:apply-templates select="rows/content/table_1/table/context-menu" mode="table-context-menu"/></div></div></div></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=16"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=16"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=16"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=16"/><xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=16"/></xsl:stylesheet>