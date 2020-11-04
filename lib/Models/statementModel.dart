class StatementFields {
  static const String id = "\$id";
  static const String partA_name = "parta_name";
  static const String partA_license = "parta_license_number";
  static const String partA_phone = "parta_phone_number";
  static const String partA_plate = "parta_car_plate";
  static const String date = "Date";
  static const String partb_name = "Partb_name";
  static const String partB_phone = "partb_phone_number";
  static const String partB_license = "partb_license_number";
  static const String partB_plate = "partb_car_plate";
  static const String status = "accident_status";
  static const String city = "city";
  static const String locality = "locality";
  static const String firstStreet = "first_street";
  static const String secondStreet = "second_street";
}

class Statement {
  String id;
  String partAname;
  String partAlicense;
  String partAphone;
  String partAplate;
  String date;
  String partBname;
  String partBlicense;
  String partBphone;
  String partBplate;
  String status;
  String city;
  String locality;
  String firstStreet;
  String secondStreet;
  Statement(
      {this.id,
      this.partAname,
      this.partAlicense,
      this.partAphone,
      this.partAplate,
      this.date,
      this.partBname,
      this.partBlicense,
      this.partBphone,
      this.partBplate,
      this.status,
      this.city,
      this.locality,
      this.firstStreet,
      this.secondStreet});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[StatementFields.id] = this.id;
    data[StatementFields.partA_name] = this.partAname;
    data[StatementFields.partA_license] = this.partAlicense;
    data[StatementFields.partA_phone] = this.partAphone;
    data[StatementFields.partA_plate] = this.partAplate;
    data[StatementFields.date] = this.date;
    data[StatementFields.partb_name] = this.partBname;
    data[StatementFields.partB_license] = this.partBlicense;
    data[StatementFields.partB_phone] = this.partBphone;
    data[StatementFields.partB_plate] = this.partBplate;
    data[StatementFields.status] = this.status;
    data[StatementFields.city] = this.city;
    data[StatementFields.locality] = this.locality;
    data[StatementFields.firstStreet] = this.firstStreet;
    data[StatementFields.secondStreet] = this.secondStreet;

    return data;
  }
}
