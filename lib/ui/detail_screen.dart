import 'package:flutter/material.dart';

import '../bloc/detail/detail_bloc.dart';
import '../bloc/image/image_bloc.dart';
import '../component/about_info.dart';
import '../component/divider_view.dart';
import '../component/screenshot.dart';
import '../component/short_info.dart';
import '../component/text_view.dart';
import '../data/model/data_model.dart';
import '../util/config.dart';

class DetailScreen extends StatefulWidget {
  final DataModel dataModel;

  const DetailScreen({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DetailBloc _detailBloc = DetailBloc();
  final ImageBloc _imageBloc = ImageBloc();

  @override
  void initState() {
    _detailBloc.add(GetDetail(
        content: widget.dataModel.content, idResult: widget.dataModel.id));
    _imageBloc.add(GetImageList(
        content: widget.dataModel.content, idResult: widget.dataModel.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    Config.imageUrl(widget.dataModel.backDrop),
                    fit: BoxFit.fill,
                  )),
              Container(
                margin: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextView(
                        text: widget.dataModel.title,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    ShortInfo(
                        rate: widget.dataModel.voteAverage.toString(),
                        content: widget.dataModel.content,
                        detailBloc: _detailBloc),
                    const DividerView(),
                    AboutInfo(
                        release: widget.dataModel.releaseDate,
                        detailBloc: _detailBloc),
                    const DividerView(),
                    const TextView(
                        text: 'Synopsis',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextView(
                          text: widget.dataModel.overview,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    const TextView(
                        text: 'Screenshot',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    ScreenShoot(imageBloc: _imageBloc)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
