(window.webpackJsonp=window.webpackJsonp||[]).push([[19],{340:function(e,t,n){var content=n(345);content.__esModule&&(content=content.default),"string"==typeof content&&(content=[[e.i,content,""]]),content.locals&&(e.exports=content.locals);(0,n(99).default)("00682b3b",content,!0,{sourceMap:!1})},344:function(e,t,n){"use strict";n(340)},345:function(e,t,n){var r=n(98)((function(i){return i[1]}));r.push([e.i,".glitch[data-v-8d0265d8]{animation:glitch-8d0265d8 .5s infinite;font-weight:700;position:relative;text-shadow:.05em 0 0 rgba(255,0,0,.75),-.025em -.05em 0 rgba(0,255,0,.75),.025em .05em 0 rgba(0,0,255,.75);text-transform:uppercase}.glitch span[data-v-8d0265d8]{left:0;position:absolute;top:0}.glitch span[data-v-8d0265d8]:first-child{animation:glitch-8d0265d8 .65s infinite;-webkit-clip-path:polygon(0 0,100% 0,100% 45%,0 45%);clip-path:polygon(0 0,100% 0,100% 45%,0 45%);opacity:.8;transform:translate(-.025em,-.0125em)}.glitch span[data-v-8d0265d8]:last-child{animation:glitch-8d0265d8 375ms infinite;-webkit-clip-path:polygon(0 80%,100% 20%,100% 100%,0 100%);clip-path:polygon(0 80%,100% 20%,100% 100%,0 100%);opacity:.8;transform:translate(.0125em,.025em)}@keyframes glitch-8d0265d8{0%{text-shadow:.05em 0 0 rgba(255,0,0,.75),-.05em -.025em 0 rgba(0,255,0,.75),-.025em .05em 0 rgba(0,0,255,.75)}14%{text-shadow:.05em 0 0 rgba(255,0,0,.75),-.05em -.025em 0 rgba(0,255,0,.75),-.025em .05em 0 rgba(0,0,255,.75)}15%{text-shadow:-.05em -.025em 0 rgba(255,0,0,.75),.025em .025em 0 rgba(0,255,0,.75),-.05em -.05em 0 rgba(0,0,255,.75)}49%{text-shadow:-.05em -.025em 0 rgba(255,0,0,.75),.025em .025em 0 rgba(0,255,0,.75),-.05em -.05em 0 rgba(0,0,255,.75)}50%{text-shadow:.025em .05em 0 rgba(255,0,0,.75),.05em 0 0 rgba(0,255,0,.75),0 -.05em 0 rgba(0,0,255,.75)}99%{text-shadow:.025em .05em 0 rgba(255,0,0,.75),.05em 0 0 rgba(0,255,0,.75),0 -.05em 0 rgba(0,0,255,.75)}to{text-shadow:-.025em 0 0 rgba(255,0,0,.75),-.025em -.025em 0 rgba(0,255,0,.75),-.025em -.05em 0 rgba(0,0,255,.75)}}@media (prefers-reduced-motion:reduce){*[data-v-8d0265d8],[data-v-8d0265d8]:after,[data-v-8d0265d8]:before{animation-delay:-1ms!important;animation-duration:1ms!important;animation-iteration-count:1!important;background-attachment:scroll!important;scroll-behavior:auto!important;transition-delay:0s!important;transition-duration:0s!important}}.flash[data-v-8d0265d8]{animation:blink-8d0265d8 1s step-end -.4s 1}.blink[data-v-8d0265d8]{animation:blink-8d0265d8 1s step-end 3.2s 1}@keyframes blink-8d0265d8{50%{opacity:0}70%{opacity:1}80%{opacity:0}90%{opacity:1}95%{opacity:0}}",""]),r.locals={},e.exports=r},351:function(e,t,n){"use strict";n.r(t);var r=n(4),o=(n(225),n(11),n(32),{name:"TuVeuxAbandonner",data:function(){return{isVideoVisible:!1,isVidPlaying:!1,videoPlayedCompletely:!1,titleText:"Quitter ?",flash:!1,subtitles:[{text:"Tu veux abandonner ?",startTime:.7,endTime:2.7},{text:"Est-ce que tu veux abandonner ?????",startTime:2.7,endTime:6.6,flash:!0},{text:"iYaaAAARGHHH !!!!",startTime:6.6,endTime:9.1},{text:"Tu es pathétique !!",startTime:9.1,endTime:10.11},{text:"Fuir et fir !!",startTime:10.11,endTime:11.21},{text:"Fir encore !!",startTime:11.21,endTime:12.41},{text:"Toujours fir !!",startTime:12.41,endTime:13.61},{text:"Fir et t'enfir !!",startTime:13.61,endTime:14.81},{text:"Tu n'as pas le droit d'abandonner",startTime:14.81,endTime:20,flash:!0}]}},methods:{close:function(){var e=this;return Object(r.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return e.isVideoVisible=!1,t.next=3,e.sleep(500);case 3:e.resetMedia("tu_veux_abandonner"),e.$emit("close");case 5:case"end":return t.stop()}}),t)})))()},giveMotivation:function(){var e=this;return Object(r.a)(regeneratorRuntime.mark((function t(){var video;return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:(video=e.playMedia("tu_veux_abandonner")).addEventListener("timeupdate",(function(){var t=video.currentTime,n=e.subtitles.find((function(e){return t>=e.startTime&&t<=e.endTime}));e.flash=!(null==n||!n.flash),e.titleText=n?n.text:""}));case 2:case"end":return t.stop()}}),t)})))()},giveUp:function(){var e=this;return Object(r.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:if(t.prev=0,!e.isVideoVisible){t.next=6;break}return e.setState("pause",!1),e.setState("isUserQuitting",!1),e.$router.go(-1),t.abrupt("return");case 6:return e.isVideoVisible=!0,t.next=9,e.sleep(500);case 9:e.isVidPlaying=!0,t.next=16;break;case 12:t.prev=12,t.t0=t.catch(0),console.log("can't let you give up"),e.isVidPlaying=!1;case 16:case"end":return t.stop()}}),t,null,[[0,12]])})))()},onVideoEnded:function(){this.videoPlayedCompletely=!0}},watch:{isVidPlaying:function(e){e?this.giveMotivation():this.pauseMedia("tu_veux_abandonner")}}}),l=(n(344),n(69)),component=Object(l.a)(o,(function(){var e=this,t=e._self._c;return t("section",{staticClass:"fixed z-10 transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90",attrs:{id:"tu-veux-abandonner"}},[t("div",{staticClass:"flex flex-col justify-around h-full px-10"},[t("div",{staticClass:"flex justify-center text-center fixed md:relative top-10 left-0 w-full",class:{fixed:"isVidPlaying"}},[t("h3",{staticClass:"text-4xl md:text-9xl mb-10 glitch text-center",class:{flash:e.flash}},[e._v("\n        "+e._s(e.titleText)+"\n      ")])]),e._v(" "),t("transition",[t("div",{directives:[{name:"show",rawName:"v-show",value:e.isVideoVisible,expression:"isVideoVisible"}],staticClass:"fixed z-10 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex flex-col justify-center items-center"},[t("div",{staticClass:"mx-auto"},[t("video",{attrs:{id:"tu_veux_abandonner",width:"200px",height:"400px"},on:{click:function(t){e.isVidPlaying=!e.isVidPlaying},ended:e.onVideoEnded}},[t("source",{attrs:{src:"/video/tu_veux_abandonner.mp4",type:""}})])])])]),e._v(" "),t("div"),e._v(" "),t("div",{staticClass:"flex justify-center fixed md:relative bottom-10 left-0 w-full"},[t("div",{staticClass:"flex flex-col items-center gap-5 mt-16"},[t("transition",[t("button",{directives:[{name:"show",rawName:"v-show",value:e.videoPlayedCompletely,expression:"videoPlayedCompletely"}],staticClass:"flex w-full items-center uppercase justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:e.close}},[e._v("\n            😅 D'accord chef\n          ")])]),e._v(" "),t("transition",[t("button",{directives:[{name:"show",rawName:"v-show",value:!e.isVidPlaying,expression:"!isVidPlaying"}],staticClass:"flex w-full items-center uppercase justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:e.close}},[e._v("\n            RETOUR\n          ")])]),e._v(" "),t("transition",[t("button",{directives:[{name:"show",rawName:"v-show",value:!e.isVidPlaying,expression:"!isVidPlaying"}],staticClass:"flex w-full items-center justify-center uppercase gap-2 px-3 py-2 rounded bg-red-500",on:{click:e.giveUp}},[e._v("\n            QUITTER\n          ")])])],1)])],1)])}),[],!1,null,"8d0265d8",null);t.default=component.exports}}]);