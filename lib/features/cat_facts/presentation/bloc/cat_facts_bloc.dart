import 'package:flutter/widgets.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/domain/usecases/get_cat_facts_usecase.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/bloc/cat_facts_bloc_events.dart';
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/bloc/cat_facts_bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactsBloc extends Bloc<GetCatFactsEvent, GetCatFactsState> {
  final GetCatFactsUseCase getCatFactsUseCase;

  CatFactsBloc({@required this.getCatFactsUseCase}) : super(Empty());

  @override
  Stream<GetCatFactsState> mapEventToState(GetCatFactsEvent event) async* {
    if (event is GetCatFactsDataEvent) {
      yield Loading();
      final result = await getCatFactsUseCase();
      yield result.fold(
          (repositoryException) => Error(message: repositoryException.message),
          (catFacts) => Loaded(catFacts: catFacts));
    }
  }
}
