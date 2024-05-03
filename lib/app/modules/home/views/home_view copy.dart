// import 'package:codedelaroute/app/modules/home/views/info_modal.dart';
// import 'package:codedelaroute/app/routes/app_pages.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:ionicons/ionicons.dart';

// import '../../../views/widgets/menu_button_widget.dart';
// import '../../auth/services/auth_service.dart';
// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   HomeView({super.key});

//   final _authService = Get.find<AuthService>();


//   final List menuElements = [
//     {
//       "text": "COURS",
//       "action": () {
//         Get.toNamed(Routes.COURSE_LIST);
//       },
//     },
//     {
//       "text": "QUIZZ",
//       "action": () {
//         Get.toNamed(Routes.QUIZZ_CATEGORIES);
//       },
//     },
//     {
//       "text": "PROFILE",
//       "action": () {
//         Get.toNamed(Routes.PROFILE);
//       },
//     },
//     {
//       "text": "LEADERBOARD",
//       "action": () {
//         Get.toNamed(Routes.LEADERBOARD);
//       },
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         print('User is currently signed out!');
//       } else {
//         print('User is signed in!');
//       }
//     });

//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('HomeView'),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             const Spacer(),
//             Expanded(
//                 child: Container(
//               padding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.of(context).size.width * .2),
//               child: Column(
//                 children: [
//                   ...menuElements.map(
//                     (element) => Column(children: [
//                       MenuButtonWidget(
//                         text: element['text'],
//                         onPressed: element['action'],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                     ]),
//                   ),
//                   Obx(() {
//                     return SwitchListTile(
//                       title: const Text('isPremium value'),
//                       value: _authService.isPremium.value,
//                       onChanged: _authService.setIsPremium,
//                     );
//                   }),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // authStateProvider.authenticate();
//                           // Navigator.of(context).pushNamed(Routes.auth);
//                         },
//                         icon: const Icon(Ionicons.person_outline),
//                       ),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Ionicons.settings_outline),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // showBottomSheet(context: context, builder: (ctx)=>{

//                           // })
//                           showDialog(
//                               context: context,
//                               builder: (ctx) => const InfoModal());
//                         },
//                         icon: const Icon(Ionicons.information),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )),
//           ],
//         ));
//   }
// }
