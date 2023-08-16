import 'package:bloc/bloc.dart';
import 'package:cat_api/model/catdetalils.dart';
import 'package:cat_api/repository/repositories.dart';
import 'package:meta/meta.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepo catrepo = CatRepo();
  CatBloc() : super(CatInitial()) {
    on<CatEvent>((event, emit) async {
      try {
        final cat = await catrepo.getCats();
  
        emit(CatLoadedState(cat));
      } catch (e) {
        emit(CatErrorState(e.toString()));
      }
    });
  }
}
