// airtable_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantagonthings/pages/main_page/airtable_event.dart';
import 'package:pantagonthings/pages/main_page/airtable_state.dart';
import 'package:pantagonthings/repository/airtable_repository.dart';
import 'package:pantagonthings/response/airtable_record_response.dart';
import 'airtable_state.dart';

class AirtableBloc extends Bloc<AirtableEvent, AirtableState> {
  final AirtableService airtableService;

  AirtableBloc(this.airtableService) : super(AirtableInitial()) {
    on<FetchAirtableData>(_onFetchAirtableData);
  }

  void _onFetchAirtableData(
      FetchAirtableData event, Emitter<AirtableState> emit) async {
    emit(AirtableLoading());
    try {
      final records = await airtableService.fetchRecords();
      final totalCount = records.length;
      final totalNet = records.fold(0.0, (sum, record) => sum + record.total);
      emit(AirtableLoaded(records, totalCount, totalNet));
    } catch (e) {
      emit(AirtableError(e.toString()));
    }
  }
}
