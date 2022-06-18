import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie/movie_bloc.dart';
import '../component/list_view_builder.dart';
import '../component/not_found.dart';
import '../component/progress_bar.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final MovieBloc _movieBloc = MovieBloc();

  @override
  void initState() {
    _movieBloc.add(GetMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _movieBloc,
        child: BlocListener<MovieBloc, MovieState>(
          listener: (context, state) {
            if (state is MovieError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message!),
              ));
            }
          },
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieInitial) {
                return const ProgressBar();
              } else if (state is MovieLoading) {
                return const ProgressBar();
              } else if (state is MovieSuccess) {
                return ListViewBuilder(
                    listDataModel: state.movieModel.mappingData());
              } else {
                return const NotFound();
              }
            },
          ),
        ),
      ),
    );
  }
}
