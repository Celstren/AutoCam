class ServiceHistory {
  int id;
  String licencePlate;
  DateTime receiveDate;
  DateTime shipDate;
  String status;
  String description;

  ServiceHistory({
    this.id,
    this.licencePlate = "",
    this.receiveDate,
    this.shipDate,
    this.status = "",
    this.description = "",
  });
}