//Bloc Event
import 'package:equatable/equatable.dart';

abstract class GetCatFactsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCatFactsDataEvent extends GetCatFactsEvent {}
