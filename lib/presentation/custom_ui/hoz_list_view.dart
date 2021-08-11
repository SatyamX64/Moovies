import 'package:flutter/material.dart';

class WrapContentHozListView<T> extends StatefulWidget {
  late final List<T> list;
  late final IndexedWidgetBuilder itemBuilder;
  late final IndexedWidgetBuilder? separatorBuilder;

  WrapContentHozListView({
    required this.list,
    required this.itemBuilder,
    this.separatorBuilder,
  });

  @override
  _WrapContentHozListViewState createState() => _WrapContentHozListViewState();
}

class _WrapContentHozListViewState extends State<WrapContentHozListView> {
  List<Widget> _generateItemWidgets() {
    var items = <Widget>[];
    for (var i = 0; i < widget.list.length; i++) {
      items.add(widget.itemBuilder(context, i));
      if (widget.separatorBuilder != null) {
        items.add(widget.separatorBuilder!(context, i));
      }
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _generateItemWidgets(),
      ),
    );
  }
}
