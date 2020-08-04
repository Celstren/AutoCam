import 'package:autocam/models/service/service.dart';
import 'package:autocam/pages/navigation/home_navigation/home_navigation_tabs.dart';
import 'package:rxdart/rxdart.dart';

class HomeNavigationController {
  static HomeNavigationController _instance;

  BehaviorSubject<HomeNavigationTabs> _homeNavigationTabStream;
  BehaviorSubject<Service> _serviceSelectedStream;

  HomeNavigationController._(){
    this._homeNavigationTabStream = new BehaviorSubject.seeded(HomeNavigationTabs.home);
    this._serviceSelectedStream = new BehaviorSubject.seeded(Service(title: ""));
  }

  factory HomeNavigationController() => _getInstance();

  static HomeNavigationController _getInstance() {
    if (_instance == null) {
      _instance = HomeNavigationController._();
    }
    return _instance;
  }

  /// HOME NAVIGATION TAB STREAM METHODS
  Stream<HomeNavigationTabs> getHomeNavigationTabEvents() => _homeNavigationTabStream.stream;

  HomeNavigationTabs getHomeNavigationTabValue() => _homeNavigationTabStream.value;

  void updateHomeNavigationTab(HomeNavigationTabs data) => _homeNavigationTabStream.add(data);

  /// SERVICE SELECTED STREAM METHODS
  Stream<Service> getServiceSelectedEvents() => _serviceSelectedStream.stream;

  Service getServiceSelectedValue() => _serviceSelectedStream.value;

  void updateServiceSelected(Service data) => _serviceSelectedStream.add(data);
}