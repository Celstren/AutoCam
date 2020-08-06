import 'package:autocam/models/service_history/service_history.dart';
import 'package:autocam/pages/service_history/filter/service_history_filter.dart';
import 'package:rxdart/rxdart.dart';

class FilterController {
  static FilterController _instance;

  BehaviorSubject<ServiceHistoryFilter> _serviceFilterStream;
  BehaviorSubject<List<ServiceHistory>> _servicesStream;

  Stream<List<ServiceHistory>> get getFilteredServices =>
      Rx.combineLatest2(getServicesEvents(), getServiceFilterEvents(),
          (List<ServiceHistory> a, ServiceHistoryFilter b) {
        return a
            .where((element) {
              if (b.status != "Todos" && b.status != element.status) return false;
              if (b.licencePlate != "Todos" && element.licencePlate != b.licencePlate) return false;
              if (b.startShipDate.isAfter(element.shipDate) || b.endShipDate.isBefore(element.shipDate)) return false;
              if (b.startReceiveDate.isAfter(element.receiveDate) || b.endReceiveDate.isBefore(element.receiveDate)) return false;
              return true;
            })
            .toList();
      });

  FilterController._() {
    DateTime now = DateTime.now();
    _serviceFilterStream = BehaviorSubject.seeded(
      ServiceHistoryFilter(
        licencePlate: "Todos",
        startReceiveDate: DateTime(now.year, now.month, now.day, 0, 0, 0),
        endReceiveDate: DateTime(now.year, now.month, now.day, 23, 59, 59),
        startShipDate: DateTime(now.year, now.month, now.day, 0, 0, 0),
        endShipDate: DateTime(now.year, now.month, now.day, 23, 59, 59),
        status: "Todos",
      ),
    );
    _servicesStream = BehaviorSubject.seeded([
      ServiceHistory(licencePlate: "A", receiveDate: DateTime.now(), shipDate: DateTime.now(), status: "Activo", description: "Test"),
    ]);
  }

  factory FilterController() => _getInstance();

  static FilterController _getInstance() {
    if (_instance == null) {
      _instance = FilterController._();
    }
    return _instance;
  }

  /// SERVICES STREAM METHODS
  Stream<List<ServiceHistory>> getServicesEvents() => _servicesStream.stream;

  List<ServiceHistory> getServicesValue() => _servicesStream.value;

  void updateServices(List<ServiceHistory> data) => _servicesStream.add(data);

  /// SERVICE FILTER STREAM METHODS
  Stream<ServiceHistoryFilter> getServiceFilterEvents() =>
      _serviceFilterStream.stream;

  ServiceHistoryFilter getServiceFilterValue() => _serviceFilterStream.value;

  void updateServiceFilter(ServiceHistoryFilter data) =>
      _serviceFilterStream.add(data);
}
