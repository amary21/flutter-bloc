import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image/image_bloc.dart';
import '../util/config.dart';

class ScreenShoot extends StatefulWidget {
  final ImageBloc imageBloc;

  const ScreenShoot({Key? key, required this.imageBloc}) : super(key: key);

  @override
  State<ScreenShoot> createState() => _ScreenShootState();
}

class _ScreenShootState extends State<ScreenShoot> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => widget.imageBloc,
        child: BlocListener<ImageBloc, ImageState>(
            listener: (context, state) {
              if (state is ImageError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message!),
                ));
              }
            }, child: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            if (state is ImageSuccess) {
              return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var image = state.imageModel
                          .backdrops?[index].filePath ??
                          "";
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 0,
                            right: 8),
                        child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(10),
                            child: Image.network(
                                Config.imageUrl(image))),
                      );
                    },
                    itemCount:
                    state.imageModel.backdrops?.length,
                  ));
            } else {
              return Container();
            }
          },
        )));
  }
}
