//>>built
define("dojox/drawing/plugins/tools/Zoom",["dojo/_base/lang","../../util/oo","../_Plugin","../../manager/_registry"],function(a,c,d,e){var f=Math.pow(2,.25),b=1;a.getObject("dojox.drawing.plugins.tools")||a.setObject("dojox.drawing.plugins.tools",{});a=dojox.drawing.plugins.tools;a.ZoomIn=c.declare(d,function(a){},{type:"dojox.drawing.plugins.tools.ZoomIn",onZoomIn:function(){b*=f;b=Math.min(b,10);this.canvas.setZoom(b);this.mouse.setZoom(b)},onClick:function(){this.onZoomIn()}});a.Zoom100=c.declare(d,
function(a){},{type:"dojox.drawing.plugins.tools.Zoom100",onZoom100:function(){b=1;this.canvas.setZoom(b);this.mouse.setZoom(b)},onClick:function(){this.onZoom100()}});a.ZoomOut=c.declare(d,function(a){},{type:"dojox.drawing.plugins.tools.ZoomOut",onZoomOut:function(){b/=f;b=Math.max(b,.1);this.canvas.setZoom(b);this.mouse.setZoom(b)},onClick:function(){this.onZoomOut()}});a.ZoomIn.setup={name:"dojox.drawing.plugins.tools.ZoomIn",tooltip:"Zoom In"};e.register(a.ZoomIn.setup,"plugin");a.Zoom100.setup=
{name:"dojox.drawing.plugins.tools.Zoom100",tooltip:"Zoom to 100%"};e.register(a.Zoom100.setup,"plugin");a.ZoomOut.setup={name:"dojox.drawing.plugins.tools.ZoomOut",tooltip:"Zoom In"};e.register(a.ZoomOut.setup,"plugin");return a});
//# sourceMappingURL=Zoom.js.map