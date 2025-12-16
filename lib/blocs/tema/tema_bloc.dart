import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tema_event.dart';

part 'tema_state.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  TemaBloc()
    : super(
        UygulamaTemasi(
          tema: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          renk: Colors.purple,
        ),
      ) {
    on<TemaDegistir>(_temaDegistir);
  }

  FutureOr<void> _temaDegistir(
    TemaDegistir event,
    Emitter<TemaState> emit,
  ) async {
    UygulamaTemasi uygulamaTemasi = UygulamaTemasi(
      tema: ThemeData(),
      renk: Colors.primaries.first,
    );
    switch (event.havaDurumuKisaltmasi.toLowerCase()) {
      case "partly cloudy":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.orangeAccent),
          renk: Colors.yellow,
        );
        break;
      case "sunny":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.orangeAccent),
          renk: Colors.yellow,
        );
        break;
      case "clear":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.orangeAccent),
          renk: Colors.yellow,
        );
        break;
      case "light snow":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.blueGrey),
          renk: Colors.grey,
        );
        break;
      case "overcast":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.blueGrey),
          renk: Colors.grey,
        );
        break;
      case "cloudy":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.indigoAccent),
          renk: Colors.indigo,
        );
        break;
      case "fog":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.indigoAccent),
          renk: Colors.indigo,
        );
        break;
      case "light freezing rain":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.indigoAccent),
          renk: Colors.indigo,
        );
        break;
      case "patchy rain nearby":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.indigoAccent),
          renk: Colors.indigo,
        );
        break;
      case "light rain":
        uygulamaTemasi = UygulamaTemasi(
          tema: ThemeData(primaryColor: Colors.indigoAccent),
          renk: Colors.indigo,
        );
        break;
    }
    emit(uygulamaTemasi);
  }
}
