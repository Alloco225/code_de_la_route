(window.webpackJsonp=window.webpackJsonp||[]).push([[14],{319:function(t,e,n){"use strict";var o=n(3),r=n(6),c=n(69),l=n(225),f=n(223),d=n(5),m=RangeError,h=String,v=Math.floor,x=r(f),_=r("".slice),T=r(1..toFixed),w=function(t,e,n){return 0===e?n:e%2==1?w(t,e-1,n*t):w(t*t,e/2,n)},y=function(data,t,e){for(var n=-1,o=e;++n<6;)o+=t*data[n],data[n]=o%1e7,o=v(o/1e7)},A=function(data,t){for(var e=6,n=0;--e>=0;)n+=data[e],data[e]=v(n/t),n=n%t*1e7},k=function(data){for(var t=6,s="";--t>=0;)if(""!==s||0===t||0!==data[t]){var e=h(data[t]);s=""===s?e:s+x("0",7-e.length)+e}return s};o({target:"Number",proto:!0,forced:d((function(){return"0.000"!==T(8e-5,3)||"1"!==T(.9,0)||"1.25"!==T(1.255,2)||"1000000000000000128"!==T(0xde0b6b3a7640080,0)}))||!d((function(){T({})}))},{toFixed:function(t){var e,n,o,r,f=l(this),d=c(t),data=[0,0,0,0,0,0],v="",T="0";if(d<0||d>20)throw new m("Incorrect fraction digits");if(f!=f)return"NaN";if(f<=-1e21||f>=1e21)return h(f);if(f<0&&(v="-",f=-f),f>1e-21)if(n=(e=function(t){for(var e=0,n=t;n>=4096;)e+=12,n/=4096;for(;n>=2;)e+=1,n/=2;return e}(f*w(2,69,1))-69)<0?f*w(2,-e,1):f/w(2,e,1),n*=4503599627370496,(e=52-e)>0){for(y(data,0,n),o=d;o>=7;)y(data,1e7,0),o-=7;for(y(data,w(10,o,1),0),o=e-1;o>=23;)A(data,1<<23),o-=23;A(data,1<<o),y(data,1,1),A(data,2),T=k(data)}else y(data,0,n),y(data,1<<-e,0),T=k(data)+x("0",d);return T=d>0?v+((r=T.length)<=d?"0."+x("0",d-r)+T:_(T,0,r-d)+"."+_(T,r-d)):v+T}})},329:function(t,e,n){"use strict";n.r(e);n(42),n(319),n(224),n(68);var o={name:"QuizzEnded",props:{correctAnswerCount:{required:!0,type:Number,default:0},questionCount:{required:!0,type:Number,default:0}},data:function(){return{MARK_TOTAL:20,score:0,platforms:[{name:"Whatsapp",icon:"logo-whatsapp"},{name:"Facebook",icon:"logo-facebook",link:""},{name:"Twitter",icon:"logo-twitter",link:""},{name:"Linkedin",icon:"logo-linkedin",link:""}]}},mounted:function(){this.calcScore()},computed:{},methods:{calcScore:function(){var t,e=100*this.correctAnswerCount/(null!==(t=this.questionCount)&&void 0!==t?t:0),n=100/this.MARK_TOTAL;this.score=e/n,this.score==this.MARK_TOTAL&&this.throwConfetti()},goBackToQuizzList:function(){this.$router.back()},goToMenu:function(){this.$router.push({name:"index"})},restart:function(){this.$emit("restart")},shareScore:function(t){},throwConfetti:function(){var t=this;setTimeout((function(){console.log("confetti !!"),t.$confetti.start(),setTimeout((function(){t.$confetti.stop()}),2e3)}),500)}}},r=n(67),component=Object(r.a)(o,(function(){var t=this,e=t._self._c;return e("section",{staticClass:"fixed transition-all duration-300 ease-out top-0 left-0 w-full h-full flex flex-col gap-3 justify-center items-center bg-gray-700 bg-opacity-90",attrs:{id:"quizz-ended"}},[e("h3",{staticClass:"text-2xl mb-10"},[t._v("Quizz Terminé")]),t._v(" "),e("div",{staticClass:"rounded-full text-6xl font-bold text-white flex justify-center items-center w-32 h-32 animated-pulse",class:{"bg-green-500":t.score==t.MARK_TOTAL,"bg-blue-500":t.score<t.MARK_TOTAL,"bg-orange-500":t.score<=t.MARK_TOTAL/2,"bg-red-500":t.score<=t.MARK_TOTAL/3}},[t._v(t._s(t.score.toFixed(0))+"/"+t._s(t.MARK_TOTAL))]),t._v(" "),e("div",{staticClass:"text-center flex flex-col justify-center items-center gap-2 mt-5"},[e("span",{staticClass:"rounded-full p-2 w-16 h-16 flex justify-center items-center bg-white bg-opacity-40"},[e("ion-icon",{attrs:{name:"arrow-redo-outline",size:"large"}})],1),t._v(" "),e("span",[t._v("\n      Partager mon score\n    ")]),t._v(" "),e("div",{staticClass:"flex justify-center gap-3 items-center"},t._l(t.platforms,(function(t){return e("span",{key:t.name},[e("ion-icon",{attrs:{name:t.icon,size:"large"}})],1)})),0)]),t._v(" "),e("div",{staticClass:"flex flex-col gap-2 mt-10"},[e("div",{staticClass:"flex gap-2"},[e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-blue-500",on:{click:t.goBackToQuizzList}},[e("ion-icon",{attrs:{name:"return-up-back-outline"}}),t._v("\n        Retour\n      ")],1),t._v(" "),e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-green-500",on:{click:t.restart}},[e("ion-icon",{attrs:{name:"refresh-outline"}}),t._v("\n        Réessayer\n      ")],1)]),t._v(" "),e("button",{staticClass:"flex items-center justify-center gap-2 px-3 py-2 rounded bg-red-500",on:{click:t.goToMenu}},[e("ion-icon",{attrs:{name:"home-outline"}}),t._v("\n      Menu\n    ")],1)])])}),[],!1,null,null,null);e.default=component.exports}}]);