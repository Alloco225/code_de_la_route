(window.webpackJsonp=window.webpackJsonp||[]).push([[12],{317:function(t,e,n){"use strict";n.r(e);n(35);var r=n(10),o=(n(44),n(43),n(210),n(15),{name:"Quizzes",data:function(){return{category:null,quizzes:[]}},created:function(){var t=this;this.category=this.$store.state.categories.list.find((function(e){var n;return e.id==(null===(n=t.$route.params)||void 0===n?void 0:n.category_id)})),this.quizzes=this.$store.state.quizzes.list.filter((function(e){var n;return e.category_id==(null===(n=t.category)||void 0===n?void 0:n.id)}))},methods:{goBack:function(){this.$router.push({name:"index"})},openQuizz:function(t){var e=this;return Object(r.a)(regeneratorRuntime.mark((function n(){var r;return regeneratorRuntime.wrap((function(n){for(;;)switch(n.prev=n.next){case 0:e.$router.push("/quizz/"+(null===(r=e.category)||void 0===r?void 0:r.id)+"/"+t);case 1:case"end":return n.stop()}}),n)})))()}}}),l=n(55),component=Object(l.a)(o,(function(){var t,e=this,n=e._self._c;return n("div",{staticClass:"bg-gray-700 h-full pt-10"},[n("nav",{staticClass:"absolute top-0 left-0 w-full flex items-center gap-3 px-3 py-2 border-b border-gray-900 shadow bg-gray-800"},[n("button",{staticClass:"rounded bg-opacity-15 text-white bg-white flex justify-center items-center p-2",on:{click:e.goBack}},[n("ion-icon",{attrs:{name:"chevron-back-outline"}})],1),e._v(" "),n("h3",{staticClass:"text-lg text-center text-white"},[e._v("\n      "+e._s(null===(t=e.category)||void 0===t?void 0:t.name)+"\n    ")])]),e._v(" "),n("section",{staticClass:"h-full flex flex-col justify-between py-10"},[n("span"),e._v(" "),0==e.quizzes.length?n("div",{staticClass:"mx-2 p-5 flex flex-col gap-3 justify-center items-center text-gray-300 rounded bg-opacity-10 bg-white h-full"},[n("ion-icon",{staticStyle:{"font-size":"64px"},attrs:{name:"search-outline"}}),e._v(" "),n("h2",{staticClass:"text-xl"},[e._v("Wow such empty")]),e._v(" "),n("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-gray-700 shadow",on:{click:function(t){return e.$router.back()}}},[n("ion-icon",{attrs:{name:"return-up-back-outline"}}),e._v("\n        Retour\n      ")],1)],1):n("ul",{staticClass:"p-3 flex gap-3 flex-col h-full bg-gray-700 overflow-y-scroll"},e._l(e.quizzes,(function(t,i){return n("li",{key:i,staticClass:"flex gap-1 p-2 items-center border rounded bg-white",on:{click:function(t){return e.openQuizz(i)}}},[n("span",{staticClass:"rounded-full w-10 h-10 text-nowrap bg-gray-800 text-white flex justify-center items-center"},[e._v(e._s(i+1))]),e._v(" "),n("div",{staticClass:"flex w-full justify-between"},[n("div",[n("h4",[e._v("Level "+e._s(i+1))]),e._v(" "),n("h4")]),e._v(" "),n("span",{staticClass:"rounded-full flex justify-center items-center"},[e._v("50%")])])])})),0)])])}),[],!1,null,null,null);e.default=component.exports}}]);