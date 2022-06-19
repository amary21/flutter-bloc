import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detail/detail_bloc.dart';
import '../util/date_format.dart';

class AboutInfo extends StatelessWidget {
  final String release;
  final DetailBloc detailBloc;

  const AboutInfo({Key? key, required this.release, required this.detailBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Release Date',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      dateFormat(release),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Genre',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              BlocProvider(
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
                        var genres = state.detailModel.genres ?? [];
                        return Wrap(
                          spacing: 4,
                          children: genres
                              .map((genre) => Chip(
                                    backgroundColor: Colors.grey,
                                    label: Text(genre.name ?? ""),
                                    labelStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ))
                              .toList(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
