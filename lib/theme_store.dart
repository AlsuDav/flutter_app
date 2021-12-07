import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeData theme = ThemeData.light();

  @action
  setTheme(ThemeData theme) {
    this.theme = theme;
  }
  }

