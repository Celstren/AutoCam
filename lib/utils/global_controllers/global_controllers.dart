import 'package:autocam/models/car/car.dart';
import 'package:autocam/models/user/user.dart';
import 'package:rxdart/rxdart.dart';

class GlobalController {
  static GlobalController _instance;

  BehaviorSubject<User> _userStream;
  BehaviorSubject<Car> _carSelectedStream;

  GlobalController._(){
    this._userStream = new BehaviorSubject.seeded(User());
    this._carSelectedStream = new BehaviorSubject.seeded(Car());
  }

  factory GlobalController() => _getInstance();

  static GlobalController _getInstance() {
    if (_instance == null) {
      _instance = GlobalController._();
    }
    return _instance;
  }

  /// USER STREAM METHODS
  Stream<User> getUserEvents() => _userStream.stream;

  User getUserValue() => _userStream.value;

  void updateUser(User data) => _userStream.add(data);

  /// CAR SELECTED STREAM METHODS
  Stream<Car> getCarSelectedEvents() => _carSelectedStream.stream;

  Car getCarSelectedValue() => _carSelectedStream.value;

  void updateCarSelected(Car data) => _carSelectedStream.add(data);
}