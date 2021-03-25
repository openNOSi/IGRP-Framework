<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link type="text/css" rel="stylesheet" href="{$path}/core/bootstrap/plugins/tabdrop/css/tabdrop.css?v={$version}"/><style>body[app] input[type="text"] {   width: 100% ;   border: 0.5px solid #E0E0E0 ;   border-radius: 4px;   margin: 8px 0;   outline: none ;   padding: 8px;   box-sizing: border-box;   transition: 0.3s; }  body[app] input[type="text"]:focus {   border-color: #E0E0E0 ;   box-shadow: 0 0 8px 0 #E0E0E0 ; }  body[app] .inputWithIcon input[type="text"] {   padding-left: 40px ; }  body[app] .inputWithIcon {   position: relative ; }   body[app] .inputWithIcon i {   position: absolute;   left: 0.5px;   top: 0.5px;   padding: 9.5px 9.5px;     transition: 0.3s;   background-color: #E0E0E0;   border: #E0E0E0 solid 0.5px;   border-radius: 4px 0 0 4px;}   body[app] .inputWithIcon input[type="text"]:focus + i {   color: #E0E0E0; }  body[app] .inputWithIcon.inputIconBg i {   background-color: whitesmoke ;   color: black;   padding: 9px 4px;   border-radius: 4px 0 0 4px; }  body[app] .inputWithIcon.inputIconBg input[type="text"]:focus + i {   color: black;   background-color: #E0E0E0;}body[app] .icon-header {    font-size: x-large;    margin-bottom: 15px;    letter-spacing: 1px;   }body[app] .gen-fa-icon {   display: inline-block;   padding: 5px;   margin: 2px;   font-size: 16px;   cursor: pointer;   color: #5d5d5d;}body[app] .fa {   display: inline-block;   font: normal normal normal 14px/1 FontAwesome;   font-size: inherit;   text-rendering: auto;   vertical-align: middle;   -webkit-font-smoothing: antialiased;   -moz-osx-font-smoothing: grayscale;}body[app] a:focus, a:hover {   color: #23527c;   text-decoration: none;}body[app] .gen-fa-icon.active {   box-shadow: 0px 4px 7px #7b7b7b;   outline: 1px solid #ececec;   color: black;   background: #E0E0E0;  }body[app] ul li a {   padding: 10px 10px !important;   font-size: 12px;   text-transform: uppercase;  }body[app] .tab-content {   max-height: 360px;   overflow-y: auto;   background: white;}body[app] .nav-tabs&gt;li.active&gt;a, .nav-tabs&gt;li.active&gt;a:focus, .nav-tabs&gt;li.active&gt;a:hover {      color : #337AB7 !important;   font-weight: bold;   background-color: none !important;   }body[app] .nav .open&gt;a, .nav .open&gt;a:focus, .nav .open&gt;a:hover {   background-color: none !important; }body[app] .pull-right {   float: right!important;}</style></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-3f6f8bb5"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:if test="rows/content/icon_form"><div class="box igrp-forms gen-container-item clean" gen-class="clean" item-name="icon_form"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/icon_form/fields"/></div></div><xsl:apply-templates select="rows/content/icon_form/tools-bar" mode="form-buttons"/></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/core/bootstrap/plugins/tabdrop/js/bootstrap-tabdrop.js"/><script>$(function () {   $.ajax({      type: "GET",      dataType: "json",      url: path + '/core/fontawesome/fa.icons.json',      success: function (fa) {         var holder = $('<div class="gen-fa-setter col-md-12"/>'),            ul = $('<ul class="nav nav-tabs icons-list-tab"/>'),            contents = $('<div class="tab-content icons-list-tab"/>'),            searcher = $('<div class="form-group icon-searcher md-12 inputWithIcon"/>'),            searchRes = $('<div class="icon-search-fa clearfix "/>'),            idx = 0,            inputSearch =$('<input class="form-control" type="text" placeholder="Pesquisar"/>'),              iconSearch = $('<i class="fa fa-search inputIconBg" aria-hidden="true"/>'),         header = $('<label class="icon-header">Lista de ícones</label>');                 searcher.append([iconSearch, inputSearch]);          holder.append([header, searcher, ul, contents, searchRes]);         searcher.on('keyup', 'input', function () {            var word = $(this).val(),               parent = $(this).parents('.gen-fa-setter');            if (word.length &gt; 0) {               $('.icons-list-tab', parent).hide();               $('.gen-fa-icon', parent).hide();               $('.icon-search-fa', parent).html('');               var items = $('.gen-fa-icon[title*="' + word + '"]:not(.duplicated)', parent).clone().show();               $('.icon-search-fa', parent).append(items);               $('.icon-search-fa', parent).show();            } else {               $('.icons-list-tab', parent).show();               $('.icons-list-tab .gen-fa-icon', parent).show();               $('.icon-search-fa', parent).html('');            }         });         for (var c in fa) {            var icons = fa[c],               id = 'gen-fa-' + c,               active = idx == 0 ? 'active in' : '',               li = $('<li rel="' + c + '" class="' + active + '"><a data-toggle="tab" href="#'+id+'">' + c + '</a></li>'),               content = $('<div id="' + id + '" class="tab-pane fade ' + active + '"/>');            for (var i in icons) {               var icon = $('<span class="gen-fa-icon " parent="' + c + '" rel="' + icons[i].value + '" title="'                  + icons[i].label + '"><i class="fa ' + icons[i].value + '"/></span>');               content.append(icon);            }            contents.append(content);                        ul.append(li);              idx++;         }         $('.content').append(holder[0]);                 $('.icons-list-tab').tabdrop() ;                           $(window).resize(function () {                       $('.icons-list-tab').tabdrop();                  });         var searchIcon = $('#p_fwl_search');         if (searchIcon[0]) {            searchIcon = searchIcon.val();            if (searchIcon) {               var chooseParent = $('span.gen-fa-icon[rel="' + searchIcon + '"]:last');               $('ul li[rel="' + chooseParent.attr('parent') + '"] a').click();               chooseParent.addClass('active');            }         }      }   });   $('body').on('click', '.gen-fa-icon', function () {      var _window, iconClass, form;      _window = window.opener ? window.opener : window.parent;      iconClass = $(this).attr('rel');      form = _window.document.forms['formular_default'];      var lookupName = $("*[name='jsonLookup']"),         fieldName;      lookupName = lookupName.val();      lookupName = decodeURIComponent(lookupName);      lookupName = $.parseJSON(lookupName);      $.each(lookupName, function (key) {         fieldName = key;      });      $("*[name='" + fieldName + "']", form).val(iconClass);      window.opener ? window.close() : _window.$.IGRP.components.iframeNav.hide();   });});</script></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=24"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=24"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=24"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=24"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=24"/></xsl:stylesheet>
