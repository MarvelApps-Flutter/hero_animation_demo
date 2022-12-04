class Data {
  List<PlaceModel>? place;

  Data({this.place});

  Data.fromJson(Map<String, dynamic> json) {
    if (json[''] != null) {
      place = <PlaceModel>[];
      json[''].forEach((v) {
        place!.add(PlaceModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (place != null) {
      data['hhh'] = place!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlaceModel {
  String? name;
  String? nearestMetro;
  String? entryFeeIndian;
  String? entryFeeNonIndian;
  String? timings;
  String? closedOnDays;
  String? image;
  String? address;
  String? description;

  PlaceModel(
      {this.name,
      this.nearestMetro,
      this.entryFeeIndian,
      this.entryFeeNonIndian,
      this.timings,
      this.closedOnDays,
      this.image,
      this.address,
      this.description});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nearestMetro = json['nearestMetro'];
    entryFeeIndian = json['entryFeeIndian'];
    entryFeeNonIndian = json['entryFeeNonIndian'];
    timings = json['timings'];
    closedOnDays = json['closedOnDays'];
    image = json['image'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['nearestMetro'] = nearestMetro;
    data['entryFeeIndian'] = entryFeeIndian;
    data['entryFeeNonIndian'] = entryFeeNonIndian;
    data['timings'] = timings;
    data['closedOnDays'] = closedOnDays;
    data['image'] = image;
    data['address'] = address;
    data['description'] = description;
    return data;
  }
}
