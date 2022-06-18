import 'package:flutemovie/ui/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../data/model/data_model.dart';
import '../util/config.dart';

class ItemView extends StatefulWidget {
  final DataModel dataModel;
  const ItemView({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(dataModel: widget.dataModel)));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: Config.imageUrl(widget.dataModel.poster),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                widget.dataModel.title,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
