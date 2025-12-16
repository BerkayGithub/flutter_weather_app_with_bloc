part of 'tema_bloc.dart';

sealed class TemaState extends Equatable {
  const TemaState();
}

final class TemaInitial extends TemaState {
  @override
  List<Object> get props => [];
}

final class UygulamaTemasi extends TemaState {
  final ThemeData tema;
  final MaterialColor renk;
  const UygulamaTemasi({required this.tema, required this.renk});

  @override
  List<Object?> get props => [tema, renk];

}