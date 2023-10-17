import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlBlocCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    BlocProvider manage's bloc lifecycle,
     */
    return BlocProvider(
      create: (BuildContext context) => BlBlocCounterBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    // Section one
    final bloc = BlocProvider.of<BlBlocCounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Bloc-Bloc Example')),
      body: Center(
        //Section two
        child: BlocBuilder<BlBlocCounterBloc, BlBlocCounterState>(
          builder: (context, state) {
            return Text(
              'Pressed ${bloc.state.count} times',
              style: TextStyle(fontSize: 30.0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.add(CounterIncrementEvent()),
        child: Icon(Icons.add),
      ),
    );
  }
}

class BlBlocCounterBloc extends Bloc<BlBlocCounterEvent, BlBlocCounterState> {
  BlBlocCounterBloc() : super(BlBlocCounterState().init());

  @override
  Stream<BlBlocCounterState> mapEventToState(BlBlocCounterEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    } else if (event is CounterIncrementEvent) {
      yield increment();
    }
  }

  Future<BlBlocCounterState> init() async {
    return state.clone();
  }

  ///自增
  BlBlocCounterState increment() {
    return state.clone()..count = ++state.count;
  }
}

abstract class BlBlocCounterEvent {}

class InitEvent extends BlBlocCounterEvent {}

class CounterIncrementEvent extends BlBlocCounterEvent {}

class BlBlocCounterState {
  late int count;

  BlBlocCounterState init() {
    return BlBlocCounterState()..count = 0;
  }

  BlBlocCounterState clone() {
    return BlBlocCounterState()..count = count;
  }
}
