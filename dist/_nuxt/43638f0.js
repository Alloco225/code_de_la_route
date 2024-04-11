(window.webpackJsonp=window.webpackJsonp||[]).push([[10,5,6,7],{316:function(t,e,n){"use strict";var r=n(3),o=n(6),l=n(68),c=n(221),d=n(220),f=n(5),h=RangeError,m=String,v=Math.floor,w=o(d),x=o("".slice),_=o(1..toFixed),C=function(t,e,n){return 0===e?n:e%2==1?C(t,e-1,n*t):C(t*t,e/2,n)},T=function(data,t,e){for(var n=-1,r=e;++n<6;)r+=t*data[n],data[n]=r%1e7,r=v(r/1e7)},z=function(data,t){for(var e=6,n=0;--e>=0;)n+=data[e],data[e]=v(n/t),n=n%t*1e7},y=function(data){for(var t=6,s="";--t>=0;)if(""!==s||0===t||0!==data[t]){var e=m(data[t]);s=""===s?e:s+w("0",7-e.length)+e}return s};r({target:"Number",proto:!0,forced:f((function(){return"0.000"!==_(8e-5,3)||"1"!==_(.9,0)||"1.25"!==_(1.255,2)||"1000000000000000128"!==_(0xde0b6b3a7640080,0)}))||!f((function(){_({})}))},{toFixed:function(t){var e,n,r,o,d=c(this),f=l(t),data=[0,0,0,0,0,0],v="",_="0";if(f<0||f>20)throw new h("Incorrect fraction digits");if(d!=d)return"NaN";if(d<=-1e21||d>=1e21)return m(d);if(d<0&&(v="-",d=-d),d>1e-21)if(n=(e=function(t){for(var e=0,n=t;n>=4096;)e+=12,n/=4096;for(;n>=2;)e+=1,n/=2;return e}(d*C(2,69,1))-69)<0?d*C(2,-e,1):d/C(2,e,1),n*=4503599627370496,(e=52-e)>0){for(T(data,0,n),r=f;r>=7;)T(data,1e7,0),r-=7;for(T(data,C(10,r,1),0),r=e-1;r>=23;)z(data,1<<23),r-=23;z(data,1<<r),T(data,1,1),z(data,2),_=y(data)}else T(data,0,n),T(data,1<<-e,0),_=y(data)+w("0",f);return _=f>0?v+((o=_.length)<=f?"0."+w("0",f-o)+_:x(_,0,o-f)+"."+x(_,o-f)):v+_}})},320:function(t,e,n){"use strict";n.r(e);n(316),n(81);var r={name:"QuestionTimer",props:{pause:{type:Boolean,default:!1}},data:function(){return{forcePause:!1,START_TIME:10,time:0,timer:null}},mounted:function(){this.startTimer()},computed:{isVisible:function(){return this.time>0},percentage:function(){var t;return 100*this.time/(null!==(t=this.START_TIME)&&void 0!==t?t:1)}},methods:{startTimer:function(){var t=this;console.log("startTimer"),this.time=this.START_TIME,clearInterval(this.timer),this.timer=setInterval((function(){t.pause||t.forcePause||(t.time-=.1,t.time<.2&&(clearInterval(t.timer),t.$emit("time-expired",t.time)))}),100)}}},o=n(67),component=Object(o.a)(r,(function(){var t=this,e=t._self._c;return e("div",{staticClass:"flex gap-2 mt-3 items-center"},[e("div",{staticClass:"relative w-full"},[e("div",{staticClass:"h-3 p-0.5 w-full rounded-xl bg-gray-200"},[e("div",{directives:[{name:"show",rawName:"v-show",value:t.percentage>=3,expression:"percentage >= 3"}],staticClass:"z-10 h-full rounded-xl bg-blue-500 transition-all duration-300 ease-in-out",class:{"bg-yellow-500":t.percentage<=80,"bg-orange-500":t.percentage<=50,"bg-red-500":t.percentage<=30},style:"width:"+t.percentage+"%;"})])]),t._v(" "),e("span",{staticClass:"w-5 h-5 flex justify-center items-center font-semibold text-xl",on:{click:function(e){t.forcePause=!t.forcePause}}},[t._v("\n    "+t._s(t.time.toFixed(0))+"\n  ")])])}),[],!1,null,null,null);e.default=component.exports},323:function(t,e,n){"use strict";n.r(e);n(81);var r={name:"StartCountdown",data:function(){return{time:2,timer:null}},mounted:function(){this.startTimer()},computed:{isVisible:function(){return this.time>0}},methods:{startTimer:function(){var t=this;clearInterval(this.timer),this.timer=setInterval((function(){t.time--,t.time<=0&&(t.$emit("start-quizz"),clearInterval(t.timer))}),1e3)}}},o=n(67),component=Object(o.a)(r,(function(){var t=this,e=t._self._c;return e("div",[e("transition",[e("section",{directives:[{name:"show",rawName:"v-show",value:t.isVisible,expression:"isVisible"}],staticClass:"fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex justify-center items-center bg-blue-700 bg-opacity-80",attrs:{id:"countdown"}},[e("div",{staticClass:"absolute top-1/3 rounded-full bg-blue-700 text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse"},[t._v("\n        "+t._s(t.time)+"\n      ")])])])],1)}),[],!1,null,null,null);e.default=component.exports},324:function(t,e,n){"use strict";n.r(e);n(37),n(316),n(222),n(81);var r={name:"QuizzEnded",props:{correctAnswerCount:{required:!0,type:Number,default:0},questionCount:{required:!0,type:Number,default:0}},data:function(){return{MARK_TOTAL:20,score:0,platforms:[{name:"Whatsapp",icon:"logo-whatsapp"},{name:"Facebook",icon:"logo-facebook",link:""},{name:"Twitter",icon:"logo-twitter",link:""},{name:"Linkedin",icon:"logo-linkedin",link:""}]}},mounted:function(){this.calcScore()},computed:{},methods:{calcScore:function(){var t,e=100*this.correctAnswerCount/(null!==(t=this.questionCount)&&void 0!==t?t:0),n=100/this.MARK_TOTAL;this.score=e/n,this.score==this.MARK_TOTAL&&this.throwConfetti()},goBackToQuizzList:function(){this.$router.back()},goToMenu:function(){this.$router.push({name:"index"})},restart:function(){this.$emit("restart")},shareScore:function(t){},throwConfetti:function(){var t=this;setTimeout((function(){console.log("confetti !!"),t.$confetti.start(),setTimeout((function(){t.$confetti.stop()}),2e3)}),500)}}},o=n(67),component=Object(o.a)(r,(function(){var t=this,e=t._self._c;return e("section",{staticClass:"fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90",attrs:{id:"countdown"}},[e("h3",{staticClass:"text-2xl mb-10"},[t._v("Quizz Terminé")]),t._v(" "),e("div",{staticClass:"rounded-full text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse",class:{"bg-green-500":t.score==t.MARK_TOTAL,"bg-blue-500":t.score<t.MARK_TOTAL,"bg-orange-500":t.score<=t.MARK_TOTAL/2,"bg-red-500":t.score<=t.MARK_TOTAL/3}},[t._v(t._s(t.score.toFixed(0))+"/"+t._s(t.MARK_TOTAL))]),t._v(" "),e("div",{staticClass:"text-center flex flex-col justify-center items-center gap-2 mt-5"},[e("span",{staticClass:"rounded-full p-2 w-16 h-16 flex justify-center items-center bg-white bg-opacity-40"},[e("ion-icon",{attrs:{name:"arrow-redo-outline",size:"large"}})],1),t._v(" "),e("span",[t._v("\n      Partager mon score\n    ")]),t._v(" "),e("div",{staticClass:"flex justify-center gap-3 items-center"},t._l(t.platforms,(function(t){return e("span",{key:t.name},[e("ion-icon",{attrs:{name:t.icon,size:"large"}})],1)})),0)]),t._v(" "),e("div",{staticClass:"flex flex-col gap-2 mt-10"},[e("div",{staticClass:"flex gap-2"},[e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:t.goBackToQuizzList}},[e("ion-icon",{attrs:{name:"return-up-back-outline"}}),t._v("\n        Retour\n      ")],1),t._v(" "),e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-green-500",on:{click:t.restart}},[e("ion-icon",{attrs:{name:"refresh-outline"}}),t._v("\n        Réessayer\n      ")],1)]),t._v(" "),e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500",on:{click:t.goToMenu}},[e("ion-icon",{attrs:{name:"home-outline"}}),t._v("\n      Menu\n    ")],1)])])}),[],!1,null,null,null);e.default=component.exports},332:function(t,e,n){"use strict";n.r(e);n(38),n(12),n(47),n(81);var r=n(320),o={components:{Countdown:n(323).default,QuestionTimer:r.default},name:"Quizz",data:function(){return{answersList:[],currentQuestionIndex:0,isLoading:!0,isQuizzOver:!1,isSubmittingAnswer:!1,pauseTimer:!0,questions:[],selectedAnswer:null,showCorrectAnswer:!1}},mounted:function(){this.initQuizz()},computed:{currentQuestion:function(){var t;return null!==(t=this.questions[this.currentQuestionIndex])&&void 0!==t?t:null},isLastQuestion:function(){return this.currentQuestionIndex==this.questions.length-1},shouldPauseTimer:function(){return this.pauseTimer||this.isLoading||this.isQuizzOver}},methods:{clearLoading:function(){var t=this;setTimeout((function(){t.isLoading=!1}),300)},clearQuizzData:function(){this.answersList=[],this.currentQuestionIndex=0,this.isLoading=!1,this.isQuizzOver=!1,this.isSubmittingAnswer=!1,this.pauseTimer=!1,this.questions=[],this.selectedAnswer=null,this.showCorrectAnswer=!1},endQuizz:function(){console.log("endQuizz"),this.isQuizzOver=!0},initQuizz:function(){var t,e=this;this.setLoading(),this.questions=null!==(t=this.$store.state.quizzes.list.filter((function(t){return t.category_id==e.$route.params.category_id})))&&void 0!==t?t:[],this.questions=this.questions.slice(0,3),console.log("initQuizz",this.questions),this.shuffle(this.questions),this.currentQuestionIndex=0,this.clearLoading(),console.log("this.$refs"),this.launchStartCountDown()},launchStartCountDown:function(){this.$refs.StartCountdown.startTimer()},loadNextQuestion:function(){if(console.log("loadNext"),this.isSubmittingAnswer=!1,this.selectedAnswer=null,this.setLoading(),this.isLastQuestion)return this.endQuizz(),void this.clearLoading();this.showCorrectAnswer=!1,this.currentQuestionIndex++,this.clearLoading(),this.pauseTimer=!1,this.restartTimer()},onTimeExpired:function(){this.loadNextQuestion()},restartQuizz:function(){console.log("restart"),this.clearQuizzData(),this.initQuizz()},restartTimer:function(){this.pauseTimer=!1,this.$refs.QuestionTimer.startTimer()},shuffle:function(t){for(var e=t.length;0!=e;){var n=Math.floor(Math.random()*e);e--;var r=[t[n],t[e]];t[e]=r[0],t[n]=r[1]}},submitAnswer:function(){this.selectedAnswer&&(this.isSubmittingAnswer||(this.pauseTimer=!0,this.showCorrectAnswer=!0,this.isSubmittingAnswer=!0,this.answersList.push(this.selectedAnswer),setTimeout(this.loadNextQuestion,1e3)))},setLoading:function(){this.isLoading=!0},toggleSelectAnswer:function(t){this.showCorrectAnswer||(this.selectedAnswer!=t?this.selectedAnswer=t:this.submitAnswer())}}},l=n(67),component=Object(l.a)(o,(function(){var t,e,n,r,o,l,c=this,d=c._self._c;return d("div",{staticClass:"text-center bg-gray-700 h-full flex flex-col py-3 justify-between text-white"},[0==c.questions.length?d("div",{staticClass:"mx-2 p-5 flex flex-col gap-3 justify-center items-center text-gray-300 rounded bg-opacity-10 bg-white h-full"},[d("ion-icon",{staticStyle:{"font-size":"64px"},attrs:{name:"search-outline"}}),c._v(" "),d("h2",{staticClass:"text-xl"},[c._v("Wow such empty")]),c._v(" "),d("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-gray-700 shadow",on:{click:function(t){return c.$router.back()}}},[d("ion-icon",{attrs:{name:"return-up-back-outline"}}),c._v("\n      Retour\n    ")],1)],1):d("div",{staticClass:"flex flex-col h-full justify-between"},[d("div",{staticClass:"p-2"},[d("h2",{staticClass:"text-xl flex justify-center gap-3"},[c._v("\n        Question\n        "),d("span",[c._v("\n          "+c._s(c.currentQuestionIndex+1)+" / "+c._s(null!==(t=null===(e=c.questions)||void 0===e?void 0:e.length)&&void 0!==t?t:"--")+"\n        ")])]),c._v(" "),d("question-timer",{ref:"QuestionTimer",attrs:{pause:c.shouldPauseTimer},on:{"time-expired":c.onTimeExpired}})],1),c._v(" "),c.isLoading?d("div",{staticClass:"bg-white bg-opacity-20 rounded-lg w-10/12 mx-auto px-3 py-5 pb-10"},[d("h5",{staticClass:"font-medium mb-5 text-2xl"},[c._v("Chargement..")]),c._v(" "),d("div",{staticClass:"mx-auto border-4 border-blue-500 rounded-lg animate-spin h-16 w-16"})]):d("section",{staticClass:"flex flex-col justify-around h-full"},[d("div",{staticClass:"flex flex-col gap-3 h-full p-2 mb-5"},[d("h2",{staticClass:"font-medium p-5 mb-5 text-2xl"},[c._v("\n          "+c._s(null===(n=c.currentQuestion)||void 0===n?void 0:n.question)+"\n        ")]),c._v(" "),d("div",{staticClass:"rounded flex h-full items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800 p-2"},[d("img",{staticClass:"w-full object-contain h-36 md:h-32",attrs:{src:null===(r=c.currentQuestion)||void 0===r?void 0:r.image,alt:"Image de la question"}})])]),c._v(" "),d("div",{staticClass:"grid grid-cols-1 p-2 mt-5 gap-3"},c._l(null===(o=c.currentQuestion)||void 0===o?void 0:o.answers,(function(t,i){return d("button",{key:i,staticClass:"relative rounded text-gray-800 bg-gray-200 shadow p-3",class:{"bg-orange-500 text-white":!c.showCorrectAnswer&&c.selectedAnswer==t,"bg-green-500 text-white":c.showCorrectAnswer&&(null==t?void 0:t.isCorrect),"bg-red-500 text-white":c.showCorrectAnswer&&t==c.selectedAnswer&&!(null!=t&&t.isCorrect),"bg-gray-600":c.showCorrectAnswer&&t!=c.selectedAnswer&&!(null!=t&&t.isCorrect)},on:{click:function(e){return c.toggleSelectAnswer(t)}}},[d("span",[c._v(c._s(t.content))])])})),0)]),c._v(" "),d("div",[d("button",{staticClass:"rounded px-3 py-2 mb-10",class:[c.selectedAnswer?"bg-blue-600":"",c.isLoading?"invisible":"visible"],on:{click:function(t){return t.preventDefault(),c.submitAnswer.apply(null,arguments)}}},[c._v("\n        "+c._s(c.isSubmittingAnswer?"Question suivante...":"Continuer")+"\n      ")])])]),c._v(" "),c.questions.length>0?d("countdown",{ref:"StartCountdown",on:{"start-quizz":c.restartTimer}}):c._e(),c._v(" "),c.isQuizzOver?d("quizz-ended",{attrs:{questionCount:c.questions.length,correctAnswerCount:null===(l=c.answersList)||void 0===l?void 0:l.filter((function(t){return t.isCorrect})).length},on:{restart:c.restartQuizz}}):c._e()],1)}),[],!1,null,null,null);e.default=component.exports;installComponents(component,{QuestionTimer:n(320).default,QuizzEnded:n(324).default})}}]);