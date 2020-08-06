
import 'package:autocam/models/car/car.dart';
import 'package:rxdart/rxdart.dart';

class CarRegistrationController {
  static CarRegistrationController _instance;

  BehaviorSubject<Car> _carStream;

  CarRegistrationController._(){
    this._carStream = new BehaviorSubject.seeded(Car());
  }

  factory CarRegistrationController() => _getInstance();

  static CarRegistrationController _getInstance() {
    if (_instance == null) {
      _instance = CarRegistrationController._();
    }
    return _instance;
  }

  /// USER STREAM METHODS
  Stream<Car> getCarEvents() => _carStream.stream;

  Car getCarValue() => _carStream.value;

  void updateCar(Car data) => _carStream.add(data);
}