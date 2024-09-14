(window.webpackJsonp=window.webpackJsonp||[]).push([[20,16],{341:function(t,e,n){"use strict";n.r(e);n(21),n(54),n(39),n(33),n(222),n(11),n(69);var r={name:"SignGridList",props:{category:{type:Object,required:!0}},data:function(){return{currentSign:!1,currentSignIndex:0}},computed:{signs:function(){var t=this;return this.$store.state.signs.list.filter((function(e){return e.category_id===t.category.id}))}},methods:{showSign:function(t){this.currentSign=t},hideSign:function(){this.currentSign=!1},prevSign:function(){this.currentSignIndex=(this.currentSignIndex-1+this.signs.length)%this.signs.length,this.currentSign=this.signs[this.currentSignIndex]},nextSign:function(){this.currentSignIndex=(this.currentSignIndex+1)%this.signs.length,this.currentSign=this.signs[this.currentSignIndex]},speakSign:function(){var t=this,e=new SpeechSynthesisUtterance(this.currentSign.name,{lang:"fr",voice:speechSynthesis.getVoices().find((function(t){return"fr"===t.lang}))});speechSynthesis.speak(e),this.currentSign.isSpeaking=!0,setTimeout((function(){t.currentSign.isSpeaking=!1;var e=new SpeechSynthesisUtterance(t.currentSign.description,{lang:"fr"});speechSynthesis.speak(e)}),3e3)}}},c=n(68),component=Object(c.a)(r,(function(){var t=this,e=t._self._c;return e("div",{staticClass:"flex flex-col bg-white h-full relative"},[e("header",{staticClass:"p-4 text-center"},[e("h1",{staticClass:"text-2xl font-bold"},[t._v("Panneaux "+t._s(t.category.name))]),t._v(" "),e("p",{staticClass:"text-gray-500"},[t._v("\n      Explorez les panneaux de signalisation de "+t._s(t.category.name)+".\n    ")])]),t._v(" "),e("main",{staticClass:"p-4 mt-10 h-full overflow-y-auto"},[e("div",{staticClass:"grid grid-cols-2 gap-4"},t._l(t.signs,(function(n){return e("article",{key:n.id,staticClass:"cursor-pointer flex flex-col items-center gap-3 bg-gray-100 p-4 border rounded-lg shadow-md",on:{click:function(e){return t.showSign(n)}}},[e("img",{attrs:{src:"/images/signalisation/"+n.category_id+"/"+n.image,alt:"Sign"}}),t._v(" "),e("h2",{staticClass:"text-xl text-center font-medium"},[t._v(t._s(n.name))])])})),0)]),t._v(" "),e("footer",{staticClass:"bg-white p-4 shadow-md"},[e("div",{staticClass:"flex justify-between items-center w-full"},[e("button",{staticClass:"flex gap-2 justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 rounded px-3 py-2 text-white",on:{click:function(e){return t.$router.back()}}},[e("ion-icon",{attrs:{name:"chevron-back-outline"}}),t._v(" Retour\n      ")],1)])]),t._v(" "),t.currentSign?e("article",{staticClass:"absolute bottom-0 left-0 w-full h-full bg-black bg-opacity-50 flex flex-col justify-end items-stretch",on:{click:t.hideSign}},[e("div",{staticClass:"flex flex-col items-center justify-center pb-10 bg-white p-4 border rounded-t-3xl shadow-md",on:{click:function(t){t.stopPropagation()}}},[e("img",{attrs:{src:"/images/signalisation/"+t.currentSign.category_id+"/"+t.currentSign.image,alt:"Sign"}}),t._v(" "),e("button",{staticClass:"absolute top-0 right-0 m-3",on:{click:t.hideSign}},[e("div",{staticClass:"h-10 w-10 flex items-center justify-center bg-gray-500 hover:bg-red-500 text-white rounded-full"},[e("ion-icon",{attrs:{name:"close",size:"large"}})],1)]),t._v(" "),e("div",{staticClass:"absolute left-0 right-0"},[e("div",{staticClass:"flex justify-between items-center w-full px-3"},[e("button",{staticClass:"w-10 h-10 flex justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 text-white rounded-full",on:{click:t.prevSign}},[e("ion-icon",{attrs:{name:"chevron-back-outline",size:"large"}})],1),t._v(" "),e("button",{staticClass:"w-10 h-10 flex justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 text-white rounded-full",on:{click:t.nextSign}},[e("ion-icon",{attrs:{name:"chevron-forward-outline",size:"large"}})],1)])]),t._v(" "),e("h2",{staticClass:"text-xl font-bold mb-3 text-center"},[t._v("\n        "+t._s(t.currentSign.name)+"\n      ")]),t._v(" "),e("p",{staticClass:"text-gray-500 p-3 rounded-lg bg-gray-100"},[t._v("\n        "+t._s(t.currentSign.description)+"\n      ")]),t._v(" "),e("div",{staticClass:"flex justify-around items-center w-full mt-3"},[e("button",{staticClass:"px-3 py-2 flex justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 text-white rounded"},[e("ion-icon",{attrs:{name:"bookmark-outline"}}),t._v(" Ajouter à ma liste\n        ")],1),t._v(" "),e("button",{staticClass:"px-3 py-2 flex justify-center items-center bg-black bg-opacity-50 hover:bg-opacity-100 text-white rounded",on:{click:t.speakSign}},[e("ion-icon",{attrs:{name:"volume-medium-outline"}}),t._v(" Écouter\n        ")],1)])])]):t._e()])}),[],!1,null,null,null);e.default=component.exports},371:function(t,e,n){"use strict";n.r(e);var r=n(4),c=(n(33),n(222),n(11),n(32),{name:"Signs",components:{SignGridList:n(341).default},data:function(){return{currentSign:null,category:null}},created:function(){return Object(r.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:console.log("created categories");case 1:case"end":return t.stop()}}),t)})))()},mounted:function(){var t=this;return Object(r.a)(regeneratorRuntime.mark((function e(){var n;return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:console.log("mounted categories"),n=t.$route.params.id,console.log("mounted",n,t.$route.params),console.log("categoryId",n),t.category=t.$store.state.categories.list.find((function(t){return t.id===n})),console.log("this.category",t.category);case 6:case"end":return e.stop()}}),e)})))()},computed:{signs:function(){var t=this;return this.$store.state.signs.list.filter((function(e){return e.category_id===t.category.id}))}}}),o=n(68),component=Object(o.a)(c,(function(){return(0,this._self._c)("SignGridList",{attrs:{category:this.category}})}),[],!1,null,null,null);e.default=component.exports;installComponents(component,{SignGridList:n(341).default})}}]);