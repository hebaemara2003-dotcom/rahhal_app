/// id : 4
/// tripName : "Alex Weekend"
/// userId : 2
/// startDate : "2026-10-10T00:00:00"
/// endDate : "2026-10-11T00:00:00"
/// totalBudget : 800.00
/// actualSpent : 0.00
/// travelersCount : 2
/// status : "Planned"
/// notes : "Beach and diving"
/// durationDays : 2
/// budgetRemaining : 800.00
/// tripPlaces : [{"id":0,"place":{"id":2,"name":"شارع المعز","visitingTime":"من الساعة 9:00 صباحًا إلى الساعة 5:00 مساءً","price":20.00,"city":"القاهرة","category":"آثار إسلامية","rating":1.20,"description":"أحد أقدم شوارع القاهرة، ويتميز بالهندسة المعمارية المملوكية والفاطمية المذهلة مع المساجد التاريخية والسبل والكتب.","latitude":30.0496,"longitude":31.2604,"mainImageUrl":"https://localhost:7022//images/places/2.jpg","galleryImages":[],"isFavorite":false},"visitDate":"2027-07-07T00:00:00","visitOrder":1,"startTime":"15:00:00","endTime":"17:00:00","estimatedCost":60.00,"notes":"great","isCompleted":false}]

class TripPopularResponse {
  TripPopularResponse({
      this.id, 
      this.tripName, 
      this.userId, 
      this.startDate, 
      this.endDate, 
      this.totalBudget, 
      this.actualSpent, 
      this.travelersCount, 
      this.status, 
      this.notes, 
      this.durationDays, 
      this.budgetRemaining, 
      this.tripPlaces,});

  TripPopularResponse.fromJson(dynamic json) {
    id = json['id'];
    tripName = json['tripName'];
    userId = json['userId'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    totalBudget = json['totalBudget'];
    actualSpent = json['actualSpent'];
    travelersCount = json['travelersCount'];
    status = json['status'];
    notes = json['notes'];
    durationDays = json['durationDays'];
    budgetRemaining = json['budgetRemaining'];
    if (json['tripPlaces'] != null) {
      tripPlaces = [];
      json['tripPlaces'].forEach((v) {
        tripPlaces?.add(TripPlaces.fromJson(v));
      });
    }
  }
  int? id;
  String? tripName;
  int? userId;
  String? startDate;
  String? endDate;
  double? totalBudget;
  double? actualSpent;
  int? travelersCount;
  String? status;
  String? notes;
  int? durationDays;
  double? budgetRemaining;
  List<TripPlaces>? tripPlaces;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['tripName'] = tripName;
    map['userId'] = userId;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['totalBudget'] = totalBudget;
    map['actualSpent'] = actualSpent;
    map['travelersCount'] = travelersCount;
    map['status'] = status;
    map['notes'] = notes;
    map['durationDays'] = durationDays;
    map['budgetRemaining'] = budgetRemaining;
    if (tripPlaces != null) {
      map['tripPlaces'] = tripPlaces?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 0
/// place : {"id":2,"name":"شارع المعز","visitingTime":"من الساعة 9:00 صباحًا إلى الساعة 5:00 مساءً","price":20.00,"city":"القاهرة","category":"آثار إسلامية","rating":1.20,"description":"أحد أقدم شوارع القاهرة، ويتميز بالهندسة المعمارية المملوكية والفاطمية المذهلة مع المساجد التاريخية والسبل والكتب.","latitude":30.0496,"longitude":31.2604,"mainImageUrl":"https://localhost:7022//images/places/2.jpg","galleryImages":[],"isFavorite":false}
/// visitDate : "2027-07-07T00:00:00"
/// visitOrder : 1
/// startTime : "15:00:00"
/// endTime : "17:00:00"
/// estimatedCost : 60.00
/// notes : "great"
/// isCompleted : false

class TripPlaces {
  TripPlaces({
      this.id, 
      this.place, 
      this.visitDate, 
      this.visitOrder, 
      this.startTime, 
      this.endTime, 
      this.estimatedCost, 
      this.notes, 
      this.isCompleted,});

  TripPlaces.fromJson(dynamic json) {
    id = json['id'];
    place = json['place'] != null ? Place.fromJson(json['place']) : null;
    visitDate = json['visitDate'];
    visitOrder = json['visitOrder'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    estimatedCost = json['estimatedCost'];
    notes = json['notes'];
    isCompleted = json['isCompleted'];
  }
  int? id;
  Place? place;
  String? visitDate;
  int? visitOrder;
  String? startTime;
  String? endTime;
  double? estimatedCost;
  String? notes;
  bool? isCompleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (place != null) {
      map['place'] = place?.toJson();
    }
    map['visitDate'] = visitDate;
    map['visitOrder'] = visitOrder;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['estimatedCost'] = estimatedCost;
    map['notes'] = notes;
    map['isCompleted'] = isCompleted;
    return map;
  }

}

/// id : 2
/// name : "شارع المعز"
/// visitingTime : "من الساعة 9:00 صباحًا إلى الساعة 5:00 مساءً"
/// price : 20.00
/// city : "القاهرة"
/// category : "آثار إسلامية"
/// rating : 1.20
/// description : "أحد أقدم شوارع القاهرة، ويتميز بالهندسة المعمارية المملوكية والفاطمية المذهلة مع المساجد التاريخية والسبل والكتب."
/// latitude : 30.0496
/// longitude : 31.2604
/// mainImageUrl : "https://localhost:7022//images/places/2.jpg"
/// galleryImages : []
/// isFavorite : false

class Place {
  Place({
      this.id, 
      this.name, 
      this.visitingTime, 
      this.price, 
      this.city, 
      this.category, 
      this.rating, 
      this.description, 
      this.latitude, 
      this.longitude, 
      this.mainImageUrl, 
      this.galleryImages, 
      this.isFavorite,});

  Place.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    visitingTime = json['visitingTime'];
    price = json['price'];
    city = json['city'];
    category = json['category'];
    rating = json['rating'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    mainImageUrl = json['mainImageUrl'];
    if (json['galleryImages'] != null) {
      galleryImages = [];
      json['galleryImages'].forEach((v) {
        galleryImages?.add(Dynamic.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
  }
  int? id;
  String? name;
  String? visitingTime;
  double? price;
  String? city;
  String? category;
  double? rating;
  String? description;
  double? latitude;
  double? longitude;
  String? mainImageUrl;
  List<dynamic>? galleryImages;
  bool? isFavorite;

  get Dynamic => null;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['visitingTime'] = visitingTime;
    map['price'] = price;
    map['city'] = city;
    map['category'] = category;
    map['rating'] = rating;
    map['description'] = description;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['mainImageUrl'] = mainImageUrl;
    if (galleryImages != null) {
      map['galleryImages'] = galleryImages?.map((v) => v.toJson()).toList();
    }
    map['isFavorite'] = isFavorite;
    return map;
  }

}