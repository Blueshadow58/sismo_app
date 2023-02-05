import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sismo_app/Earthquake/model/earthquake_model.dart';
import 'package:sismo_app/Earthquake/resources/earthquake_api_repository.dart';

part 'earthquake_event.dart';
part 'earthquake_state.dart';

class EarthquakeBloc extends Bloc<EarthquakeEvent, EarthquakeState> {
  EarthquakeBloc() : super(EarthquakeInitial()) {
    final EarthquakeApiRepository earthquakeApiRepository =
        EarthquakeApiRepository();

    on<GetEarthquakeList>((event, emit) async {
      try {
        emit(EarthquakeLoading());
        final mList = await earthquakeApiRepository.fetchEarthquakeList();
        emit(EarthquakeLoaded(mList));
        if (mList.error != null) {
          emit(EarthquakeError(mList.error));
        }
      } on NetworkError {
        emit(const EarthquakeError(
            "No se puede obtener la información, su dispositivo cuenta con conexión a internet?"));
      }
    });
  }
}
