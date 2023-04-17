class MyModel {
  int leadId;
  String firstName;
  String lastName;
  String email;
  String eventName;
  String jobTitle;
  String company;
  String profile;
  String sectorName;
  String jobFunctionName;
  String notes;

  MyModel({
    required this.leadId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.eventName,
    required this.jobTitle,
    required this.company,
    required this.profile,
    required this.sectorName,
    required this.jobFunctionName,
    required this.notes,
  });

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      leadId: json['leadId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      eventName: json['eventName'],
      jobTitle: json['jobTitle'],
      company: json['company'],
      profile: json['profile'],
      sectorName: json['sectorName'],
      jobFunctionName: json['jobFunctionName'],
      notes: json['notes'],
    );
  }
}
