class ListModel {
  final String title;

  List<ListModel> lists;

  ListModel({this.title, List<ListModel> lists}) : lists = lists ?? [];
}