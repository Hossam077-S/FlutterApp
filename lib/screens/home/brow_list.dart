import 'package:coffe_type/models/brow.dart';
import 'package:coffe_type/screens/home/brow_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrowList extends StatefulWidget {
  @override
  _BrowListState createState() => _BrowListState();
}

class _BrowListState extends State<BrowList> {
  @override
  Widget build(BuildContext context) {
    final brows = Provider.of<List<Brow>>(context) ?? [];

    return ListView.builder(
      itemCount: brows.length,
      itemBuilder: (context, index) {
        return BrowTile(
          brew: brows[index],
        );
      },
    );
  }
}
