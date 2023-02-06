class EarthquakeModel {
  int? statusCode;
  String? statusDescription;
  List<Events>? events;
  String? error;

  EarthquakeModel({this.statusCode, this.statusDescription, this.events});

  EarthquakeModel.withError(String errorMessage) {
    error = errorMessage;
  }

  EarthquakeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusDescription = json['status_description'];

    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['status_description'] = statusDescription;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? id;
  String? url;
  String? mapUrl;
  String? localDate;
  String? utcDate;
  double? latitude;
  double? longitude;
  int? depth;
  Magnitude? magnitude;
  String? geoReference;

  Events(
      {this.id,
      this.url,
      this.mapUrl,
      this.localDate,
      this.utcDate,
      this.latitude,
      this.longitude,
      this.depth,
      this.magnitude,
      this.geoReference});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    mapUrl = json['map_url'];
    localDate = json['local_date'];
    utcDate = json['utc_date'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    depth = json['depth'];
    // put an object in the model
    // magnitude = json['magnitude'] != null ? json['id'] : json['url'];
    if (json['magnitude'] != null) {
      // if value is int change to double
      if (json['magnitude']['value'] is int) {
        json['magnitude']['value'] = json['magnitude']['value'].toDouble();
      }
      magnitude = Magnitude.fromJson(json['magnitude']);
    }

    // magnitude = Magnitude.fromJson(json['magnitude']);

    geoReference = json['geo_reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['map_url'] = mapUrl;
    data['local_date'] = localDate;
    data['utc_date'] = utcDate;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['depth'] = depth;
    if (magnitude != null) {
      data['magnitude'] = magnitude;
    }
    data['geo_reference'] = geoReference;
    return data;
  }
}

class Magnitude {
  double? value;
  String? measureUnit;

  Magnitude({this.value, this.measureUnit});

  Magnitude.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    measureUnit = json['measure_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['measure_unit'] = measureUnit;
    return data;
  }
}
