import 'package:dogs/domain/models/dog.dart';
import 'package:dogs/domain/repositories/dogs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class DogsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadDogs extends DogsEvent {}

// States
abstract class DogsState extends Equatable {
  @override
  List<Object> get props => [];
}

class DogsInitial extends DogsState {}
class DogsLoading extends DogsState {}
class DogsLoaded extends DogsState {
  final List<Dog> dogs;
  DogsLoaded(this.dogs);

  @override
  List<Object> get props => [dogs];
}
class DogsError extends DogsState {
  final String message;
  DogsError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class DogsBloc extends Bloc<DogsEvent, DogsState> {
  final DogsRepository repository;

  DogsBloc(this.repository) : super(DogsInitial()) {
    on<LoadDogs>((event, emit) async {
      emit(DogsLoading());
      try {
        final dogs = await repository.getDogs();
        emit(DogsLoaded(dogs));
      } catch (e) {
        emit(DogsError(e.toString()));
      }
    });
  }
}