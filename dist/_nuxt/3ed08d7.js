(window.webpackJsonp=window.webpackJsonp||[]).push([[4,3],{335:function(t,e,n){"use strict";n.r(e);var o=n(4),r=(n(32),{name:"FacebookLoginButton",data:function(){return{}},methods:{facebookLogin:function(){var t=this;return Object(o.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(!t.isLoading("facebookLogin")){e.next=2;break}return e.abrupt("return");case 2:return t.toggleLoading("facebookLogin",!0),console.log("facebookLogin"),e.next=6,t.$store.dispatch("auth/loginViaFacebook");case 6:t.toggleLoading("facebookLogin",!1);case 7:case"end":return e.stop()}}),e)})))()}}}),c=n(68),component=Object(c.a)(r,(function(){var t=this,e=t._self._c;return e("div",[e("div",{attrs:{id:"profile"}}),t._v(" "),e("button",{staticClass:"flex justify-center gap-2 px-3 py-2 rounded-lg shadow items-center bg-blue-700 hover:bg-blue-800 text-white",on:{click:function(e){return e.preventDefault(),t.facebookLogin.apply(null,arguments)}}},[e("ion-icon",{attrs:{name:"logo-facebook"}}),t._v("\n      Connexion\n    ")],1)])}),[],!1,null,null,null);e.default=component.exports},350:function(t,e,n){"use strict";n.r(e);var o=n(4),r=(n(32),{components:{FacebookLoginButton:n(335).default},name:"Landing",data:function(){return{}},created:function(){var t=this;return Object(o.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return t.toggleLoading("initApp",!0),e.next=3,t.initApp();case 3:t.toggleLoading("initApp",!1);case 4:case"end":return e.stop()}}),e)})))()},mounted:function(){console.log("mounted")},computed:{categories:function(){return this.$store.state.categories.list}},methods:{initApp:function(){return Object(o.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:console.log("initApp"),window.fbAsyncInit=function(){FB.init({appId:void 0,autoLogAppEvents:void 0,xfbml:void 0,version:void 0})};case 2:case"end":return t.stop()}}),t)})))()},gotoCategory:function(t){this.$router.push("/categories/"+t.id)}}}),c=n(68),component=Object(c.a)(r,(function(){var t=this,e=t._self._c;return e("div",{staticClass:"transition duration-200 ease-out h-full w-full flex flex-col px-5 mx-auto md:w-11/12 xl:w-10/12 pt-5",class:[t.isLoading("initApp")?"justify-center":"justify-between"]},[t._m(0),t._v(" "),e("transition",[e("div",{staticClass:"flex flex-col gap-10 px-10 items-center justify-center"},[e("router-link",{staticClass:"bg-white p-5 rounded-lg shadow-md flex flex-col w-full gap-3 justify-center items-center",attrs:{to:"/apprendre-les-panneaux-de-signalisation"}},[e("ion-icon",{attrs:{name:"trail-sign-outline",size:"large"}}),t._v(" "),e("h3",{staticClass:"text-center uppercase text-2xl"},[t._v("Panneaux")])],1),t._v(" "),e("router-link",{staticClass:"bg-white p-5 rounded-lg shadow-md flex flex-col w-full gap-3 justify-center items-center",attrs:{to:"/quizz-sur-les-panneaux-de-signalisation"}},[e("ion-icon",{attrs:{name:"help-outline",size:"large"}}),t._v(" "),e("h3",{staticClass:"text-center uppercase text-2xl"},[t._v("Quizz")])],1),t._v(" "),e("router-link",{staticClass:"bg-white p-5 rounded-lg shadow-md flex flex-col w-full gap-3 justify-center items-center",attrs:{to:"/mon-profil"}},[e("ion-icon",{attrs:{name:"person-outline",size:"large"}}),t._v(" "),e("h3",{staticClass:"text-center uppercase text-2xl"},[t._v("Profil")])],1)],1)]),t._v(" "),e("div",{staticClass:"flex justify-center items-center"}),t._v(" "),t._m(1)],1)}),[function(){var t=this,e=t._self._c;return e("div",{staticClass:"mt-5 md:my-10 mx-5 text-white text-center px-2 transition duration-200 ease-out"},[e("img",{staticClass:"h-auto w-full",attrs:{src:"/logo.png",alt:""}}),t._v(" "),e("span",[t._v("v0.8.3")])])},function(){var t=this._self._c;return t("footer",{staticClass:"text-center text-gray-200 mb-10 md:mb-5 transition duration-200 ease-out"},[t("a",{staticClass:"underline text-blue-500",attrs:{href:"https://amane.dev"}},[this._v("あ")])])}],!1,null,null,null);e.default=component.exports}}]);