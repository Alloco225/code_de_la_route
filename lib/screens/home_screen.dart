import 'package:code_de_la_route/db/db.dart';
import 'package:code_de_la_route/data/models/quizz_category.dart';
import 'package:code_de_la_route/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<QuizzCategory> categories = CATEGORIES;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // AudioMixer.of(context)?.playBgm(getAudioPath('bgm.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    void gotoQuizzList(QuizzCategory category) {
      Navigator.of(context).pushNamed(Routes.quizzList, arguments: {
        "categoryId": category.id,
        "categoryName": category.name
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // App logo
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fitWidth,
                  )),

              // Custom appbar
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //           padding: const EdgeInsets.all(5),
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(8)),
              //           child: const Row(
              //             children: [
              //               CircleAvatar(
              //                 backgroundColor: Colors.blue,
              //               ),
              //               Column(
              //                 children: [
              //                   Text("User name"),
              //                   Text("User level"),
              //                 ],
              //               )
              //             ],
              //           )),
              //       // const Text("Code la Route"),
              //       Container(
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(100)),
              //         padding: const EdgeInsets.all(3),
              //         child: Row(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.all(10),
              //               decoration: BoxDecoration(
              //                   color: Colors.yellow,
              //                   borderRadius: BorderRadius.circular(100)),
              //               child: const Icon(Icons.lightbulb),
              //             ),
              //             const SizedBox(
              //               width: 10,
              //             ),
              //             const Text("1200"),
              //             const SizedBox(
              //               width: 10,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // Container(
              //     height: 110,
              //     margin: const EdgeInsets.symmetric(horizontal: 10),
              //     padding: const EdgeInsets.all(5),
              //     decoration: BoxDecoration(
              //       color: Colors.blue,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.stretch,
              //       children: [
              //         Expanded(
              //           flex: 0,
              //           child: Container(
              //             padding: const EdgeInsets.symmetric(horizontal: 50),
              //             decoration: BoxDecoration(
              //               border: Border.all(color: Colors.white),
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: const Icon(Icons.attractions),
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //         Expanded(
              //             child: Padding(
              //           padding: const EdgeInsets.all(5),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   const Column(
              //                     children: [
              //                       Text("Daily Task"),
              //                       SizedBox(
              //                         height: 5,
              //                       ),
              //                       Text("Daily Task"),
              //                     ],
              //                   ),
              //                   const SizedBox(
              //                     width: 10,
              //                   ),
              //                   Container(
              //                     child: const Icon(Icons.people),
              //                   ),
              //                 ],
              //               ),
              //               const SizedBox(
              //                 height: 10,
              //               ),
              //               Column(
              //                 children: [
              //                   Container(
              //                       width: double.infinity,
              //                       height: 10,
              //                       padding: const EdgeInsets.all(2),
              //                       decoration: BoxDecoration(
              //                         color: Colors.white,
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                       child: FractionallySizedBox(
              //                         alignment:
              //                             AlignmentDirectional.centerStart,
              //                         widthFactor: .3,
              //                         child: Container(
              //                           height: 8,
              //                           padding: const EdgeInsets.all(2),
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             borderRadius:
              //                                 BorderRadius.circular(10),
              //                           ),
              //                         ),
              //                       )),
              //                   const SizedBox(
              //                     height: 5,
              //                   ),
              //                   const Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [Text("Progress"), Text("9/12")],
              //                   )
              //                 ],
              //               )
              //             ],
              //           ),
              //         ))
              //       ],
              //     )),
              const Spacer(),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / .9,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  children: categories
                      .map((category) => InkWell(
                          onTap: () => gotoQuizzList(category),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(category.image),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.white)),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black38,
                                            Colors.black87,
                                          ])),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        category.name,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )))
                      .toList(),
                ),
              )),
              const Text(
                "あ",
                semanticsLabel: "あ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
