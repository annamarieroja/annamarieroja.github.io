//>>built
define("dojox/mobile/CheckBox",["dojo/_base/declare","dojo/dom-construct","dijit/form/_CheckBoxMixin","./ToggleButton","./sniff"],function(c,b,d,e,f){return c("dojox.mobile.CheckBox",[e,d],{baseClass:"mblCheckBox",_setTypeAttr:function(){},buildRendering:function(){this.templateString||this.srcNodeRef||(this.srcNodeRef=b.create("input",{type:this.type}));this.inherited(arguments);this.templateString||(this.focusNode=this.domNode);if(f("windows-theme")){var a=b.create("span",{className:"mblCheckableInputContainer"});
a.appendChild(this.domNode.cloneNode());this.labelNode=b.create("span",{className:"mblCheckableInputDecorator"},a);this.domNode=a;this.focusNode=a.firstChild}},_getValueAttr:function(){return this.checked?this.value:!1}})});
//# sourceMappingURL=CheckBox.js.map