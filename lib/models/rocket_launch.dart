import 'package:intl/intl.dart';

class RocketLaunch {
  final String name;
  final String? imageUrl;
  final int flightNumber;
  final String date;
  final String rocketId;

  RocketLaunch({
    required this.name,
    required this.imageUrl,
    required this.flightNumber,
    required this.date,
    required this.rocketId,
  });

  factory RocketLaunch.fromJson(Map<String, dynamic> json) {
    final dateFormatter = DateFormat('d. M. yyyy H:mm');
    final dateUtc = DateTime.parse(json['date_utc']);
    final formattedDate = dateFormatter.format(dateUtc);

    return RocketLaunch(
      name: json['name'],
      imageUrl: json['links']['patch']['large'],
      flightNumber: json['flight_number'],
      date: formattedDate,
      rocketId: json['rocket'],
    );
  }
}
