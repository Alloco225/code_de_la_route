(window.webpackJsonp=window.webpackJsonp||[]).push([[0,5,7,8,9,10,11,12],{319:function(t,e,n){"use strict";var r=n(3),o=n(6),l=n(69),c=n(224),d=n(223),f=n(5),m=RangeError,h=String,v=Math.floor,x=o(d),w=o("".slice),y=o(1..toFixed),_=function(t,e,n){return 0===e?n:e%2==1?_(t,e-1,n*t):_(t*t,e/2,n)},z=function(data,t,e){for(var n=-1,r=e;++n<6;)r+=t*data[n],data[n]=r%1e7,r=v(r/1e7)},T=function(data,t){for(var e=6,n=0;--e>=0;)n+=data[e],data[e]=v(n/t),n=n%t*1e7},C=function(data){for(var t=6,s="";--t>=0;)if(""!==s||0===t||0!==data[t]){var e=h(data[t]);s=""===s?e:s+x("0",7-e.length)+e}return s};r({target:"Number",proto:!0,forced:f((function(){return"0.000"!==y(8e-5,3)||"1"!==y(.9,0)||"1.25"!==y(1.255,2)||"1000000000000000128"!==y(0xde0b6b3a7640080,0)}))||!f((function(){y({})}))},{toFixed:function(t){var e,n,r,o,d=c(this),f=l(t),data=[0,0,0,0,0,0],v="",y="0";if(f<0||f>20)throw new m("Incorrect fraction digits");if(d!=d)return"NaN";if(d<=-1e21||d>=1e21)return h(d);if(d<0&&(v="-",d=-d),d>1e-21)if(n=(e=function(t){for(var e=0,n=t;n>=4096;)e+=12,n/=4096;for(;n>=2;)e+=1,n/=2;return e}(d*_(2,69,1))-69)<0?d*_(2,-e,1):d/_(2,e,1),n*=4503599627370496,(e=52-e)>0){for(z(data,0,n),r=f;r>=7;)z(data,1e7,0),r-=7;for(z(data,_(10,r,1),0),r=e-1;r>=23;)T(data,1<<23),r-=23;T(data,1<<r),z(data,1,1),T(data,2),y=C(data)}else z(data,0,n),z(data,1<<-e,0),y=C(data)+x("0",f);return y=f>0?v+((o=y.length)<=f?"0."+x("0",f-o)+y:w(y,0,o-f)+"."+w(y,o-f)):v+y}})},320:function(t,e,n){var content=n(327);content.__esModule&&(content=content.default),"string"==typeof content&&(content=[[t.i,content,""]]),content.locals&&(t.exports=content.locals);(0,n(120).default)("cbad5aec",content,!0,{sourceMap:!1})},321:function(t,e,n){"use strict";n.r(e);var r={name:"LoadingSpinner"},o=n(67),component=Object(o.a)(r,(function(){this._self._c;return this._m(0)}),[function(){var t=this,e=t._self._c;return e("div",{staticClass:"bg-white text-center text-white bg-opacity-20 rounded-lg w-10/12 mx-auto px-3 py-5 pb-10"},[e("h5",{staticClass:"font-medium mb-5 text-2xl"},[t._v("Chargement..")]),t._v(" "),e("div",{staticClass:"mx-auto border-4 border-blue-500 rounded-lg animate-spin h-16 w-16"})])}],!1,null,null,null);e.default=component.exports},323:function(t,e,n){"use strict";n.r(e);n(34),n(13);var r=n(4),o=(n(31),n(222),n(53),n(221),n(68),n(328)),l=n(335),c=(n(225),n(121)),d=(n(329),n(330)),f=n(331),m=n(321),h=n(332),v={components:{Countdown:l.default,QuestionTimer:o.default,QuizzEmpty:d.default,QuizzPaused:f.default,TuVeuxAbandonner:h.default,LoadingSpinner:m.default},name:"Quizz",props:{quizz_id:{type:[String,Number],required:!0}},data:function(){return{answersList:[],category:null,category_id:null,currentQuestionIndex:0,isQuizzOver:!1,isGamePaused:!1,isSubmittingAnswer:!1,isUserQuitting:!1,pauseTimer:!0,questions:[],quizz:null,selectedAnswer:null,showCorrectAnswer:!1}},created:function(){var t=this;return Object(r.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return t.toggleLoading("quizz",!0),t.category_id=t.$route.params.category_id,e.next=4,t.fetchQuizz();case 4:t.toggleLoading("quizz",!1);case 5:case"end":return e.stop()}}),e)})))()},mounted:function(){},computed:{currentQuestion:function(){var t;return null!==(t=this.questions[this.currentQuestionIndex])&&void 0!==t?t:null},isLastQuestion:function(){return this.currentQuestionIndex==this.questions.length-1},shouldPauseTimer:function(){return this.pauseTimer||this.isLoading("quizz")||this.isQuizzOver}},methods:{clearLoading:function(){var t=this;setTimeout((function(){t.toggleLoading("quizz",!1)}),300)},clearQuizzData:function(){this.answersList=[],this.currentQuestionIndex=0,this.toggleLoading("quizz",!1),this.isQuizzOver=!1,this.isSubmittingAnswer=!1,this.pauseTimer=!1,this.questions=[],this.selectedAnswer=null,this.showCorrectAnswer=!1},dontQuit:function(){this.setState("isUserQuitting",!1),this.setState("pause",!1)},fetchQuizz:function(){var t=this;return Object(r.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(console.log("fetchQuizz"),!t.$store.state.ui.uiStates.useLocalDB){e.next=5;break}t.quizz=t.$store.state.quizzes.list.find((function(e){return e.id==t.quizz_id})),e.next=8;break;case 5:return e.next=7,c.a.getOne(t.quizz_id);case 7:t.quizz=e.sent;case 8:console.log("result",t.quizz),t.questions=t.quizz.questions;case 10:case"end":return e.stop()}}),e)})))()},endQuizz:function(){console.log("endQuizz"),this.isQuizzOver=!0},initQuizz:function(){var t,e=this;this.setLoading(),this.questions=null!==(t=this.$store.state.quizzes.list.filter((function(t){return t.category_id==e.$route.params.category_id})))&&void 0!==t?t:[],this.questions=this.questions.slice(0,3),console.log("initQuizz",this.questions),this.shuffle(this.questions),this.currentQuestionIndex=0,this.clearLoading(),console.log("this.$refs"),this.launchStartCountDown()},launchStartCountDown:function(){this.$refs.StartCountdown.startTimer()},loadNextQuestion:function(){if(console.log("loadNext"),this.isSubmittingAnswer=!1,this.selectedAnswer=null,this.setLoading(),this.isLastQuestion)return this.endQuizz(),void this.clearLoading();this.showCorrectAnswer=!1,this.currentQuestionIndex++,this.clearLoading(),this.pauseTimer=!1,this.restartTimer()},onGamePaused:function(){this.setState("pause",!0)},onTimeExpired:function(){this.saveAnswer()},restartQuizz:function(){console.log("restart"),this.clearQuizzData(),this.initQuizz()},restartTimer:function(){this.pauseTimer=!1,this.$refs.QuestionTimer.startTimer()},resumeGame:function(){this.setState("pause",!1)},saveAnswer:function(){this.showCorrectAnswer=!0,this.isSubmittingAnswer=!0,this.answersList.push(this.selectedAnswer),setTimeout(this.loadNextQuestion,1e3)},shuffle:function(t){for(var e=t.length;0!=e;){var n=Math.floor(Math.random()*e);e--;var r=[t[n],t[e]];t[e]=r[0],t[n]=r[1]}},submitAnswer:function(){(arguments.length>0&&void 0!==arguments[0]?arguments[0]:{}).acceptEmpty;this.selectedAnswer&&(this.isSubmittingAnswer||(this.pauseTimer=!0,this.saveAnswer()))},setLoading:function(){this.toggleLoading("quizz",!0)},toggleSelectAnswer:function(t){this.showCorrectAnswer||(this.selectedAnswer!=t?this.selectedAnswer=t:this.submitAnswer())},userWantsToQuit:function(){this.setState("isUserQuitting",!0)}}},x=v,w=n(67),component=Object(w.a)(x,(function(){var t,e,n,r,o,l,c,d=this,f=d._self._c;return f("div",{staticClass:"text-center bg-gray-700 h-full flex flex-col py-3 justify-between text-white"},[0==d.questions.length?f("quizz-empty"):f("div",{staticClass:"flex flex-col h-full justify-between"},[f("div",{staticClass:"p-2"},[f("h2",{staticClass:"text-xl flex justify-center gap-3"},[d._v("\n        Question\n        "),f("span",[d._v(" "+d._s(d.currentQuestionIndex+1)+" / "+d._s(null!==(t=null===(e=d.questions)||void 0===e?void 0:e.length)&&void 0!==t?t:"--")+" ")])]),d._v(" "),f("question-timer",{ref:"QuestionTimer",attrs:{pause:d.shouldPauseTimer},on:{"pause-game":d.onGamePaused,"time-expired":d.onTimeExpired}})],1),d._v(" "),d.isLoading("quizz")?f("loading-spinner"):f("section",{staticClass:"flex flex-col justify-around h-full"},[f("div",{staticClass:"flex flex-col gap-3 h-full p-2 mb-5"},[f("h2",{staticClass:"font-medium p-5 mb-5 text-2xl"},[d._v("\n          "+d._s(null===(n=d.currentQuestion)||void 0===n?void 0:n.question)+"\n        ")]),d._v(" "),f("div",{staticClass:"rounded flex h-full items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800 p-2"},[f("img",{staticClass:"w-full object-contain h-36 md:h-32",attrs:{src:null===(r=d.currentQuestion)||void 0===r?void 0:r.image,alt:"Image de la question"}})])]),d._v(" "),f("div",{staticClass:"grid grid-cols-1 p-2 mt-5 gap-3"},d._l(null===(o=d.currentQuestion)||void 0===o?void 0:o.answers,(function(t,i){return f("button",{key:i,staticClass:"relative rounded text-gray-800 bg-gray-200 shadow p-3",class:{"bg-orange-500 text-white":!d.showCorrectAnswer&&d.selectedAnswer==t,"bg-green-500 text-white":d.showCorrectAnswer&&(null==t?void 0:t.isCorrect),"bg-red-500 text-white":d.showCorrectAnswer&&t==d.selectedAnswer&&!(null!=t&&t.isCorrect),"bg-gray-600":d.showCorrectAnswer&&t!=d.selectedAnswer&&!(null!=t&&t.isCorrect)},on:{click:function(e){return d.toggleSelectAnswer(t)}}},[f("span",[d._v(d._s(t.content))])])})),0)]),d._v(" "),f("div",[f("button",{staticClass:"rounded px-3 py-2 mb-10",class:[d.selectedAnswer?"bg-blue-600":"",d.isLoading("quizz")?"invisible":"visible"],on:{click:function(t){return t.preventDefault(),d.submitAnswer.apply(null,arguments)}}},[d._v("\n        "+d._s(d.isSubmittingAnswer?"Question suivante...":"Continuer")+"\n      ")])])],1),d._v(" "),d.questions.length>0?f("countdown",{ref:"StartCountdown",on:{"start-quizz":d.restartTimer}}):d._e(),d._v(" "),d.isQuizzOver?f("quizz-ended",{attrs:{questionCount:d.questions.length,correctAnswerCount:null===(l=d.answersList)||void 0===l?void 0:l.filter((function(t){return t.isCorrect})).length},on:{restart:d.restartQuizz}}):d._e(),d._v(" "),d.state("pause")?f("quizz-paused",{attrs:{questionCount:d.questions.length,correctAnswerCount:null===(c=d.answersList)||void 0===c?void 0:c.filter((function(t){return t.isCorrect})).length},on:{resume:d.resumeGame,quit:d.userWantsToQuit}}):d._e(),d._v(" "),d.state("isUserQuitting")?f("tu-veux-abandonner",{on:{close:d.dontQuit}}):d._e()],1)}),[],!1,null,null,null);e.default=component.exports;installComponents(component,{QuizzEmpty:n(330).default,QuestionTimer:n(328).default,LoadingSpinner:n(321).default,QuizzEnded:n(329).default,QuizzPaused:n(331).default,TuVeuxAbandonner:n(332).default})},326:function(t,e,n){"use strict";n(320)},327:function(t,e,n){var r=n(119)((function(i){return i[1]}));r.push([t.i,".glitch[data-v-74c50ef2]{animation:glitch-74c50ef2 .5s infinite;font-weight:700;position:relative;text-shadow:.05em 0 0 rgba(255,0,0,.75),-.025em -.05em 0 rgba(0,255,0,.75),.025em .05em 0 rgba(0,0,255,.75);text-transform:uppercase}.glitch span[data-v-74c50ef2]{left:0;position:absolute;top:0}.glitch span[data-v-74c50ef2]:first-child{animation:glitch-74c50ef2 .65s infinite;-webkit-clip-path:polygon(0 0,100% 0,100% 45%,0 45%);clip-path:polygon(0 0,100% 0,100% 45%,0 45%);opacity:.8;transform:translate(-.025em,-.0125em)}.glitch span[data-v-74c50ef2]:last-child{animation:glitch-74c50ef2 375ms infinite;-webkit-clip-path:polygon(0 80%,100% 20%,100% 100%,0 100%);clip-path:polygon(0 80%,100% 20%,100% 100%,0 100%);opacity:.8;transform:translate(.0125em,.025em)}@keyframes glitch-74c50ef2{0%{text-shadow:.05em 0 0 rgba(255,0,0,.75),-.05em -.025em 0 rgba(0,255,0,.75),-.025em .05em 0 rgba(0,0,255,.75)}14%{text-shadow:.05em 0 0 rgba(255,0,0,.75),-.05em -.025em 0 rgba(0,255,0,.75),-.025em .05em 0 rgba(0,0,255,.75)}15%{text-shadow:-.05em -.025em 0 rgba(255,0,0,.75),.025em .025em 0 rgba(0,255,0,.75),-.05em -.05em 0 rgba(0,0,255,.75)}49%{text-shadow:-.05em -.025em 0 rgba(255,0,0,.75),.025em .025em 0 rgba(0,255,0,.75),-.05em -.05em 0 rgba(0,0,255,.75)}50%{text-shadow:.025em .05em 0 rgba(255,0,0,.75),.05em 0 0 rgba(0,255,0,.75),0 -.05em 0 rgba(0,0,255,.75)}99%{text-shadow:.025em .05em 0 rgba(255,0,0,.75),.05em 0 0 rgba(0,255,0,.75),0 -.05em 0 rgba(0,0,255,.75)}to{text-shadow:-.025em 0 0 rgba(255,0,0,.75),-.025em -.025em 0 rgba(0,255,0,.75),-.025em -.05em 0 rgba(0,0,255,.75)}}@media (prefers-reduced-motion:reduce){*[data-v-74c50ef2],[data-v-74c50ef2]:after,[data-v-74c50ef2]:before{animation-delay:-1ms!important;animation-duration:1ms!important;animation-iteration-count:1!important;background-attachment:scroll!important;scroll-behavior:auto!important;transition-delay:0s!important;transition-duration:0s!important}}.flash[data-v-74c50ef2]{animation:blink-74c50ef2 1s step-end -.5s 1}.blink[data-v-74c50ef2]{animation:blink-74c50ef2 1s step-end 3.2s 1}@keyframes blink-74c50ef2{50%{opacity:0}70%{opacity:1}80%{opacity:0}90%{opacity:1}95%{opacity:0}}",""]),r.locals={},t.exports=r},328:function(t,e,n){"use strict";n.r(e);n(319),n(68);var r={name:"QuestionTimer",props:{pause:{type:Boolean,default:!1}},data:function(){return{forcePause:!1,START_TIME:10,time:0,timer:null}},mounted:function(){this.startTimer()},computed:{isVisible:function(){return this.time>0},percentage:function(){var t;return 100*this.time/(null!==(t=this.START_TIME)&&void 0!==t?t:1)},percentageColor:function(){return this.percentage<=30?"bg-red-500":this.percentage<=50?"bg-orange-500":this.percentage<=80?"bg-yellow-500":"bg-blue-500"}},methods:{startTimer:function(){var t=this;console.log("startTimer"),this.time=this.START_TIME,clearInterval(this.timer),this.timer=setInterval((function(){t.state("pause")||t.pause||t.forcePause||(t.time-=.1,t.time<.2&&(clearInterval(t.timer),t.$emit("time-expired",t.time)))}),100)}}},o=n(67),component=Object(o.a)(r,(function(){var t=this,e=t._self._c;return e("div",{staticClass:"flex gap-2 mt-3 items-center"},[e("span",{staticClass:"w-5 h-5 flex justify-center items-center",on:{click:function(e){return t.$emit("pause-game")}}},[e("ion-icon",{attrs:{name:"pause-outline",size:"large"}})],1),t._v(" "),e("div",{staticClass:"relative w-full"},[e("div",{staticClass:"h-3 p-0.5 w-full rounded-xl bg-gray-200"},[e("div",{directives:[{name:"show",rawName:"v-show",value:t.percentage>=3,expression:"percentage >= 3"}],staticClass:"z-10 h-full rounded-xl transition-all duration-300 ease-in-out",class:[t.percentageColor],style:"width:"+t.percentage+"%;"})])]),t._v(" "),e("span",{staticClass:"w-5 h-5 flex justify-center items-center font-semibold text-xl",on:{click:function(e){t.forcePause=!t.forcePause}}},[t._v("\n    "+t._s(t.time.toFixed(0))+"\n  ")])])}),[],!1,null,null,null);e.default=component.exports},329:function(t,e,n){"use strict";n.r(e);n(42),n(319),n(221),n(68);var r={name:"QuizzEnded",props:{correctAnswerCount:{required:!0,type:Number,default:0},questionCount:{required:!0,type:Number,default:0}},data:function(){return{MARK_TOTAL:20,score:0,platforms:[{name:"Whatsapp",icon:"logo-whatsapp"},{name:"Facebook",icon:"logo-facebook",link:""},{name:"Twitter",icon:"logo-twitter",link:""},{name:"Linkedin",icon:"logo-linkedin",link:""}]}},mounted:function(){this.calcScore()},computed:{},methods:{calcScore:function(){var t,e=100*this.correctAnswerCount/(null!==(t=this.questionCount)&&void 0!==t?t:0),n=100/this.MARK_TOTAL;this.score=e/n,this.score==this.MARK_TOTAL&&this.throwConfetti()},goBackToQuizzList:function(){this.$router.back()},goToMenu:function(){this.$router.push({name:"index"})},restart:function(){this.$emit("restart")},shareScore:function(t){},throwConfetti:function(){var t=this;setTimeout((function(){console.log("confetti !!"),t.$confetti.start(),setTimeout((function(){t.$confetti.stop()}),2e3)}),500)}}},o=n(67),component=Object(o.a)(r,(function(){var t=this,e=t._self._c;return e("section",{staticClass:"fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90",attrs:{id:"quizz-ended"}},[e("h3",{staticClass:"text-2xl mb-10"},[t._v("Quizz Terminé")]),t._v(" "),e("div",{staticClass:"rounded-full text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse",class:{"bg-green-500":t.score==t.MARK_TOTAL,"bg-blue-500":t.score<t.MARK_TOTAL,"bg-orange-500":t.score<=t.MARK_TOTAL/2,"bg-red-500":t.score<=t.MARK_TOTAL/3}},[t._v(t._s(t.score.toFixed(0))+"/"+t._s(t.MARK_TOTAL))]),t._v(" "),e("div",{staticClass:"text-center flex flex-col justify-center items-center gap-2 mt-5"},[e("span",{staticClass:"rounded-full p-2 w-16 h-16 flex justify-center items-center bg-white bg-opacity-40"},[e("ion-icon",{attrs:{name:"arrow-redo-outline",size:"large"}})],1),t._v(" "),e("span",[t._v("\n      Partager mon score\n    ")]),t._v(" "),e("div",{staticClass:"flex justify-center gap-3 items-center"},t._l(t.platforms,(function(t){return e("span",{key:t.name},[e("ion-icon",{attrs:{name:t.icon,size:"large"}})],1)})),0)]),t._v(" "),e("div",{staticClass:"flex flex-col gap-2 mt-10"},[e("div",{staticClass:"flex gap-2"},[e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:t.goBackToQuizzList}},[e("ion-icon",{attrs:{name:"return-up-back-outline"}}),t._v("\n        Retour\n      ")],1),t._v(" "),e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-green-500",on:{click:t.restart}},[e("ion-icon",{attrs:{name:"refresh-outline"}}),t._v("\n        Réessayer\n      ")],1)]),t._v(" "),e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500",on:{click:t.goToMenu}},[e("ion-icon",{attrs:{name:"home-outline"}}),t._v("\n      Menu\n    ")],1)])])}),[],!1,null,null,null);e.default=component.exports},330:function(t,e,n){"use strict";n.r(e);var r={name:"QuizzEmpty"},o=n(67),component=Object(o.a)(r,(function(){var t=this,e=t._self._c;return e("div",{staticClass:"mx-2 p-5 flex flex-col gap-3 justify-center items-center text-gray-300 rounded bg-opacity-10 bg-white h-full"},[e("ion-icon",{staticStyle:{"font-size":"64px"},attrs:{name:"search-outline"}}),t._v(" "),e("h2",{staticClass:"text-xl"},[t._v("Wow such empty")]),t._v(" "),e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-gray-700 shadow",on:{click:function(e){return t.$router.back()}}},[e("ion-icon",{attrs:{name:"return-up-back-outline"}}),t._v("\n     Retour\n   ")],1)],1)}),[],!1,null,null,null);e.default=component.exports},331:function(t,e,n){"use strict";n.r(e);n(221),n(68);var r={name:"QuizzPaused",props:{correctAnswerCount:{required:!0,type:Number,default:0},questionCount:{required:!0,type:Number,default:0}},data:function(){return{MARK_TOTAL:20,score:0,platforms:[{name:"Whatsapp",icon:"logo-whatsapp"},{name:"Facebook",icon:"logo-facebook",link:""},{name:"Twitter",icon:"logo-twitter",link:""},{name:"Linkedin",icon:"logo-linkedin",link:""}]}},mounted:function(){this.calcScore()},computed:{},methods:{calcScore:function(){var t,e=100*this.correctAnswerCount/(null!==(t=this.questionCount)&&void 0!==t?t:0),n=100/this.MARK_TOTAL;this.score=e/n,this.score==this.MARK_TOTAL&&this.throwConfetti()},goBackToQuizzList:function(){this.$router.back()},goToMenu:function(){},resumeGame:function(){this.$emit("resume")},restart:function(){this.$emit("restart")},shareScore:function(t){},throwConfetti:function(){var t=this;setTimeout((function(){console.log("confetti !!"),t.$confetti.start(),setTimeout((function(){t.$confetti.stop()}),2e3)}),500)},toujourFuirFuirEtRefuir:function(){this.$emit("quit")}}},o=n(67),component=Object(o.a)(r,(function(){var t=this,e=t._self._c;return e("section",{staticClass:"fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90",attrs:{id:"countdown"}},[e("h3",{staticClass:"text-2xl mb-10 uppercase"},[t._v("Pause")]),t._v(" "),e("div",{staticClass:"rounded-full text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse"},[e("ion-icon",{attrs:{name:"pause-circle-outline"}})],1),t._v(" "),e("div",{staticClass:"flex flex-col items-center gap-8 mt-10"},[e("div",{staticClass:"flex flex-row-reverse gap-2"},[e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:t.resumeGame}},[e("ion-icon",{attrs:{name:"play-outline"}}),t._v("\n        Continuer\n      ")],1),t._v(" "),e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500",on:{click:t.toujourFuirFuirEtRefuir}},[e("ion-icon",{attrs:{name:"trash-bin-outline"}}),t._v("\n        Abandonner\n      ")],1)])])])}),[],!1,null,null,null);e.default=component.exports},332:function(t,e,n){"use strict";n.r(e);var r=n(4),o=(n(222),n(13),n(31),{name:"TuVeuxAbandonner",data:function(){return{isVideoVisible:!1,isVidPlaying:!1,videoPlayedCompletely:!1,titleText:"Quitter ?",flash:!1,subtitles:[{text:"Tu veux abandonner ?",startTime:.8,endTime:3},{text:"Est-ce que tu veux abandonner ?????",startTime:3,endTime:6.11,flash:!0},{text:"iYaaAAARGHHH !!!!",startTime:6.11,endTime:9.11},{text:"Tu es pathétique !!",startTime:9.11,endTime:10.11},{text:"Fuir et fir !!",startTime:10.11,endTime:11.21},{text:"Fir encore !!",startTime:11.21,endTime:12.41},{text:"Toujours fir !!",startTime:12.41,endTime:13.61},{text:"Fir et t'enfir !!",startTime:13.61,endTime:14.81},{text:"Tu n'as pas le droit d'abandonner",startTime:14.81,endTime:20}]}},methods:{close:function(){var t=this;return Object(r.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return t.isVideoVisible=!1,e.next=3,t.sleep(500);case 3:t.resetMedia("tu_veux_abandonner"),t.$emit("close");case 5:case"end":return e.stop()}}),e)})))()},giveMotivation:function(){var t=this;return Object(r.a)(regeneratorRuntime.mark((function e(){var video;return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:(video=t.playMedia("tu_veux_abandonner")).addEventListener("timeupdate",(function(){var e=video.currentTime,n=t.subtitles.find((function(t){return e>=t.startTime&&e<=t.endTime}));t.flash=!!n.flash,t.titleText=n?n.text:""}));case 2:case"end":return e.stop()}}),e)})))()},giveUp:function(){var t=this;return Object(r.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.prev=0,t.isVideoVisible=!0,e.next=4,t.sleep(500);case 4:t.isVidPlaying=!0,e.next=11;break;case 7:e.prev=7,e.t0=e.catch(0),console.log("can't let you give up"),t.isVidPlaying=!1;case 11:case"end":return e.stop()}}),e,null,[[0,7]])})))()},showText:function(text,t){var e=this;return Object(r.a)(regeneratorRuntime.mark((function n(){return regeneratorRuntime.wrap((function(n){for(;;)switch(n.prev=n.next){case 0:if(!e.isVideoVisible){n.next=4;break}return n.next=3,e.sleep(t);case 3:e.titleText=text;case 4:case"end":return n.stop()}}),n)})))()},onVideoEnded:function(){this.videoPlayedCompletely=!0},pauseGame:function(){this.isVidPlaying=!1}},watch:{isVidPlaying:function(t){t?this.giveMotivation():this.pauseMedia("tu_veux_abandonner")}}}),l=(n(326),n(67)),component=Object(l.a)(o,(function(){var t=this,e=t._self._c;return e("section",{staticClass:"fixed z-10 transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90",attrs:{id:"tu-veux-abandonner"}},[e("div",{staticClass:"flex flex-col justify-around h-full px-10"},[e("div",{staticClass:"flex justify-center text-center fixed md:relative top-10 left-0 w-full",class:{fixed:"isVidPlaying"}},[e("h3",{staticClass:"text-4xl md:text-9xl mb-10 glitch text-center",class:{flash:t.flash}},[t._v("\n        "+t._s(t.titleText)+"\n      ")])]),t._v(" "),e("transition",[e("div",{directives:[{name:"show",rawName:"v-show",value:t.isVideoVisible,expression:"isVideoVisible"}],staticClass:"fixed z-10 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex flex-col justify-center items-center"},[e("div",{staticClass:"mx-auto"},[e("video",{attrs:{id:"tu_veux_abandonner",width:"200px",height:"400px"},on:{click:function(e){t.isVidPlaying=!t.isVidPlaying},ended:t.onVideoEnded}},[e("source",{attrs:{src:"/video/tu_veux_abandonner.mp4",type:""}})])])])]),t._v(" "),e("div"),t._v(" "),e("div",{staticClass:"flex justify-center fixed md:relative bottom-10 left-0 w-full"},[e("div",{staticClass:"flex flex-col items-center gap-5 mt-16"},[e("transition",[e("button",{directives:[{name:"show",rawName:"v-show",value:t.videoPlayedCompletely,expression:"videoPlayedCompletely"}],staticClass:"flex w-full items-center uppercase justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:t.close}},[t._v("\n            😅 D'accord chef\n          ")])]),t._v(" "),e("transition",[e("button",{directives:[{name:"show",rawName:"v-show",value:!t.isVidPlaying,expression:"!isVidPlaying"}],staticClass:"flex w-full items-center uppercase justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:t.close}},[t._v("\n            RETOUR\n          ")])]),t._v(" "),e("transition",[e("button",{directives:[{name:"show",rawName:"v-show",value:!t.isVidPlaying,expression:"!isVidPlaying"}],staticClass:"flex w-full items-center justify-center uppercase gap-2 px-3 py-2 rounded bg-red-500",on:{click:t.giveUp}},[t._v("\n            QUITTER\n          ")])])],1)])],1)])}),[],!1,null,"74c50ef2",null);e.default=component.exports},335:function(t,e,n){"use strict";n.r(e);n(68);var r={name:"StartCountdown",data:function(){return{time:2,timer:null}},mounted:function(){this.startTimer()},computed:{isVisible:function(){return this.time>0}},methods:{startTimer:function(){var t=this;clearInterval(this.timer),this.timer=setInterval((function(){t.time--,t.time<=0&&(t.$emit("start-quizz"),clearInterval(t.timer))}),1e3)}}},o=n(67),component=Object(o.a)(r,(function(){var t=this,e=t._self._c;return e("div",[e("transition",[e("section",{directives:[{name:"show",rawName:"v-show",value:t.isVisible,expression:"isVisible"}],staticClass:"fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex justify-center items-center bg-blue-700 bg-opacity-80",attrs:{id:"countdown"}},[e("div",{staticClass:"absolute top-1/3 rounded-full bg-blue-700 text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse"},[t._v("\n        "+t._s(t.time)+"\n      ")])])])],1)}),[],!1,null,null,null);e.default=component.exports}}]);