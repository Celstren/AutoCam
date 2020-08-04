import 'package:autocam/pages/navigation/main_navigation/main_navigation_tabs.dart';
import 'package:rxdart/rxdart.dart';

class NavigationController {
  static NavigationController _instance;

  BehaviorSubject<NavigationTabs> _navigationTabStream;

  NavigationController._(){
    this._navigationTabStream = new BehaviorSubject.seeded(NavigationTabs.login);
  }

  factory NavigationController() => _getInstance();

  static NavigationController _getInstance() {
    if (_instance == null) {
      _instance = NavigationController._();
    }
    return _instance;
  }

  /// NAVIGATION TAB STREAM METHODS
  Stream<NavigationTabs> getNavigationTabEvents() => _navigationTabStream.stream;

  NavigationTabs getNavigationTabValue() => _navigationTabStream.value;

  void updateNavigationTab(NavigationTabs data) => _navigationTabStream.add(data);
}