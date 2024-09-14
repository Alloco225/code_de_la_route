(window.webpackJsonp=window.webpackJsonp||[]).push([[25],{348:function(e,t,r){var content=r(358);content.__esModule&&(content=content.default),"string"==typeof content&&(content=[[e.i,content,""]]),content.locals&&(e.exports=content.locals);(0,r(121).default)("3120c8fc",content,!0,{sourceMap:!1})},357:function(e,t,r){"use strict";r(348)},358:function(e,t,r){var n=r(120)((function(i){return i[1]}));n.push([e.i,".profile-container[data-v-e84c5f42]{align-items:center;display:flex;flex-direction:column;justify-content:center;padding:20px}.profile-info[data-v-e84c5f42]{margin-bottom:20px}.profile-info p[data-v-e84c5f42]{margin-bottom:10px}.profile-info strong[data-v-e84c5f42]{font-weight:700}button[data-v-e84c5f42]{margin-top:20px}",""]),n.locals={},e.exports=n},366:function(e,t,r){"use strict";r.r(t);r(82),r(39),r(27),r(96),r(71);var n=r(4),o=(r(32),r(332),r(34),r(11),r(22),r(354)),c=r(355),l={name:"UserProfile",data:function(){return{achievements:[],userAchievements:[],userProfile:{name:"Guest User",email:"guest@example.com",totalScore:0,quizzesPlayed:0,averageScore:0,fullMarksQuizzes:0}}},computed:{isLoggedIn:function(){return"Guest User"!==this.userProfile.name},totalQuizzes:function(){return 17},totalPanneaux:function(){return 10},maxScore:function(){return 20}},created:function(){var e=this;return Object(n.a)(regeneratorRuntime.mark((function t(){var r;return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:e.fetchAchievements(),r=Object(o.b)(),Object(o.c)(r,function(){var t=Object(n.a)(regeneratorRuntime.mark((function t(r){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:if(!r){t.next=13;break}return e.userProfile.name=r.displayName,e.userProfile.email=r.email,t.next=5,e.calculateAverageScore();case 5:return e.userProfile.totalScore=t.sent,e.userProfile.quizzesPlayed=5,t.next=9,e.countFullMarksQuizzes();case 9:e.userProfile.fullMarksQuizzes=t.sent,e.fetchUserAchievements(),t.next=14;break;case 13:console.log("No user logged in");case 14:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}());case 3:case"end":return t.stop()}}),t)})))()},mounted:function(){return Object(n.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:console.log("mounted categories");case 1:case"end":return e.stop()}}),e)})))()},methods:{calculateAverageScore:function(){var e=this;return Object(n.a)(regeneratorRuntime.mark((function t(){var r,n,o,c,l;return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,e.getAllScores();case 2:if(r=t.sent,0!==Object.keys(r).length){t.next=5;break}return t.abrupt("return",0);case 5:for(o in n=0,r)n+=r[o];return c=Object.keys(r).length,l=n/c,t.abrupt("return",l.toFixed(1));case 10:case"end":return t.stop()}}),t)})))()},countFullMarksQuizzes:function(){var e=this;return Object(n.a)(regeneratorRuntime.mark((function t(){var r,n,o;return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,e.getAllScores();case 2:for(o in r=t.sent,20,n=0,r)20===r[o]&&n++;return t.abrupt("return",n);case 7:case"end":return t.stop()}}),t)})))()},getAllScores:function(){var e=this;return Object(n.a)(regeneratorRuntime.mark((function t(){var r,n,o,l;return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return r={},n=Object(c.d)(),o=Object(c.b)(n,"users",e.userProfile.email),l=Object(c.a)(o,"quizzes"),Object(c.c)(l).then((function(e){e.docs.forEach((function(e){var data=e.data();r[data.quizId]=data.score}))})).catch((function(e){console.error("Error getting quiz scores: ",e)})),t.abrupt("return",r);case 6:case"end":return t.stop()}}),t)})))()},fetchAchievements:function(){var e=this,t=Object(c.d)(),r=Object(c.a)(t,"achievements");Object(c.c)(r).then((function(t){t.docs.forEach((function(t){e.achievements.push(t.data())}))})).catch((function(e){console.error("Error getting documents: ",e)}))},fetchUserAchievements:function(){var e=this,t=Object(c.d)(),r=Object(c.a)(t,"users",this.userProfile.email,"achievements");Object(c.c)(r).then((function(t){t.docs.forEach((function(t){e.userAchievements.push(t.data())}))})).catch((function(e){console.error("Error getting documents: ",e)}))},login:function(){var e=new o.a;Object(o.d)(Object(o.b)(),e).then((function(e){o.a.credentialFromResult(e).accessToken;var t=e.user;console.log("Logged in with Google:",t)})).catch((function(e){var t=e.code,r=e.message,n=e.email,c=o.a.credentialFromError(e);console.error("Error logging in with Google:",t,r,n,c)}))}}},f=l,d=(r(357),r(68)),component=Object(d.a)(f,(function(){var e,t=this,r=t._self._c;return r("div",{staticClass:"bg-white flex flex-col h-full px-5 py-5"},[r("header",{staticClass:"text-center flex justify-between items-end"},[r("button",{staticClass:"w-8 h-8 flex justify-center items-center bg-black bg-opacity-70 hover:bg-opacity-100 text-white rounded-full",on:{click:function(e){return t.$router.go(-1)}}},[r("ion-icon",{attrs:{name:"chevron-back-outline"}})],1),t._v(" "),r("h1",{staticClass:"text-2xl font-medium"},[t._v("Mon Profil")]),t._v(" "),r("button",{staticClass:"w-8 h-8 flex justify-center items-center bg-black bg-opacity-70 hover:bg-opacity-100 text-white rounded-full"},[r("ion-icon",{attrs:{name:"settings-outline"}})],1)]),t._v(" "),r("div",{staticClass:"pt-10"},[r("section",{staticClass:"flex flex-col items-center text-center"},[r("img",{staticClass:"w-24 h-24 object-contain rounded-full border-2 border-black p-0.5",attrs:{src:null!==(e=t.userProfile.photoURL)&&void 0!==e?e:"/favicon.png",alt:"User Avatar"}}),t._v(" "),r("h2",{staticClass:"text-xl font-bold mt-3"},[t._v(t._s(t.userProfile.name))]),t._v(" "),r("p",[t._v(t._s(t.userProfile.email))])]),t._v(" "),r("section",{staticClass:"grid grid-cols-3 items-center text-center mt-5 rounded border mx-5"},[r("div",{staticClass:"flex flex-col items-center text-center gap-2 p-3"},[r("strong",[t._v("Panneaux")]),t._v(" "),r("p",[t._v(t._s(t.userProfile.signs+"/"+t.totalPanneaux))])]),t._v(" "),r("div",{staticClass:"flex flex-col items-center text-center gap-2 p-3"},[r("strong",[t._v("Quizz")]),t._v(" "),r("p",[t._v(t._s(t.userProfile.quizzesPlayed+"/"+t.totalQuizzes))])]),t._v(" "),r("div",{staticClass:"flex flex-col items-center text-center gap-2 p-3"},[r("strong",[t._v("Score")]),t._v(" "),r("p",[t._v(t._s(t.userProfile.totalScore+"/"+t.maxScore))])])]),t._v(" "),r("section",{staticClass:"mt-10 text-center"},[r("h2",{staticClass:"text-xl font-bold mb-5"},[t._v("Médailles")]),t._v(" "),t.isLoggedIn?r("ul",{staticClass:"grid grid-cols-3 gap-5"},t._l(t.achievements,(function(e){return r("li",{key:e.id,staticClass:"relative flex flex-col items-center text-center gap-2 p-3 rounded border"},[t.userAchievements.includes(e.id)?t._e():r("div",{staticClass:"absolute rounded border z-10 top-0 left-0 w-full h-full bg-black bg-opacity-50 flex justify-center items-center"},[r("ion-icon",{staticClass:"text-white",attrs:{name:"lock-closed",size:"large"}})],1),t._v(" "),r("div",{staticClass:"relative w-24 h-24 flex justify-center items-center"},[r("img",{key:e.title,staticClass:"w-24 h-24 object-contain bg-gray-200 rounded-full",attrs:{src:"/images/badges/badge_"+e.badge+".png"}}),t._v(" "),r("ion-icon",{staticClass:"absolute text-white",attrs:{name:e.icon.split(".")[1].replace("_","-").toLowerCase()+"-outline",size:"large"}})],1),t._v(" "),r("strong",[t._v(t._s(e.title))])])})),0):r("article",{staticClass:"text-center rounded border p-5"},[r("h3",{staticClass:"text-xl font-bold"},[t._v("\n          Connectez-vous pour débloquer vos médailles\n        ")]),t._v(" "),r("button",{staticClass:"bg-black text-white px-5 py-2 rounded-full flex items-center gap-2 mx-auto",on:{click:t.login}},[r("ion-icon",{attrs:{name:"logo-google"}}),t._v("\n          Connectez-vous avec Google\n        ")],1)])])])])}),[],!1,null,"e84c5f42",null);t.default=component.exports}}]);