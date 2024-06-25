// airtable_event.dart
import 'package:equatable/equatable.dart';

abstract class AirtableEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAirtableData extends AirtableEvent {}
