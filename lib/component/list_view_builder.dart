import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../data/model/data_model.dart';
import 'item_view.dart';


class ListViewBuilder extends StatefulWidget {
  final List<DataModel> listDataModel;

  const ListViewBuilder({Key? key, required this.listDataModel}) : super(key: key);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24, left: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth < 600){
            return gridView(2);
          } else if(constraints.maxWidth < 900){
            return gridView(4);
          } else if(constraints.maxWidth < 1200) {
            return gridView(6);
          } else {
            return gridView(9);
          }
        }
      )
    );
  }
  
  Widget gridView(int maxRow){
    return MasonryGridView.count(
      crossAxisCount: maxRow,
      mainAxisSpacing: 12,
      crossAxisSpacing: 10,
      itemCount: widget.listDataModel.length,
      itemBuilder: (context, index) {
        return ItemView(dataModel: widget.listDataModel[index]);
      },

    );
  }
}
