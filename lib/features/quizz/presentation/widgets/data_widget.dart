import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../business/entities/quizz_entity.dart';
import '../providers/quizz_provider.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizzEntity? quizz = Provider.of<QuizzProvider>(context).quizz;
    Failure? failure = Provider.of<QuizzProvider>(context).failure;
    late Widget widget;
    widget = SingleChildScrollView(
      child: Column(
        children: [
          const ListTile(
            leading:  Text('API'),
            // title: Text('https://pokeapi.co/api/v2/quizz/${quizz.id}'),
            tileColor: Colors.orange,
          ),
          ListTile(
            title: Text(kName),
            // subtitle: Text(quizz.name),
          ),
          const Divider(),
          ListTile(
            title: Text(kId),
            // subtitle: Text(quizz.id.toString()),
          ),
          const Divider(),
          ListTile(
            leading: const Text('{ }'),
            title: Text(kSprites),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Text('{ }'),
                  title: Text(kOther),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Text('{ }'),
                        title: Text(kOfficialArtwork),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(kFrontDefault),
                              // subtitle: SelectableText(quizz.sprites.other.officialArtwork.frontDefault),
                            ),
                            ListTile(
                              title: Text(kFrontShiny),
                              // subtitle: SelectableText(quizz.sprites.other.officialArtwork.frontShiny),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Text('[ ]'),
            title: Text(kTypes),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10.0),
          //   child: Column(
          //     children: List.generate(
          //       quizz.types.length,
          //       (index) => Column(
          //         children: [
          //           ListTile(
          //             leading: const Text('{ }'),
          //             title: Text(kType),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10.0),
          //             child: ListTile(
          //               title: Text(kName),
          //               // subtitle: Text(quizz.types.elementAt(index).type.name),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
    return widget;
  }
}
