part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class TabChangeEvent extends NavigationEvent {
  final int tabIndex;

  TabChangeEvent({required this.tabIndex});
}