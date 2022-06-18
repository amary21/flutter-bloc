import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tv/tv_bloc.dart';
import '../component/list_view_builder.dart';
import '../component/not_found.dart';
import '../component/progress_bar.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  State<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  final TvBloc _tvBloc = TvBloc();

  @override
  void initState() {
    _tvBloc.add(GetTvList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _tvBloc,
        child: BlocListener<TvBloc, TvState>(
          listener: (context, state) {
            if (state is TvError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message!),
              ));
            }
          },
          child: BlocBuilder<TvBloc, TvState>(
            builder: (context, state) {
              if (state is TvInitial) {
                return const ProgressBar();
              } else if (state is TvLoading) {
                return const ProgressBar();
              } else if (state is TvSuccess) {
                return ListViewBuilder(
                    listDataModel: state.tvModel.mappingData());
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
