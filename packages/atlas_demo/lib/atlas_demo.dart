library atlas_demo;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'models/models.dart';
import 'widgets/widgets.dart';

class AtlasDemo extends StatelessWidget {
  final String title;
  final InitialMapData initialMapData;

  const AtlasDemo(this.title, this.initialMapData, {Key key})
      : assert(title != null),
        assert(initialMapData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocSupervisor.delegate = ApplicationBlocDelegate();

    return MultiBlocProvider(
      providers: [
        BlocProvider<DemoBloc>(
          create: (context) => DemoBloc(),
        ),
        BlocProvider<MapBloc>(
          create: (context) => MapBloc(initialMapData),
        ),
      ],
      child: MaterialApp(
        title: title,
        home: Demo(title, initialMapData.cameraPositions[0]),
      ),
    );
  }
}
