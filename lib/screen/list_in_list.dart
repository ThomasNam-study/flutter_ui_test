import 'package:flutter/material.dart';
import 'package:flutteruitest/model/list_model.dart';

class ListInListPage extends StatefulWidget {
  final List<ListModel> lists;

  ListInListPage({this.lists});

  @override
  _ListInListPageState createState() => _ListInListPageState();
}

class _ListInListPageState extends State<ListInListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List in List'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: makeListTile(widget.lists),
        ));
  }

  List<Widget> makeListTile(List<ListModel> lists) {
    return lists.map((m) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(m.title),
            onTap: () {
              setState(() {
                m.lists.add(ListModel(title: m.title + ' - Sub'));
              });
            },
          ),
          (m.lists.length > 0
              ? ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: makeListTile(m.lists),
                )
              : Container()),
        ],
      );
    }).toList();
  }
}
