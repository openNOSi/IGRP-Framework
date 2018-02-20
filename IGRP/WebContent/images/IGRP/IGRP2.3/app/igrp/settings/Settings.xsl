<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/><style/></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-97c559a3"><div class="gen-column col-sm-6"><div class="gen-inner"><xsl:if test="rows/content/sectionheader_1"><section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1"><h2><xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/></h2></section></xsl:if><xsl:if test="rows/content/view_1"><div class="box clearfix view-block gen-container-item " has-img="true" gen-class="" item-name="view_1"><div class="box-body"><xsl:if test="rows/content/view_1/fields/view_1_img"><img src="{rows/content/view_1/fields/view_1_img/value}"/></xsl:if><div class="view-body clearfix "><xsl:if test="rows/content/view_1/fields/nome"><div class="view-item gen-fields-holder" item-name="nome"><span class="view-label"><xsl:value-of select="rows/content/view_1/fields/nome/label"/></span><span class="view-value"><xsl:value-of select="rows/content/view_1/fields/nome/value"/></span></div></xsl:if><xsl:if test="rows/content/view_1/fields/email"><div class="view-item gen-fields-holder" item-name="email"><span class="view-label"><xsl:value-of select="rows/content/view_1/fields/email/label"/></span><span class="view-value"><xsl:value-of select="rows/content/view_1/fields/email/value"/></span></div></xsl:if><xsl:if test="rows/content/view_1/fields/username"><div class="view-item gen-fields-holder" item-name="username"><span class="view-label"><xsl:value-of select="rows/content/view_1/fields/username/label"/></span><span class="view-value"><xsl:value-of select="rows/content/view_1/fields/username/value"/></span></div></xsl:if><xsl:if test="rows/content/view_1/fields/telefone"><div class="view-item gen-fields-holder" item-name="telefone"><span class="view-label"><xsl:value-of select="rows/content/view_1/fields/telefone/label"/></span><span class="view-value"><xsl:value-of select="rows/content/view_1/fields/telefone/value"/></span></div></xsl:if><xsl:if test="rows/content/view_1/fields/telemovel"><div class="view-item gen-fields-holder" item-name="telemovel"><span class="view-label"><xsl:value-of select="rows/content/view_1/fields/telemovel/label"/></span><span class="view-value"><xsl:value-of select="rows/content/view_1/fields/telemovel/value"/></span></div></xsl:if><xsl:if test="rows/content/view_1/fields/ultimo_acesso_igrp"><div class="view-item gen-fields-holder" item-name="ultimo_acesso_igrp"><span class="view-label"><xsl:value-of select="rows/content/view_1/fields/ultimo_acesso_igrp/label"/></span><span class="view-value"><xsl:value-of select="rows/content/view_1/fields/ultimo_acesso_igrp/value"/></span></div></xsl:if><xsl:if test="rows/content/view_1/fields/ultimo_acesso_rede_estado"><div class="view-item gen-fields-holder" item-name="ultimo_acesso_rede_estado"><span class="view-label"><xsl:value-of select="rows/content/view_1/fields/ultimo_acesso_rede_estado/label"/></span><span class="view-value"><xsl:value-of select="rows/content/view_1/fields/ultimo_acesso_rede_estado/value"/></span></div></xsl:if><xsl:if test="rows/content/view_1/fields/password_expira_em"><div class="view-item gen-fields-holder" item-name="password_expira_em"><span class="view-label"><xsl:value-of select="rows/content/view_1/fields/password_expira_em/label"/></span><span class="view-value"><xsl:value-of select="rows/content/view_1/fields/password_expira_em/value"/></span></div></xsl:if></div></div></div></xsl:if></div></div><div class="gen-column col-sm-6"><div class="gen-inner"><xsl:if test="rows/content/toolsbar_1"><div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1"><div class="btns-holder  pull-right" role="group"><xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"><xsl:with-param name="vertical" select="'true'"/><xsl:with-param name="outline" select="'false'"/></xsl:apply-templates></div></div></xsl:if><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/idioma"><div class="col-sm-6 form-group  gen-fields-holder" item-name="idioma" item-type="select"><label for="{rows/content/form_1/fields/idioma/@name}"><i class="fa fa-language"></i><xsl:value-of select="rows/content/form_1/fields/idioma/label"/></label><select class="form-control select2 " id="form_1_idioma" name="{rows/content/form_1/fields/idioma/@name}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/idioma"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/idioma/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected
          </xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/separator_1"><div class="box-head subtitle gen-fields-holder" text-color="1"><span><xsl:value-of select="rows/content/form_1/fields/separator_1/label"/></span></div></xsl:if><xsl:if test="rows/content/form_1/fields/organica"><div class="col-sm-6 form-group  gen-fields-holder" item-name="organica" item-type="select" required="required"><label for="{rows/content/form_1/fields/organica/@name}"><xsl:value-of select="rows/content/form_1/fields/organica/label"/></label><select class="form-control select2 IGRP_change" id="form_1_organica" name="{rows/content/form_1/fields/organica/@name}" required="required"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/organica"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/organica/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/perfil"><div class="col-sm-6 form-group  gen-fields-holder" item-name="perfil" item-type="select" required="required"><label for="{rows/content/form_1/fields/perfil/@name}"><xsl:value-of select="rows/content/form_1/fields/perfil/label"/></label><select class="form-control select2 IGRP_change" id="form_1_perfil" name="{rows/content/form_1/fields/perfil/@name}" required="required"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/perfil"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/perfil/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1519140193993"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1519140193993"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1519140193993"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1519140193993"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1519140193994"/></xsl:stylesheet>
