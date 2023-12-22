// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

enum TransferStatus {
  completed,
  inProgress,
  declined;

  const TransferStatus();
}

class TransferModel {
  final String sentTo;
  final String subject;
  final TransferStatus status;
  final DateTime date;
  const TransferModel({
    required this.subject,
    required this.sentTo,
    required this.status,
    required this.date,
  });

  String getStatus() {
    final statusName = status.name;
    final firstLetter = statusName.substring(0, 1).toUpperCase();
    return firstLetter + statusName.substring(1);
  }

  String getFormattedDate() {
    final format = DateFormat('HH:mm');
    return format.format(date);
  }

  TransferModel copyWith({
    String? sentTo,
    String? subject,
    TransferStatus? status,
    DateTime? date,
  }) {
    return TransferModel(
      sentTo: sentTo ?? this.sentTo,
      subject: subject ?? this.subject,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  @override
  String toString() =>
      'TransferModel(sentTo: $sentTo, status: $status, date: $date)';
}
