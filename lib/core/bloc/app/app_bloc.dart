import '../base_bloc.dart';
import '../base_bloc_event.dart';
import 'app_state.dart';

class AppBloc extends BaseBloc<BaseBlocEvent, AppState> {
  AppBloc() {
    fetchData();
  }

  @override
  AppState get initialState => AppState();
}
