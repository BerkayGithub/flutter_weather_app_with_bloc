import 'package:flutter/material.dart';

class MyTheme {
  MaterialColor _renk;
  ThemeData _tema;

  MyTheme(this._tema, this._renk);

  set renk(MaterialColor yeniRenk) {
    _renk = yeniRenk;
  }

  MaterialColor get renk => _renk;

  set tema(ThemeData yeniTema) {
    _tema = yeniTema;
  }

  ThemeData get tema => _tema;
}
