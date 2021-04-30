import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/entities/cat_facts_entity.dart';

class CatFactsListView extends StatefulWidget {
  final List<CatFactsEntity> list;

  const CatFactsListView({Key key, @required this.list}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CatFactsListViewState();
}

class _CatFactsListViewState extends State<CatFactsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          final data = widget.list[index];
          return ListTile(
            title: Text(data.text),
            subtitle: Text(data.createdAt),
          );
        });
  }
}
