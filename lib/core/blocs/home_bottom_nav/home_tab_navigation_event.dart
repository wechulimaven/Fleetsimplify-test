import 'package:flutter/material.dart';

@immutable
abstract class HomeTabNavigationEvent {}

class NavigateToAnotherTab extends HomeTabNavigationEvent {
  final int index;
  NavigateToAnotherTab(this.index);
}
