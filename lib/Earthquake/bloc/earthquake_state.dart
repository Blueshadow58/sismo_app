part of 'earthquake_bloc.dart';

abstract class EarthquakeState extends Equatable {
  const EarthquakeState();

  @override
  List<Object> get props => [];
}

class EarthquakeInitial extends EarthquakeState {}

class EarthquakeLoading extends EarthquakeState {}

class EarthquakeLoaded extends EarthquakeState {
  final EarthquakeModel earthquakeModel;
  const EarthquakeLoaded(this.earthquakeModel);
}

class EarthquakeError extends EarthquakeState {
  final String? message;
  const EarthquakeError(this.message);
}
