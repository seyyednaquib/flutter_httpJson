import 'package:flutter/material.dart';
import 'package:navigation_simple/models/user.dart';

class FamilyScreen extends StatelessWidget {
  final User examiner;
  FamilyScreen({this.examiner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Contact for this examiner'),
      ),
      body: ListView.builder(
          itemCount: examiner.family.length,
          itemBuilder: (context, index) {
            examiner.family.sort((a, b) => a.name.compareTo(b.name));
            return Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Card(
                  child: Column(children: [
                    ListTile(
                      title: Text('${examiner.family[index].name}'),
                      subtitle: Text('${examiner.family[index].contactNo} ',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6))),
                    ),
                  ]),
                ));
          }),
    );
  }
}
