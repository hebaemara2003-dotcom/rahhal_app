class PlaceModel {
  final int id;
  final String name;
  final String city;
  final double price;
  final String mainImageUrl;

  PlaceModel({
    required this.id,
    required this.name,
    required this.city,
    required this.price,
    required this.mainImageUrl,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json["id"],
      name: json["name"],
      city: json["city"],
      price: (json["price"] as num).toDouble(),
      mainImageUrl: json["mainImageUrl"],
    );
  }
}


/////////////////////////////////////////////////////////////
class TripPlaceModel {
  final int visitOrder;
  final double estimatedCost;
  final String startTime;
  final String endTime;
  final PlaceModel place;

  TripPlaceModel({
    required this.visitOrder,
    required this.estimatedCost,
    required this.startTime,
    required this.endTime,
    required this.place,
  });

  factory TripPlaceModel.fromJson(Map<String, dynamic> json) {
    return TripPlaceModel(
      visitOrder: json["visitOrder"],
      estimatedCost: (json["estimatedCost"] as num).toDouble(),
      startTime: json["startTime"],
      endTime: json["endTime"],
      place: PlaceModel.fromJson(json["place"]),
    );
  }
}


//////////////////////////////////////////////////////
class TripModel {
  final String tripName;
  final double totalBudget;
  final int durationDays;
  final int placesCount;
  final List<TripPlaceModel> tripPlaces;

  TripModel({
    required this.tripName,
    required this.totalBudget,
    required this.durationDays,
    required this.placesCount,
    required this.tripPlaces,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      tripName: json["tripName"],
      totalBudget: (json["totalBudget"] as num).toDouble(),
      durationDays: json["durationDays"],
      placesCount: json["placesCount"],
      tripPlaces: (json["tripPlaces"] as List)
          .map((e) => TripPlaceModel.fromJson(e))
          .toList(),
    );
  }
}