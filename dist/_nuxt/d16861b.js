(window.webpackJsonp=window.webpackJsonp||[]).push([[8],{336:function(e,t,n){"use strict";n.r(t);var r={name:"QuestionImage",props:{question:{type:Object,required:!0},showCorrectAnswer:{type:Boolean,default:!1}},data:function(){return{selectedAnswer:null}},methods:{toggleSelectAnswer:function(e){if(!this.showCorrectAnswer){if(this.selectedAnswer==e)return this.$emit("submit-answer"),void console.log("submit answer");this.selectedAnswer=e,console.log("answer"),this.$emit("answer",this.selectedAnswer)}}}},l=n(67),component=Object(l.a)(r,(function(){var e,t,n,r=this,l=r._self._c;return l("section",{staticClass:"flex flex-col justify-around h-full p-3 px-5"},[l("div",{staticClass:"flex flex-col gap-3 h-full mb-3"},[l("h2",{staticClass:"font-medium p-5 mb-1 text-2xl"},[r._v("\n        "+r._s(null===(e=r.question)||void 0===e?void 0:e.question)+"\n      ")]),r._v(" "),l("div",{staticClass:"rounded flex h-full items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800 p-2"},[l("img",{staticClass:"w-full object-contain h-36 md:h-32",attrs:{src:null===(t=r.question)||void 0===t?void 0:t.image,alt:"Image de la question"}})])]),r._v(" "),l("div",{staticClass:"grid grid-cols-1 mt-5 gap-3"},r._l(null===(n=r.question)||void 0===n?void 0:n.answers,(function(e,i){return l("button",{key:i,staticClass:"relative rounded text-gray-800 bg-gray-200 shadow p-3",class:{"bg-orange-500 text-white":!r.showCorrectAnswer&&r.selectedAnswer==e,"bg-green-500 text-white":r.showCorrectAnswer&&(null==e?void 0:e.isCorrect),"bg-red-500 text-white":r.showCorrectAnswer&&e==r.selectedAnswer&&!(null!=e&&e.isCorrect),"bg-gray-600":r.showCorrectAnswer&&e!=r.selectedAnswer&&!(null!=e&&e.isCorrect)},on:{click:function(t){return r.toggleSelectAnswer(e)}}},[l("span",[r._v(r._s(e.content))])])})),0)])}),[],!1,null,null,null);t.default=component.exports}}]);