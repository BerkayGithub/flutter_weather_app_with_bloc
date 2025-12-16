part of 'tema_bloc.dart';

sealed class TemaEvent extends Equatable {
  const TemaEvent();
}

class TemaDegistir extends TemaEvent{
  final String havaDurumuKisaltmasi;
  const TemaDegistir({required this.havaDurumuKisaltmasi});

  @override
  List<Object?> get props => [havaDurumuKisaltmasi];

}