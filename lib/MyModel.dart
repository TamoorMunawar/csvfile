class Lead {
  final int leadId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? eventName;
  final String? jobTitle;
  final String? company;
  final String? profile;
  final String? sectorName;
  final String? jobFunctionName;
  final String? notes;

  Lead({
    required this.leadId,
    this.firstName,
    this.lastName,
    this.email,
    this.eventName,
    this.jobTitle,
    this.company,
    this.profile,
    this.sectorName,
    this.jobFunctionName,
    this.notes,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
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
