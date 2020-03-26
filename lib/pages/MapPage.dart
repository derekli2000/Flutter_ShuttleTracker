import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import '../bloc/shuttle_bloc.dart';
import '../widgets/states.dart';


class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  ShuttleBloc shuttleBloc;

  @override
  void initState() {
    super.initState();
    shuttleBloc = BlocProvider.of<ShuttleBloc>(context);
    shuttleBloc.add(GetShuttleMap());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            BlocBuilder<ShuttleBloc, ShuttleState>(builder: (context, state) {
          if (state is ShuttleInitial) {
            print('state is initial');
            return buildInitialState();
          } else if (state is ShuttleError) {
            print('state has error');
            return buildErrorState(state.message);
          } else if (state is ShuttleLoaded) {
            print('state is loaded');
            shuttleBloc.add(RefreshShuttleMap());
            return buildLoadedState(state.routes, state.location, state.stops,
                state.updates, state.mapkey);
          }
          print('state is loading');
          return buildLoadingState();
        }),
      ),
    );
  }
}
