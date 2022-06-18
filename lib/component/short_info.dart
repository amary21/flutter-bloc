import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detail/detail_bloc.dart';
import '../data/model/detail_model.dart';

class ShortInfo extends StatelessWidget {
  final String rate;
  final String content;
  final DetailBloc detailBloc;

  const ShortInfo({Key? key, required this.rate, required this.detailBloc, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailBloc,
      child: BlocListener<DetailBloc, DetailState>(
        listener: (context, state) {
          if (state is DetailError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message!),
            ));
          }
        },
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailSuccess) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.grey),
                    Padding(
                      padding:
                      const EdgeInsets.only(
                          top: 4, bottom: 4, left: 4, right: 18),
                      child: Text(
                        '${getRuntime(state.detailModel, content)} minutes',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Icon(Icons.star, color: Colors.grey),
                    Padding(
                      padding:
                      const EdgeInsets.only(
                          top: 4, bottom: 4, left: 4, right: 18),
                      child: Text(
                        '$rate (IMDb)',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  int getRuntime(DetailModel detailModel, String content){
    if(content == 'movie' && detailModel.runtime != null){
      return detailModel.runtime ?? 0;
    } else if(content == 'tv' && detailModel.lastEpisodeToAir?.runtime != null){
      return detailModel.lastEpisodeToAir?.runtime ?? 0;
    } else {
      return 0;
    }
  }
}
