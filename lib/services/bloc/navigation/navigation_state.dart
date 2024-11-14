part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {
  final int tabIndex;

  const NavigationState({required this.tabIndex});
}

final class NavigationInitial extends NavigationState {
  const NavigationInitial({required super.tabIndex});
}

class NavigationChangedState extends NavigationState {
  const NavigationChangedState({required int tabIndex}) : super(tabIndex: tabIndex);
}
