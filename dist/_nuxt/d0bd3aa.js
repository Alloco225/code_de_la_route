(window.webpackJsonp=window.webpackJsonp||[]).push([[3,2],{317:function(t,e,n){"use strict";n.r(e);var o=n(4),r=(n(23),{name:"FacebookLoginButton",data:function(){return{isLoading:!1}},methods:{facebookLogin:function(){var t=this;return Object(o.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(!t.isLoading){e.next=2;break}return e.abrupt("return");case 2:return t.isLoading=!0,console.log("facebookLogin"),e.next=6,t.$store.dispatch("auth/loginViaFacebook");case 6:t.isLoading=!1;case 7:case"end":return e.stop()}}),e)})))()}}}),c=n(67),component=Object(c.a)(r,(function(){var t=this,e=t._self._c;return e("div",[e("div",{attrs:{id:"profile"}}),t._v(" "),e("button",{staticClass:"flex justify-center gap-2 px-3 py-2 rounded-lg shadow items-center bg-blue-700 hover:bg-blue-800 text-white",on:{click:function(e){return e.preventDefault(),t.facebookLogin.apply(null,arguments)}}},[e("ion-icon",{attrs:{name:"logo-facebook"}}),t._v("\n      Connexion\n    ")],1)])}),[],!1,null,null,null);e.default=component.exports},322:function(t,e,n){"use strict";n.r(e);n(37);var o=n(4),r=(n(23),{components:{FacebookLoginButton:n(317).default},name:"Landing",data:function(){return{}},created:function(){this.fetchCategories(),this.initApp()},mounted:function(){console.log("mounted")},computed:{categories:function(){return this.$store.state.categories.list}},methods:{initApp:function(){return Object(o.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:console.log("initApp"),window.fbAsyncInit=function(){FB.init({appId:"1496174921019826",autoLogAppEvents:"true",xfbml:"true",version:"v19.0"})};case 2:case"end":return t.stop()}}),t)})))()},fetchCategories:function(){return Object(o.a)(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:case"end":return t.stop()}}),t)})))()},gotoCategory:function(t){this.$router.push("/quizzes/"+t.id)}}}),c=n(67),component=Object(c.a)(r,(function(){var t=this,e=t._self._c;return e("div",{staticClass:"h-full w-full flex flex-col justify-between px-5 mx-auto md:w-11/12 xl:w-10/12 pt-5"},[t._m(0),t._v(" "),e("div",{staticClass:"flex flex-col gap-3"},[e("div",{staticClass:"grid md:grid-cols-2 gap-5 md:gap-3 md:mt-10"},t._l(t.categories,(function(n){return e("article",{key:n.id,staticClass:"group rounded hover:shadow-lg cursor-pointer md:rounded-lg overflow-hidden border relative h-64 md:h-32",on:{click:function(e){return t.gotoCategory(n)}}},[e("img",{staticClass:"absolute w-full h-full object-cover",attrs:{src:n.image,alt:""}}),t._v(" "),e("div",{staticClass:"absolute group-hover:hidden top-0 left-0 w-full h-full bg-black bg-opacity-20"}),t._v(" "),e("div",{staticClass:"absolute bottom-0 text-md bg-gradient-to-b from-transparent to-black text-white p-2 py-3 w-full"},[e("h3",{staticClass:"text-center uppercase text-2xl"},[t._v(t._s(n.name))])])])})),0)]),t._v(" "),e("div",{staticClass:"flex justify-center items-center"},[e("facebook-login-button")],1),t._v(" "),t._m(1)])}),[function(){var t=this,e=t._self._c;return e("div",{staticClass:"mt-5 md:my-10 text-white text-center px-2"},[e("img",{staticClass:"h-auto w-full",attrs:{src:"/logo.png",alt:""}}),t._v(" "),e("span",[t._v("v0.1.3")])])},function(){var t=this._self._c;return t("footer",{staticClass:"text-center text-gray-200 mb-10 md:mb-5"},[t("a",{staticClass:"underline text-blue-500",attrs:{href:"https://amane.dev"}},[this._v("あ")])])}],!1,null,null,null);e.default=component.exports;installComponents(component,{FacebookLoginButton:n(317).default})}}]);