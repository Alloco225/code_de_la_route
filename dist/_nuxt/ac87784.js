(window.webpackJsonp=window.webpackJsonp||[]).push([[9],{337:function(e,t,r){"use strict";r.r(t);r(156),r(32),r(223),r(81),r(226),r(96);var n={name:"QuestionRange",props:{question:{type:Object,required:!0},showCorrectAnswer:{type:Boolean,default:!1}},data:function(){return{answers:[],gridColsCount:null,orderElementCount:null,selectedOrder:[],SEPARATOR:", "}},created:function(){var e=this;this.answers=this.question.correctOrder.split(this.SEPARATOR),this.orderElementCount=this.answers.length,this.shuffleArray(this.answers),this.$nextTick((function(){return e.gridColsCount="grid-cols-"+e.orderElementCount}))},computed:{},methods:{toggleOrderElement:function(element){if(element){if(this.selectedOrder.includes(element)){var e=this.selectedOrder.indexOf(element);this.selectedOrder.splice(e,1);var t=this.answers.indexOf(null);this.answers.splice(t,1,element)}else{var r=this.answers.indexOf(element);this.answers.splice(r,1,null),this.selectedOrder.push(element)}var n,content=this.selectedOrder.join(this.SEPARATOR),o={content:content};if(this.selectedOrder.length==this.orderElementCount)o.isCorrect=content===(null===(n=this.question)||void 0===n?void 0:n.correctOrder),this.$emit("answer",o);else this.$emit("answer",o)}}}},o=r(67),component=Object(o.a)(n,(function(){var e,t,r,n,o=this,l=o._self._c;return l("section",{staticClass:"flex flex-col justify-around h-full p-4"},[l("div",{staticClass:"flex flex-col gap-3 h-full mb-5"},[l("h2",{staticClass:"font-medium p-5 mb-3 text-2xl"},[o._v("\n      "+o._s(null===(e=o.question)||void 0===e?void 0:e.question)+"\n    ")]),o._v(" "),l("div",{staticClass:"rounded flex h-full items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800"},[l("img",{staticClass:"object-contain h-auto w-full rounded",attrs:{src:null===(t=o.question)||void 0===t?void 0:t.image,alt:"Image de la question"}})]),o._v(" "),l("div",{staticClass:"text-gray-800 rounded flex gap-2",class:o.gridColsCount},o._l(o.orderElementCount,(function(i){var e,t;return l("span",{key:i,staticClass:"grow rounded text-gray-800 bg-gray-200 shadow p-2",class:{"bg-green-500 text-white":o.showCorrectAnswer&&o.selectedOrder.join(o.SEPARATOR)==(null===(e=o.question)||void 0===e?void 0:e.correctOrder),"bg-red-500 text-white":o.showCorrectAnswer&&o.selectedOrder.join(o.SEPARATOR)!=(null===(t=o.question)||void 0===t?void 0:t.correctOrder),"bg-gray-200 text-gray-800":o.selectedOrder[i-1],"bg-gray-600 p-5":!o.selectedOrder[i-1]},on:{click:function(e){return o.toggleOrderElement(o.selectedOrder[i-1])}}},[o._v("\n        "+o._s(o.selectedOrder[i-1])+"\n      ")])})),0),o._v(" "),o.showCorrectAnswer&&o.selectedOrder.join(o.SEPARATOR)!=(null===(r=o.question)||void 0===r?void 0:r.correctOrder)?l("div",{staticClass:"bg-gray-200 bg-opacity-10 text-gray-800 rounded flex gap-2",class:o.gridColsCount},o._l(null===(n=o.question)||void 0===n?void 0:n.correctOrder.split(o.SEPARATOR),(function(e,i){return l("span",{key:i,staticClass:"grow rounded shadow p-2 bg-green-500 text-white"},[o._v("\n        "+o._s(e)+"\n      ")])})),0):o._e()]),o._v(" "),l("transition",[l("div",{directives:[{name:"show",rawName:"v-show",value:!o.showCorrectAnswer,expression:"!showCorrectAnswer"}],staticClass:"grid grid-cols-2 py-2 mt-5 gap-3"},o._l(o.orderElementCount,(function(i){var e;return l("button",{key:i,staticClass:"relative rounded text-gray-800 shadow p-2",class:[o.answers[i-1]?"bg-gray-200":"bg-gray-600 p-5"],on:{click:function(e){return o.toggleOrderElement(o.answers[i-1])}}},[l("span",[o._v(o._s(null!==(e=o.answers[i-1])&&void 0!==e?e:" "))])])})),0)])],1)}),[],!1,null,null,null);t.default=component.exports}}]);