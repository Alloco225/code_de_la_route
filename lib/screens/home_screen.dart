import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map> sections = [
    {
      "title": "Signalisation",
    },
    {
      "title": "Dégagements",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              // gradient: RadialGradient(
              //   colors: [Color(0xffff512f), Color(0xfff09819)],
              //   stops: [0, 1],
              //   center: Alignment.bottomCenter,
              // ),
              gradient: RadialGradient(
            colors: [Color(0xffff512f), Color(0xfff09819)],
            stops: [0, 1],
            center: Alignment(0.0, -0.4),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Custom appbar
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.all(5),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(8)),
                    //   child: const Icon(Icons.menu),
                    // ),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                            ),
                            Column(
                              children: [
                                Text("User name"),
                                Text("User level"),
                              ],
                            )
                          ],
                        )),
                    // const Text("Code la Route"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(Icons.lightbulb),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("1200"),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   child: const Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("Welcome"),
              //       Text("Auth.user.name"),
              //     ],
              //   ),
              // ),
              Container(
                  height: 110,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.attractions),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  children: [
                                    Text("Daily Task"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Daily Task"),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: const Icon(Icons.people),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      height: 10,
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: FractionallySizedBox(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        widthFactor: .3,
                                        child: Container(
                                          height: 8,
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [Text("Progress"), Text("9/12")],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                    ],
                  )),
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
                  children: List.generate(
                      5,
                      (index) => Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Section Title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.all(10),
                                  child: const Icon(Icons.arrow_forward),
                                )
                              ],
                            ),
                          )),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
