<%inherit file='nextgisweb:pyramid/template/base.mako' />
<%!
import json
from pyramid.httpexceptions import HTTPNotFound
from nextgisweb.pyramid.util import _
from nextgisweb.pyramid.exception import json_error
%>

<%def name="head()">
    <link href="${request.route_url('amd_package', subpath='ngw-pyramid/ErrorDialog.css')}" rel="stylesheet" type="text/css"/>
</%def>


<!-- Use dijit same layout as ngw-pyrami/ErrorDialog -->

<div class="dijitDialog">
    <div class="dijitDialogTitleBar">
        <span class="dijitDialogTitle">${tr(err_info.title) if hasattr(err_info, 'title') and err_info.title else ""}</span>
    </div>
    <div id="containerNode" class="dijitDialogPaneContent ngwPyramidErrorDialog">
        <div id="contentArea" class="dijitDialogPaneContentArea">
            %if hasattr(err_info, 'message') and err_info.message:
                <p>${tr(err_info.message)}</p>
            %endif
            %if hasattr(err_info, 'detail') and err_info.detail:
                <p>${tr(err_info.detail)}</p>
            %endif
        </div>
        <div id="actionBar" class="dijitDialogPaneActionBar">

        </div>
    </div>
</div>

<script type="text/javascript">
    require([
        "dojo/dom-style",
        "dojo/json",
        "dijit/form/Button",
        "ngw/settings!pyramid",
        "ngw-pyramid/form/CodeMirror",
        "ngw-pyramid/i18n!pyramid",
        "dojo/domReady!"
    ], function (
        domStyle,
        json,
        Button,
        settings,
        CodeMirror,
        i18n
    ) {
        var error = ${json.dumps(json_error(request, err_info, exc, exc_info, debug=debug)) | n};

        var technicalInfo = new CodeMirror({
            readonly: true,
            lineNumbers: true,
            autoHeight: true,
            lang: 'javascript',
            style: "display: none;",
            value: json.stringify(error, undefined, 2)
        }).placeAt("contentArea");
        technicalInfo.startup();

        new Button({
            label: ${tr(_("Back")) | json.dumps, n},
            class: "dijitButton--primary",
            onClick: function () {
                window.history.back();
            }
        }).placeAt("actionBar")

        if (settings['support_url']) {
            new Button({
                label: i18n.gettext("Request support"),
                class: "dijitButton--default",
                style: "float: right; margin-left: 1ex;",
                onClick: function() {
                    var win = window.open(settings['support_url'], '_blank');
                    win.focus();
                }
            }).placeAt("actionBar");
        };

        new Button({
            label: i18n.gettext("Technical information"),
            class: "dijitButton--default",
            style: "float: right;",
            onClick: function () {
                domStyle.set(technicalInfo.domNode, "display", "block");
                technicalInfo.resize();
            }
        }).placeAt("actionBar");
    });
</script>
