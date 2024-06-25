// airtable_state.dart
import 'package:equatable/equatable.dart';
import 'package:pantagonthings/response/airtable_record_response.dart';

abstract class AirtableState extends Equatable {
  @override
  List<Object> get props => [];
}

class AirtableInitial extends AirtableState {}

class AirtableLoading extends AirtableState {}

class AirtableLoaded extends AirtableState {
  final List<AirtableRecord> records;
  final int totalCount;
  final double totalNet;

  AirtableLoaded(this.records, this.totalCount, this.totalNet);

  @override
  List<Object> get props => [records, totalCount, totalNet];
}

class AirtableError extends AirtableState {
  final String message;

  AirtableError(this.message);

  @override
  List<Object> get props => [message];
}
