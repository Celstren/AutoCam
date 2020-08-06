class ServiceHistoryFilter {
  String licencePlate;
  DateTime startReceiveDate;
  DateTime endReceiveDate;
  DateTime startShipDate;
  DateTime endShipDate;
  String status;

  ServiceHistoryFilter({
    this.licencePlate = "",
    this.startReceiveDate,
    this.endReceiveDate,
    this.startShipDate,
    this.endShipDate,
    this.status = "",
  });
}