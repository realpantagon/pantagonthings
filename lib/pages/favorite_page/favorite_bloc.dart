// favorite_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pantagonthings/repository/airtable_repository.dart';
import 'package:pantagonthings/response/airtable_record_response.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AirtableService airtableService;

  FavoriteBloc(this.airtableService) : super(FavoriteInitial()) {
    on<FetchFavoriteData>(_onFetchFavoriteData);
  }

  void _onFetchFavoriteData(
      FetchFavoriteData event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final records = await airtableService.fetchFavoriteRecords();
      final totalCount = records.length;
      final totalNet = records.fold(0.0, (sum, record) => sum + record.total);
      emit(FavoriteLoaded(records, totalCount, totalNet));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
