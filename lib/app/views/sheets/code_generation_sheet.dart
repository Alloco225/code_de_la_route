import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/a_grappler.dart';
import '../widgets/a_icon.dart';

class CodeGenerationSheet extends StatefulWidget {
  // final LatLng position;

  CodeGenerationSheet({
    Key? key,
    // required this.position,
  }) : super(key: key);

  @override
  _CodeGenerationSheetState createState() => _CodeGenerationSheetState();
}

class _CodeGenerationSheetState extends State<CodeGenerationSheet> {
  // 
  String addressCode = "";
  bool _isLoading = true;
  bool isEphemere = false;
  bool isPrivate = false;
  bool _isCodeLoading = false;

  _generateCode() async {
    _isCodeLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 5));
    addressCode = "CIAB2145";
    _isCodeLoading = false;
    setState(() {});
  }

  _init() async {
    // fetch location details
  }

  @override
  void initState() {
    super.initState();

    print("<<** CodeGeneration sheet");

    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      // initialChildSize: .4,

      initialChildSize: .5,

      builder: (c, sc) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          controller: sc,
          children: _isLoading
              ? [
                  AGrappler(),
                  Spacer(),
                  CircularProgressIndicator(),
                  Spacer(),
                ]
              : [
                  AGrappler(),

                  // TitleBox
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      dense: true,
                      title: Text("Angré Gestoci"),
                      // subtitle: Text("${widget.position}"),
                      trailing: AIcon(
                        icon: Icons.place,
                        color: Colors.red,
                      ),
                    ),
                  ),

                  Divider(
                    height: 20,
                  ),

                  //
                  // Code Item
                  // Code settings
                  if (addressCode.isEmpty)
                    ListTile(
                      leading: AIcon(
                        color: isEphemere ? Colors.orange : Colors.grey,
                        icon: Icons.alarm,
                      ),
                      title: Text("Ephémère"),
                      subtitle: Text("Le code sera valide que pour 15 minutes"),
                      trailing: CupertinoSwitch(
                        value: isEphemere,
                        onChanged: (_) {
                          isEphemere = _;
                          setState(() {});
                        },
                      ),
                    ),
                  if (addressCode.isEmpty)
                    Divider(
                      height: 20,
                    ),
                  if (addressCode.isEmpty)
                    ListTile(
                      leading: AIcon(
                        color: isPrivate ? Colors.purple : Colors.grey,
                        icon: isPrivate ? Icons.lock : Icons.lock_open,
                        animated: true,
                      ),
                      title: Text("Privée"),
                      subtitle: Text(
                          "Vous recevrez une demande avant d'afficher le code à un tiers"),
                      trailing: CupertinoSwitch(
                        value: isPrivate,
                        onChanged: (_) {
                          isPrivate = _;
                          setState(() {});
                        },
                      ),
                    ),
                  if (addressCode.isEmpty)
                    Divider(
                      height: 20,
                    ),

                  if (addressCode.isNotEmpty)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$addressCode"),
                          IconButton(
                            icon: Icon(Icons.copy),
                            onPressed: () {
                              //
                              FlutterClipboard.copy(addressCode).then(
                                  (value) => print("copied")
                                  // InAppNotification.show(
                                  //       child: ANotification("Copié"),
                                  //       context: context,

                                  //       onTap: () => print('Notification tapped!'),
                                  //     )
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                  if (addressCode.isEmpty)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(),
                          _isCodeLoading
                              ? CircularProgressIndicator()
                              : Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: _generateCode,
                                      child: Text(
                                        "Générer",
                                        textScaleFactor: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                          Spacer(),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  // Action buttons
                  if (addressCode.isNotEmpty)
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[],
                        ),
                      ),
                    ),
                ],
        ),
      ),
    );
  }
}
