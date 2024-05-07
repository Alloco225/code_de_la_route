import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/make_dismissable.dart';

enum AuthMode { Login, Register }

class ExploreSheet extends StatefulWidget {
  const ExploreSheet({super.key});

  @override
  _ExploreSheetState createState() => _ExploreSheetState();
}

class _ExploreSheetState extends State<ExploreSheet> {
  //
  late AuthMode _authMode;
  late PageController _pageController;

  @override
  void initState() {
    print("<<** Explore sheet");
    _authMode = AuthMode.Register;
    _pageController = PageController(initialPage: 0);

    super.initState();
    setState(() {});
  }
  //

  List categories = [];
  List selectedCategories = [];

  @override
  void didChangeDependencies() {
    print("<<< digChangeDep");

    super.didChangeDependencies();
    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   backgroundColor: Colors.transparent,
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    //   builder: (ctx) => EventCategoriesSelectionPage(),
    // );

    // Future.delayed(Duration(seconds: 2)).then((_) => _setUpCategories());
  }

  _setUpCategories() async {
    // await Navigator.of(context).push(
    // MaterialPageRoute(builder: (ctx) => EventCategoriesSelectionPage()));
  }

  @override
  Widget build(BuildContext context) {
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: .3,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          child: Column(
            children: [
              // AGrappler(),
              Container(),
              //
              // date filter
              Container(),
              //
              // events list
              Expanded(
                child: ListView(
                  children: const [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
