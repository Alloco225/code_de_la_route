(window.webpackJsonp=window.webpackJsonp||[]).push([[0,5,7,8,9,10,13,14,15,16,17],{319:function(e,t,n){"use strict";var r=n(3),o=n(6),l=n(69),c=n(225),d=n(224),f=n(5),m=RangeError,h=String,v=Math.floor,w=o(d),x=o("".slice),y=o(1..toFixed),_=function(e,t,n){return 0===t?n:t%2==1?_(e,t-1,n*e):_(e*e,t/2,n)},C=function(data,e,t){for(var n=-1,r=t;++n<6;)r+=e*data[n],data[n]=r%1e7,r=v(r/1e7)},T=function(data,e){for(var t=6,n=0;--t>=0;)n+=data[t],data[t]=v(n/e),n=n%e*1e7},A=function(data){for(var e=6,s="";--e>=0;)if(""!==s||0===e||0!==data[e]){var t=h(data[e]);s=""===s?t:s+w("0",7-t.length)+t}return s};r({target:"Number",proto:!0,forced:f((function(){return"0.000"!==y(8e-5,3)||"1"!==y(.9,0)||"1.25"!==y(1.255,2)||"1000000000000000128"!==y(0xde0b6b3a7640080,0)}))||!f((function(){y({})}))},{toFixed:function(e){var t,n,r,o,d=c(this),f=l(e),data=[0,0,0,0,0,0],v="",y="0";if(f<0||f>20)throw new m("Incorrect fraction digits");if(d!=d)return"NaN";if(d<=-1e21||d>=1e21)return h(d);if(d<0&&(v="-",d=-d),d>1e-21)if(n=(t=function(e){for(var t=0,n=e;n>=4096;)t+=12,n/=4096;for(;n>=2;)t+=1,n/=2;return t}(d*_(2,69,1))-69)<0?d*_(2,-t,1):d/_(2,t,1),n*=4503599627370496,(t=52-t)>0){for(C(data,0,n),r=f;r>=7;)C(data,1e7,0),r-=7;for(C(data,_(10,r,1),0),r=t-1;r>=23;)T(data,1<<23),r-=23;T(data,1<<r),C(data,1,1),T(data,2),y=A(data)}else C(data,0,n),C(data,1<<-t,0),y=A(data)+w("0",f);return y=f>0?v+((o=y.length)<=f?"0."+w("0",f-o)+y:x(y,0,o-f)+"."+x(y,o-f)):v+y}})},320:function(e,t,n){var content=n(327);content.__esModule&&(content=content.default),"string"==typeof content&&(content=[[e.i,content,""]]),content.locals&&(e.exports=content.locals);(0,n(120).default)("00682b3b",content,!0,{sourceMap:!1})},321:function(e,t,n){"use strict";n.r(t);var r={name:"LoadingSpinner"},o=n(67),component=Object(o.a)(r,(function(){this._self._c;return this._m(0)}),[function(){var e=this,t=e._self._c;return t("div",{staticClass:"bg-white text-center text-white bg-opacity-20 rounded-lg w-10/12 mx-auto px-3 py-5 pb-10"},[t("h5",{staticClass:"font-medium mb-5 text-2xl"},[e._v("Chargement..")]),e._v(" "),t("div",{staticClass:"mx-auto border-4 border-blue-500 rounded-lg animate-spin h-16 w-16"})])}],!1,null,null,null);t.default=component.exports},323:function(e,t,n){"use strict";n.r(t);n(34),n(13);var r=n(4),o=(n(31),n(222),n(221),n(68),n(328)),l=n(335),c=(n(227),n(121),n(329),n(330)),d=n(331),f=n(321),m=n(332),h=n(336),v=n(337),w=n(338),x={components:{Countdown:l.default,QuestionTimer:o.default,QuizzEmpty:c.default,QuizzPaused:d.default,TuVeuxAbandonner:m.default,LoadingSpinner:f.default,QuestionImage:h.default,QuestionOrder:v.default,QuestionVoice:w.default},name:"Quizz",props:{quizz_id:{type:[String,Number],required:!0}},data:function(){return{answersList:[],category:null,category_id:null,currentQuestionIndex:0,IMAGE_QUESTION_DURATION:10,isQuizzOver:!1,isGamePaused:!1,isSubmittingAnswer:!1,isUserQuitting:!1,ORDER_QUESTION_DURATION:15,pauseTimer:!0,questions:[],quizz:null,selectedAnswer:null,showCorrectAnswer:!1}},mounted:function(){this.category_id=this.$route.params.category_id,this.initQuizz()},computed:{currentQuestion:function(){var e;return null!==(e=this.questions[this.currentQuestionIndex])&&void 0!==e?e:null},getQuestionTimerTime:function(){var e;return"order"==(null===(e=this.currentQuestion)||void 0===e?void 0:e.type)?this.ORDER_QUESTION_DURATION:this.IMAGE_QUESTION_DURATION},isLastQuestion:function(){return this.currentQuestionIndex==this.questions.length-1},shouldPauseTimer:function(){return this.pauseTimer||this.isLoading("quizz")||this.isQuizzOver}},methods:{clearLoading:function(){var e=this;setTimeout((function(){e.toggleLoading("quizz",!1)}),300)},clearQuizzData:function(){this.answersList=[],this.currentQuestionIndex=0,this.toggleLoading("quizz",!1),this.isQuizzOver=!1,this.isSubmittingAnswer=!1,this.pauseTimer=!1,this.questions=[],this.selectedAnswer=null,this.showCorrectAnswer=!1},dontQuit:function(){this.setState("isUserQuitting",!1),this.setState("pause",!1)},fetchQuizz:function(){return Object(r.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:console.log("fetchQuizz");case 1:case"end":return e.stop()}}),e)})))()},endQuizz:function(){console.log("endQuizz"),this.isQuizzOver=!0},initQuizz:function(){var e=this;this.setLoading(),this.quizz=this.$store.state.quizzes.list.find((function(t){var n;return t.id==e.quizz_id&&t.category_id==(null===(n=e.$route.params)||void 0===n?void 0:n.category_id)})),this.questions=this.quizz.questions,this.shuffleArray(this.questions),this.currentQuestionIndex=0,this.clearLoading()},launchStartCountDown:function(){this.$refs.StartCountdown.startTimer()},loadNextQuestion:function(){if(console.log("loadNext"),this.isSubmittingAnswer=!1,this.selectedAnswer=null,this.setLoading(),this.isLastQuestion)return this.endQuizz(),void this.clearLoading();this.showCorrectAnswer=!1,this.currentQuestionIndex++,this.clearLoading(),this.pauseTimer=!1,this.restartTimer()},onAnswered:function(e){this.selectedAnswer=e},onGamePaused:function(){this.setState("pause",!0)},onTimeExpired:function(){this.saveAnswer()},restartQuizz:function(){console.log("restart"),this.clearQuizzData(),this.initQuizz()},restartTimer:function(){this.pauseTimer=!1,this.$refs.QuestionTimer.startTimer()},resumeGame:function(){var e=this;return Object(r.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:e.setState("pause",!1);case 1:case"end":return t.stop()}}),t)})))()},saveAnswer:function(){var e,t;this.showCorrectAnswer=!0,this.isSubmittingAnswer=!0,this.answersList.push(this.selectedAnswer);var n="order"==(null===(e=this.currentQuestion)||void 0===e?void 0:e.type)?null!==(t=this.selectedAnswer)&&void 0!==t&&t.isCorrect?500:1500:1e3;setTimeout(this.loadNextQuestion,n)},submitAnswer:function(){(arguments.length>0&&void 0!==arguments[0]?arguments[0]:{}).acceptEmpty;this.selectedAnswer&&(this.isSubmittingAnswer||(console.log("submitAnswer"),this.pauseTimer=!0,this.saveAnswer()))},setLoading:function(){this.toggleLoading("quizz",!0)},userWantsToQuit:function(){this.setState("isUserQuitting",!0)}}},y=x,_=n(67),component=Object(_.a)(y,(function(){var e,t,n,r,o,l,c=this,d=c._self._c;return d("div",{staticClass:"text-center bg-gray-700 h-full flex flex-col py-3 justify-between text-white"},[0==c.questions.length?d("quizz-empty"):d("div",{staticClass:"flex flex-col h-full justify-between"},[d("div",{staticClass:"p-2"},[d("h2",{staticClass:"text-xl flex justify-center gap-3"},[c._v("\n        Question\n        "),d("span",[c._v("\n          "+c._s(c.currentQuestionIndex+1)+" / "+c._s(null!==(e=null===(t=c.questions)||void 0===t?void 0:t.length)&&void 0!==e?e:"--")+"\n        ")])]),c._v(" "),d("question-timer",{ref:"QuestionTimer",attrs:{pause:c.shouldPauseTimer,countDownTime:c.getQuestionTimerTime},on:{"pause-game":c.onGamePaused,"time-expired":c.onTimeExpired}})],1),c._v(" "),c.isLoading("quizz")?d("loading-spinner"):["image"==(null===(n=c.currentQuestion)||void 0===n?void 0:n.type)?d("question-image",{attrs:{question:c.currentQuestion,showCorrectAnswer:c.showCorrectAnswer},on:{answer:c.onAnswered,"submit-answer":c.submitAnswer}}):c._e(),c._v(" "),"voice"==(null===(r=c.currentQuestion)||void 0===r?void 0:r.type)?d("question-voice",{attrs:{question:c.currentQuestion,showCorrectAnswer:c.showCorrectAnswer},on:{answer:c.onAnswered,"submit-answer":c.submitAnswer}}):c._e(),c._v(" "),"order"==(null===(o=c.currentQuestion)||void 0===o?void 0:o.type)?d("question-order",{attrs:{question:c.currentQuestion,showCorrectAnswer:c.showCorrectAnswer},on:{answer:c.onAnswered,"submit-answer":c.submitAnswer}}):c._e()],c._v(" "),d("div",[d("button",{staticClass:"rounded px-3 py-2 mb-10",class:[c.selectedAnswer?"bg-blue-600":"",c.isLoading("quizz")?"invisible":"visible"],on:{click:function(e){return e.preventDefault(),c.submitAnswer.apply(null,arguments)}}},[c._v("\n        "+c._s(c.isSubmittingAnswer?"Question suivante...":"Continuer")+"\n      ")])])],2),c._v(" "),c.questions.length>0?d("countdown",{ref:"StartCountdown",on:{"start-quizz":c.restartTimer}}):c._e(),c._v(" "),c.isQuizzOver?d("quizz-ended",{attrs:{questionCount:c.questions.length,correctAnswerCount:null===(l=c.answersList)||void 0===l?void 0:l.filter((function(e){return null==e?void 0:e.isCorrect})).length},on:{restart:c.restartQuizz}}):c._e(),c._v(" "),c.state("pause")?d("quizz-paused",{on:{resume:c.resumeGame,quit:c.userWantsToQuit}}):c._e(),c._v(" "),c.state("isUserQuitting")?d("tu-veux-abandonner",{on:{close:c.dontQuit}}):c._e()],1)}),[],!1,null,null,null);t.default=component.exports;installComponents(component,{QuizzEmpty:n(330).default,QuestionTimer:n(328).default,LoadingSpinner:n(321).default,QuizzEnded:n(329).default,QuizzPaused:n(331).default,TuVeuxAbandonner:n(332).default})},326:function(e,t,n){"use strict";n(320)},327:function(e,t,n){var r=n(119)((function(i){return i[1]}));r.push([e.i,".glitch[data-v-8d0265d8]{animation:glitch-8d0265d8 .5s infinite;font-weight:700;position:relative;text-shadow:.05em 0 0 rgba(255,0,0,.75),-.025em -.05em 0 rgba(0,255,0,.75),.025em .05em 0 rgba(0,0,255,.75);text-transform:uppercase}.glitch span[data-v-8d0265d8]{left:0;position:absolute;top:0}.glitch span[data-v-8d0265d8]:first-child{animation:glitch-8d0265d8 .65s infinite;-webkit-clip-path:polygon(0 0,100% 0,100% 45%,0 45%);clip-path:polygon(0 0,100% 0,100% 45%,0 45%);opacity:.8;transform:translate(-.025em,-.0125em)}.glitch span[data-v-8d0265d8]:last-child{animation:glitch-8d0265d8 375ms infinite;-webkit-clip-path:polygon(0 80%,100% 20%,100% 100%,0 100%);clip-path:polygon(0 80%,100% 20%,100% 100%,0 100%);opacity:.8;transform:translate(.0125em,.025em)}@keyframes glitch-8d0265d8{0%{text-shadow:.05em 0 0 rgba(255,0,0,.75),-.05em -.025em 0 rgba(0,255,0,.75),-.025em .05em 0 rgba(0,0,255,.75)}14%{text-shadow:.05em 0 0 rgba(255,0,0,.75),-.05em -.025em 0 rgba(0,255,0,.75),-.025em .05em 0 rgba(0,0,255,.75)}15%{text-shadow:-.05em -.025em 0 rgba(255,0,0,.75),.025em .025em 0 rgba(0,255,0,.75),-.05em -.05em 0 rgba(0,0,255,.75)}49%{text-shadow:-.05em -.025em 0 rgba(255,0,0,.75),.025em .025em 0 rgba(0,255,0,.75),-.05em -.05em 0 rgba(0,0,255,.75)}50%{text-shadow:.025em .05em 0 rgba(255,0,0,.75),.05em 0 0 rgba(0,255,0,.75),0 -.05em 0 rgba(0,0,255,.75)}99%{text-shadow:.025em .05em 0 rgba(255,0,0,.75),.05em 0 0 rgba(0,255,0,.75),0 -.05em 0 rgba(0,0,255,.75)}to{text-shadow:-.025em 0 0 rgba(255,0,0,.75),-.025em -.025em 0 rgba(0,255,0,.75),-.025em -.05em 0 rgba(0,0,255,.75)}}@media (prefers-reduced-motion:reduce){*[data-v-8d0265d8],[data-v-8d0265d8]:after,[data-v-8d0265d8]:before{animation-delay:-1ms!important;animation-duration:1ms!important;animation-iteration-count:1!important;background-attachment:scroll!important;scroll-behavior:auto!important;transition-delay:0s!important;transition-duration:0s!important}}.flash[data-v-8d0265d8]{animation:blink-8d0265d8 1s step-end -.4s 1}.blink[data-v-8d0265d8]{animation:blink-8d0265d8 1s step-end 3.2s 1}@keyframes blink-8d0265d8{50%{opacity:0}70%{opacity:1}80%{opacity:0}90%{opacity:1}95%{opacity:0}}",""]),r.locals={},e.exports=r},328:function(e,t,n){"use strict";n.r(t);n(319),n(221),n(68);var r={name:"QuestionTimer",props:{pause:{type:Boolean,default:!1},countDownTime:{type:Number,default:null}},data:function(){return{forcePause:!1,START_TIME:10,time:0,timer:null}},mounted:function(){this.startTimer()},computed:{isVisible:function(){return this.time>0},percentage:function(){var e;return 100*this.time/(null!==(e=this.remainingTime)&&void 0!==e?e:1)},percentageColor:function(){return this.percentage<=30?"bg-red-500":this.percentage<=50?"bg-orange-500":this.percentage<=80?"bg-yellow-500":"bg-blue-500"},remainingTime:function(){var e;return null!==(e=this.countDownTime)&&void 0!==e?e:this.START_TIME}},methods:{startTimer:function(){var e=this;console.log("startTimer"),this.time=this.remainingTime,clearInterval(this.timer),this.timer=setInterval((function(){e.state("pause")||e.pause||e.forcePause||(e.time-=.1,e.time<.2&&(clearInterval(e.timer),e.$emit("time-expired",e.time)))}),100)}}},o=n(67),component=Object(o.a)(r,(function(){var e=this,t=e._self._c;return t("div",{staticClass:"flex gap-2 mt-3 items-center"},[t("span",{staticClass:"w-5 h-5 flex justify-center items-center",on:{click:function(t){return e.$emit("pause-game")}}},[t("ion-icon",{attrs:{name:"pause-outline",size:"large"}})],1),e._v(" "),t("div",{staticClass:"relative w-full"},[t("div",{staticClass:"h-3 p-0.5 w-full rounded-xl bg-gray-200"},[t("div",{directives:[{name:"show",rawName:"v-show",value:e.percentage>=3,expression:"percentage >= 3"}],staticClass:"z-10 h-full rounded-xl transition-all duration-300 ease-in-out",class:[e.percentageColor],style:"width:"+e.percentage+"%;"})])]),e._v(" "),t("span",{staticClass:"w-5 h-5 flex justify-center items-center font-semibold text-xl",on:{click:function(t){e.forcePause=!e.forcePause}}},[e._v("\n    "+e._s(e.time.toFixed(0))+"\n  ")])])}),[],!1,null,null,null);t.default=component.exports},329:function(e,t,n){"use strict";n.r(t);n(42),n(319);var r=n(4),o=(n(31),n(156),n(43),n(221),n(35),n(68),{name:"QuizzEnded",props:{correctAnswerCount:{required:!0,type:Number,default:0},questionCount:{required:!0,type:Number,default:0}},data:function(){return{MARK_TOTAL:20,score:0,platforms:[{name:"whatsapp",icon:"logo-whatsapp"},{name:"facebook",icon:"logo-facebook",link:""},{name:"twitter",icon:"logo-twitter",link:""},{name:"linkedin",icon:"logo-linkedin",link:""}]}},mounted:function(){this.calcScore()},computed:{},methods:{calcScore:function(){var e,t=100*this.correctAnswerCount/(null!==(e=this.questionCount)&&void 0!==e?e:0),n=100/this.MARK_TOTAL;this.score=t/n,this.score==this.MARK_TOTAL&&this.throwConfetti()},getShareLink:function(e){if(e){var t="https://code-de-la-route.amane.dev",data={title:"Euss, esseu tu peux ?",text:"J'ai eu "+(this.score.toFixed(0)+"/"+this.MARK_TOTAL)+" au test de Code de la Route en ligne",url:t},n=Object.keys(data).map((function(e){return data[e]})).join("\n"),link=t;return"whatsapp"==e&&(link="whatsapp://send?text=".concat(n)),"facebook"==e&&(link="https://www.facebook.com/sharer/sharer.php?u=".concat(n)),"linkedin"==e&&(link="https://www.linkedin.com/shareArticle?url=".concat(n)),"twitter"==e&&(link="https://twitter.com/intent/tweet?url=".concat(n)),link}},goBackToQuizzList:function(){this.$router.back()},goToMenu:function(){this.$router.push({name:"index"})},restart:function(){this.$emit("restart")},shareScore:function(e){var t=this;return Object(r.a)(regeneratorRuntime.mark((function n(){var r,data,o;return regeneratorRuntime.wrap((function(n){for(;;)switch(n.prev=n.next){case 0:if(console.log("shareScore",e),"https://code-de-la-route.amane.dev","",e){n.next=25;break}if(r=t.score.toFixed(0)+"/"+t.MARK_TOTAL,data={title:"Euss, esseu tu peux ?",text:"J'ai eu "+r+" au test de Code de la Route en ligne",url:"https://code-de-la-route.amane.dev"},o=Object.keys(data).map((function(e){return data[e]})).join("\n"),navigator.canShare){n.next=12;break}console.log("Sharing not supported"),navigator.clipboard.writeText(o),n.next=24;break;case 12:if(!navigator.canShare(data)){n.next=23;break}return n.prev=13,n.next=16,navigator.share(data);case 16:n.next=21;break;case 18:n.prev=18,n.t0=n.catch(13),console.log("could not share",n.t0);case 21:n.next=24;break;case 23:navigator.clipboard.writeText(o);case 24:return n.abrupt("return");case 25:case"end":return n.stop()}}),n,null,[[13,18]])})))()},throwConfetti:function(){var e=this;setTimeout((function(){console.log("confetti !!"),e.$confetti.start(),setTimeout((function(){e.$confetti.stop()}),2e3)}),500)}}}),l=n(67),component=Object(l.a)(o,(function(){var e=this,t=e._self._c;return t("section",{staticClass:"fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90",attrs:{id:"quizz-ended"}},[t("h3",{staticClass:"text-2xl mb-10"},[e._v("Quizz Terminé")]),e._v(" "),t("div",{staticClass:"rounded-full text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse",class:{"bg-green-500":e.score==e.MARK_TOTAL,"bg-blue-500":e.score<e.MARK_TOTAL,"bg-orange-500":e.score<=e.MARK_TOTAL/2,"bg-red-500":e.score<=e.MARK_TOTAL/3},attrs:{id:"score-container"}},[e._v("\n    "+e._s(e.score.toFixed(0))+"/"+e._s(e.MARK_TOTAL)+"\n  ")]),e._v(" "),t("div",{staticClass:"text-center flex flex-col justify-center items-center gap-2 mt-5"},[t("span",{staticClass:"rounded-full p-2 w-16 h-16 flex justify-center items-center bg-white bg-opacity-40",on:{click:function(t){return e.shareScore()}}},[t("ion-icon",{attrs:{name:"arrow-redo-outline",size:"large"}})],1),e._v(" "),t("span",{on:{click:function(t){return e.shareScore()}}},[e._v(" Partager mon score ")]),e._v(" "),t("div",{staticClass:"flex justify-center gap-3 items-center"},e._l(e.platforms,(function(n){return t("a",{key:n.name,attrs:{href:e.getShareLink(n.name),target:"_blank"}},[t("ion-icon",{attrs:{name:n.icon,size:"large"}})],1)})),0)]),e._v(" "),t("div",{staticClass:"flex flex-col gap-2 mt-10"},[t("div",{staticClass:"flex gap-2"},[t("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:e.goBackToQuizzList}},[t("ion-icon",{attrs:{name:"return-up-back-outline"}}),e._v("\n        Retour\n      ")],1),e._v(" "),t("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-green-500",on:{click:e.restart}},[t("ion-icon",{attrs:{name:"refresh-outline"}}),e._v("\n        Réessayer\n      ")],1)]),e._v(" "),t("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500",on:{click:e.goToMenu}},[t("ion-icon",{attrs:{name:"home-outline"}}),e._v("\n      Menu\n    ")],1)])])}),[],!1,null,null,null);t.default=component.exports},330:function(e,t,n){"use strict";n.r(t);var r={name:"QuizzEmpty"},o=n(67),component=Object(o.a)(r,(function(){var e=this,t=e._self._c;return t("div",{staticClass:"mx-2 p-5 flex flex-col gap-3 justify-center items-center text-gray-300 rounded bg-opacity-10 bg-white h-full"},[t("ion-icon",{staticStyle:{"font-size":"64px"},attrs:{name:"search-outline"}}),e._v(" "),t("h2",{staticClass:"text-xl"},[e._v("Wow such empty")]),e._v(" "),t("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-gray-700 shadow",on:{click:function(t){return e.$router.back()}}},[t("ion-icon",{attrs:{name:"return-up-back-outline"}}),e._v("\n     Retour\n   ")],1)],1)}),[],!1,null,null,null);t.default=component.exports},331:function(e,t,n){"use strict";n.r(t);var r={name:"QuizzPaused",methods:{resumeGame:function(){this.$emit("resume")},toujourFuirFuirEtRefuir:function(){this.$emit("quit")}}},o=n(67),component=Object(o.a)(r,(function(){var e=this,t=e._self._c;return t("section",{staticClass:"fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90",attrs:{id:"countdown"}},[t("h3",{staticClass:"text-2xl mb-10 uppercase"},[e._v("Pause")]),e._v(" "),t("div",{staticClass:"rounded-full text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse"},[t("ion-icon",{attrs:{name:"pause-circle-outline"}})],1),e._v(" "),t("div",{staticClass:"flex flex-col items-center gap-8 mt-10"},[t("div",{staticClass:"flex flex-row-reverse gap-2"},[t("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:e.resumeGame}},[t("ion-icon",{attrs:{name:"play-outline"}}),e._v("\n        Continuer\n      ")],1),e._v(" "),t("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500",on:{click:e.toujourFuirFuirEtRefuir}},[t("ion-icon",{attrs:{name:"trash-bin-outline"}}),e._v("\n        Abandonner\n      ")],1)])])])}),[],!1,null,null,null);t.default=component.exports},332:function(e,t,n){"use strict";n.r(t);var r=n(4),o=(n(222),n(13),n(31),{name:"TuVeuxAbandonner",data:function(){return{isVideoVisible:!1,isVidPlaying:!1,videoPlayedCompletely:!1,titleText:"Quitter ?",flash:!1,subtitles:[{text:"Tu veux abandonner ?",startTime:.7,endTime:2.7},{text:"Est-ce que tu veux abandonner ?????",startTime:2.7,endTime:6.6,flash:!0},{text:"iYaaAAARGHHH !!!!",startTime:6.6,endTime:9.1},{text:"Tu es pathétique !!",startTime:9.1,endTime:10.11},{text:"Fuir et fir !!",startTime:10.11,endTime:11.21},{text:"Fir encore !!",startTime:11.21,endTime:12.41},{text:"Toujours fir !!",startTime:12.41,endTime:13.61},{text:"Fir et t'enfir !!",startTime:13.61,endTime:14.81},{text:"Tu n'as pas le droit d'abandonner",startTime:14.81,endTime:20,flash:!0}]}},methods:{close:function(){var e=this;return Object(r.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return e.isVideoVisible=!1,t.next=3,e.sleep(500);case 3:e.resetMedia("tu_veux_abandonner"),e.$emit("close");case 5:case"end":return t.stop()}}),t)})))()},giveMotivation:function(){var e=this;return Object(r.a)(regeneratorRuntime.mark((function t(){var video;return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:(video=e.playMedia("tu_veux_abandonner")).addEventListener("timeupdate",(function(){var t=video.currentTime,n=e.subtitles.find((function(e){return t>=e.startTime&&t<=e.endTime}));e.flash=!(null==n||!n.flash),e.titleText=n?n.text:""}));case 2:case"end":return t.stop()}}),t)})))()},giveUp:function(){var e=this;return Object(r.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:if(t.prev=0,!e.isVideoVisible){t.next=6;break}return e.setState("pause",!1),e.setState("isUserQuitting",!1),e.$router.go(-1),t.abrupt("return");case 6:return e.isVideoVisible=!0,t.next=9,e.sleep(500);case 9:e.isVidPlaying=!0,t.next=16;break;case 12:t.prev=12,t.t0=t.catch(0),console.log("can't let you give up"),e.isVidPlaying=!1;case 16:case"end":return t.stop()}}),t,null,[[0,12]])})))()},onVideoEnded:function(){this.videoPlayedCompletely=!0}},watch:{isVidPlaying:function(e){e?this.giveMotivation():this.pauseMedia("tu_veux_abandonner")}}}),l=(n(326),n(67)),component=Object(l.a)(o,(function(){var e=this,t=e._self._c;return t("section",{staticClass:"fixed z-10 transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90",attrs:{id:"tu-veux-abandonner"}},[t("div",{staticClass:"flex flex-col justify-around h-full px-10"},[t("div",{staticClass:"flex justify-center text-center fixed md:relative top-10 left-0 w-full",class:{fixed:"isVidPlaying"}},[t("h3",{staticClass:"text-4xl md:text-9xl mb-10 glitch text-center",class:{flash:e.flash}},[e._v("\n        "+e._s(e.titleText)+"\n      ")])]),e._v(" "),t("transition",[t("div",{directives:[{name:"show",rawName:"v-show",value:e.isVideoVisible,expression:"isVideoVisible"}],staticClass:"fixed z-10 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex flex-col justify-center items-center"},[t("div",{staticClass:"mx-auto"},[t("video",{attrs:{id:"tu_veux_abandonner",width:"200px",height:"400px"},on:{click:function(t){e.isVidPlaying=!e.isVidPlaying},ended:e.onVideoEnded}},[t("source",{attrs:{src:"/video/tu_veux_abandonner.mp4",type:""}})])])])]),e._v(" "),t("div"),e._v(" "),t("div",{staticClass:"flex justify-center fixed md:relative bottom-10 left-0 w-full"},[t("div",{staticClass:"flex flex-col items-center gap-5 mt-16"},[t("transition",[t("button",{directives:[{name:"show",rawName:"v-show",value:e.videoPlayedCompletely,expression:"videoPlayedCompletely"}],staticClass:"flex w-full items-center uppercase justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:e.close}},[e._v("\n            😅 D'accord chef\n          ")])]),e._v(" "),t("transition",[t("button",{directives:[{name:"show",rawName:"v-show",value:!e.isVidPlaying,expression:"!isVidPlaying"}],staticClass:"flex w-full items-center uppercase justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:e.close}},[e._v("\n            RETOUR\n          ")])]),e._v(" "),t("transition",[t("button",{directives:[{name:"show",rawName:"v-show",value:!e.isVidPlaying,expression:"!isVidPlaying"}],staticClass:"flex w-full items-center justify-center uppercase gap-2 px-3 py-2 rounded bg-red-500",on:{click:e.giveUp}},[e._v("\n            QUITTER\n          ")])])],1)])],1)])}),[],!1,null,"8d0265d8",null);t.default=component.exports},335:function(e,t,n){"use strict";n.r(t);n(68);var r={name:"StartCountdown",data:function(){return{time:2,timer:null}},mounted:function(){this.startTimer()},computed:{isVisible:function(){return this.time>0}},methods:{startTimer:function(){var e=this;clearInterval(this.timer),this.timer=setInterval((function(){e.time--,e.time<=0&&(e.$emit("start-quizz"),clearInterval(e.timer))}),1e3)}}},o=n(67),component=Object(o.a)(r,(function(){var e=this,t=e._self._c;return t("div",[t("transition",[t("section",{directives:[{name:"show",rawName:"v-show",value:e.isVisible,expression:"isVisible"}],staticClass:"fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex justify-center items-center bg-blue-700 bg-opacity-80",attrs:{id:"countdown"}},[t("div",{staticClass:"absolute top-1/3 rounded-full bg-blue-700 text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse"},[e._v("\n        "+e._s(e.time)+"\n      ")])])])],1)}),[],!1,null,null,null);t.default=component.exports},336:function(e,t,n){"use strict";n.r(t);var r={name:"QuestionImage",props:{question:{type:Object,required:!0},showCorrectAnswer:{type:Boolean,default:!1}},data:function(){return{selectedAnswer:null}},methods:{toggleSelectAnswer:function(e){if(!this.showCorrectAnswer){if(this.selectedAnswer==e)return this.$emit("submit-answer"),void console.log("submit answer");this.selectedAnswer=e,console.log("answer"),this.$emit("answer",this.selectedAnswer)}}}},o=n(67),component=Object(o.a)(r,(function(){var e,t,n,r=this,o=r._self._c;return o("section",{staticClass:"flex flex-col justify-around h-full p-3 px-5"},[o("div",{staticClass:"flex flex-col gap-3 h-full mb-3"},[o("h2",{staticClass:"font-medium p-5 mb-1 text-2xl"},[r._v("\n        "+r._s(null===(e=r.question)||void 0===e?void 0:e.question)+"\n      ")]),r._v(" "),o("div",{staticClass:"rounded flex h-full items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800 p-2"},[o("img",{staticClass:"w-full object-contain h-36 md:h-32",attrs:{src:null===(t=r.question)||void 0===t?void 0:t.image,alt:"Image de la question"}})])]),r._v(" "),o("div",{staticClass:"grid grid-cols-1 mt-5 gap-3"},r._l(null===(n=r.question)||void 0===n?void 0:n.answers,(function(e,i){return o("button",{key:i,staticClass:"relative rounded text-gray-800 bg-gray-200 shadow p-3",class:{"bg-orange-500 text-white":!r.showCorrectAnswer&&r.selectedAnswer==e,"bg-green-500 text-white":r.showCorrectAnswer&&(null==e?void 0:e.isCorrect),"bg-red-500 text-white":r.showCorrectAnswer&&e==r.selectedAnswer&&!(null!=e&&e.isCorrect),"bg-gray-600":r.showCorrectAnswer&&e!=r.selectedAnswer&&!(null!=e&&e.isCorrect)},on:{click:function(t){return r.toggleSelectAnswer(e)}}},[o("span",[r._v(r._s(e.content))])])})),0)])}),[],!1,null,null,null);t.default=component.exports},337:function(e,t,n){"use strict";n.r(t);n(156),n(32),n(223),n(81),n(226),n(96);var r={name:"QuestionRange",props:{question:{type:Object,required:!0},showCorrectAnswer:{type:Boolean,default:!1}},data:function(){return{answers:[],gridColsCount:null,orderElementCount:null,selectedOrder:[],SEPARATOR:", "}},created:function(){var e=this;this.answers=this.question.correctOrder.split(this.SEPARATOR),this.orderElementCount=this.answers.length,this.shuffleArray(this.answers),this.$nextTick((function(){return e.gridColsCount="grid-cols-"+e.orderElementCount}))},computed:{},methods:{toggleOrderElement:function(element){if(element){if(this.selectedOrder.includes(element)){var e=this.selectedOrder.indexOf(element);this.selectedOrder.splice(e,1);var t=this.answers.indexOf(null);this.answers.splice(t,1,element)}else{var n=this.answers.indexOf(element);this.answers.splice(n,1,null),this.selectedOrder.push(element)}var r,content=this.selectedOrder.join(this.SEPARATOR),o={content:content};if(this.selectedOrder.length==this.orderElementCount)o.isCorrect=content===(null===(r=this.question)||void 0===r?void 0:r.correctOrder),this.$emit("answer",o);else this.$emit("answer",o)}}}},o=n(67),component=Object(o.a)(r,(function(){var e,t,n,r,o=this,l=o._self._c;return l("section",{staticClass:"flex flex-col justify-around h-full p-4"},[l("div",{staticClass:"flex flex-col gap-3 h-full mb-5"},[l("h2",{staticClass:"font-medium p-5 mb-3 text-2xl"},[o._v("\n      "+o._s(null===(e=o.question)||void 0===e?void 0:e.question)+"\n    ")]),o._v(" "),l("div",{staticClass:"rounded flex h-full items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800"},[l("img",{staticClass:"object-contain h-auto w-full rounded",attrs:{src:null===(t=o.question)||void 0===t?void 0:t.image,alt:"Image de la question"}})]),o._v(" "),l("div",{staticClass:"text-gray-800 rounded flex gap-2",class:o.gridColsCount},o._l(o.orderElementCount,(function(i){var e,t;return l("span",{key:i,staticClass:"grow rounded text-gray-800 bg-gray-200 shadow p-2",class:{"bg-green-500 text-white":o.showCorrectAnswer&&o.selectedOrder.join(o.SEPARATOR)==(null===(e=o.question)||void 0===e?void 0:e.correctOrder),"bg-red-500 text-white":o.showCorrectAnswer&&o.selectedOrder.join(o.SEPARATOR)!=(null===(t=o.question)||void 0===t?void 0:t.correctOrder),"bg-gray-200 text-gray-800":o.selectedOrder[i-1],"bg-gray-600 p-5":!o.selectedOrder[i-1]},on:{click:function(e){return o.toggleOrderElement(o.selectedOrder[i-1])}}},[o._v("\n        "+o._s(o.selectedOrder[i-1])+"\n      ")])})),0),o._v(" "),o.showCorrectAnswer&&o.selectedOrder.join(o.SEPARATOR)!=(null===(n=o.question)||void 0===n?void 0:n.correctOrder)?l("div",{staticClass:"bg-gray-200 bg-opacity-10 text-gray-800 rounded flex gap-2",class:o.gridColsCount},o._l(null===(r=o.question)||void 0===r?void 0:r.correctOrder.split(o.SEPARATOR),(function(e,i){return l("span",{key:i,staticClass:"grow rounded shadow p-2 bg-green-500 text-white"},[o._v("\n        "+o._s(e)+"\n      ")])})),0):o._e()]),o._v(" "),l("transition",[l("div",{directives:[{name:"show",rawName:"v-show",value:!o.showCorrectAnswer,expression:"!showCorrectAnswer"}],staticClass:"grid grid-cols-2 py-2 mt-5 gap-3"},o._l(o.orderElementCount,(function(i){var e;return l("button",{key:i,staticClass:"relative rounded text-gray-800 shadow p-2",class:[o.answers[i-1]?"bg-gray-200":"bg-gray-600 p-5"],on:{click:function(e){return o.toggleOrderElement(o.answers[i-1])}}},[l("span",[o._v(o._s(null!==(e=o.answers[i-1])&&void 0!==e?e:" "))])])})),0)])],1)}),[],!1,null,null,null);t.default=component.exports},338:function(e,t,n){"use strict";n.r(t);n(34),n(13);var r={name:"QuestionVoice",props:{question:{type:Object,required:!0},showCorrectAnswer:{type:Boolean,default:!1}},data:function(){return{answer:null,gridColsCount:null,isListening:!1,orderElementCount:null,voiceRecorder:null}},created:function(){},mounted:function(){var e=this;this.voiceRecorder=new webkitSpeechRecognition,this.voiceRecorder?(this.voiceRecorder.lang="fr-FR",this.voiceRecorder.onstart=function(){console.log("record started"),e.isListening=!0},this.voiceRecorder.onresult=function(t){console.log("record ended",t.results);try{var n,r=t.results[0][0].transcript;t.results[0][0].confidence;if(e.answer=r,e.answer)console.log("correct answers",null===(n=e.question)||void 0===n?void 0:n.correctAnswers,"answer",e.answer,"isCorrect",e.isAnswerCorrect),e.$emit("answer",{content:e.answer,isCorrect:e.isAnswerCorrect})}catch(e){console.log("error",e)}e.isListening=!1}):console.log("no recorder")},computed:{isAnswerCorrect:function(){var e,t=this;return!!this.answer&&(null===(e=this.question)||void 0===e||null===(e=e.correctAnswers)||void 0===e?void 0:e.filter((function(e){return e.toLowerCase()===t.answer.toLowerCase()})))}},methods:{startListening:function(){this.isListening=!0,this.voiceRecorder.start()}}},o=n(67),component=Object(o.a)(r,(function(){var e,t,n,r=this,o=r._self._c;return o("section",{staticClass:"flex flex-col justify-around h-full p-4"},[o("div",{staticClass:"flex flex-col gap-3 h-full mb-5"},[o("h2",{staticClass:"font-medium p-5 mb-3 text-2xl"},[r._v("\n      "+r._s(null===(e=r.question)||void 0===e?void 0:e.question)+"\n    ")]),r._v(" "),o("div",{staticClass:"rounded flex h-full items-center justify-center bg-gray-200 bg-opacity-10 text-gray-800"},[o("img",{staticClass:"object-contain h-auto w-full rounded",attrs:{src:null===(t=r.question)||void 0===t?void 0:t.image,alt:"Image de la question"}})]),r._v(" "),r.answer?o("div",{staticClass:"text-gray-800 rounded flex gap-2",class:r.gridColsCount},[o("span",{staticClass:"grow rounded text-gray-800 bg-gray-200 shadow p-2",class:{"bg-green-500 text-white":r.showCorrectAnswer&&r.isAnswerCorrect,"bg-red-500 text-white":r.showCorrectAnswer&&!r.isAnswerCorrect}},[r._v("\n        "+r._s(null!==(n=r.answer)&&void 0!==n?n:"Parlez pour répondre")+"\n      ")])]):r._e()]),r._v(" "),o("transition",[o("div",{staticClass:"relative flex justify-center items-center"},[r.isListening?o("div",{staticClass:"transition-all duration-300 ease-out absolute rounded-full w-16 h-16 animate-ping bg-gray-900"}):r._e(),r._v(" "),o("button",{staticClass:"transition-all duration-300 ease-out relative flex justify-center items-center rounded-full shadow bg-white bg-opacity-15 w-24 h-24",class:[r.isListening?" text-blue-500":"text-white"],on:{click:function(e){return r.startListening()}}},[o("ion-icon",{class:[],attrs:{name:"mic-outline",size:"large"}})],1)])])],1)}),[],!1,null,null,null);t.default=component.exports}}]);