/// status : "success"
/// message : null
/// data : {"id":0,"tripName":"Cairo Trip","userId":0,"startDate":"2026-07-06T00:00:00+03:00","endDate":"2026-07-07T00:00:00+03:00","totalBudget":10.0,"actualSpent":0,"travelersCount":2,"status":"Planned","notes":"AI-generated: Coptic in Cairo (budget: 400 EGP)","durationDays":2,"budgetRemaining":0,"tripPlaces":[{"id":0,"place":{"id":24,"name":"Ben Ezra Synagogue","visitingTime":"From 9:00am to 4:00pm","price":0.00,"city":"Cairo","category":"Coptic","rating":null,"historicalBackGround":"One of Egypt's oldest synagogues, located in Coptic Cairo, with a rich history and beautiful interiors.","latitude":30.007,"longitude":31.2295,"mainImageUrl":"/images/places/24.webp","galleryImages":[],"isFavorite":false},"visitDate":"2026-07-06T00:00:00+03:00","visitOrder":1,"startTime":"09:00:00","endTime":"10:30:00","estimatedCost":0.00,"notes":"Day 1","isCompleted":false},{"id":0,"place":{"id":32,"name":"Abu Serga Church","visitingTime":"From 9:00am to 4:00pm","price":0.00,"city":"Cairo","category":"Coptic","rating":null,"historicalBackGround":"A historic Coptic church built over a cave where the Holy Family stayed, featuring beautiful stonework and iconography.","latitude":30.006,"longitude":31.229,"mainImageUrl":"/images/places/32.webp","galleryImages":[],"isFavorite":false},"visitDate":"2026-07-06T00:00:00+03:00","visitOrder":2,"startTime":"11:30:00","endTime":"13:00:00","estimatedCost":0.00,"notes":"Day 1","isCompleted":false},{"id":0,"place":{"id":31,"name":"The Hanging Church","visitingTime":"From 9:00am to 4:00pm","price":0.00,"city":"Cairo","category":"Coptic","rating":null,"historicalBackGround":"One of Egypt's oldest Coptic churches, built above the Babylon Fortress gate, featuring beautiful icons and a wooden roof.","latitude":30.0055,"longitude":31.2295,"mainImageUrl":"/images/places/31.webp","galleryImages":[],"isFavorite":false},"visitDate":"2026-07-06T00:00:00+03:00","visitOrder":3,"startTime":"14:00:00","endTime":"15:30:00","estimatedCost":0.00,"notes":"Day 1","isCompleted":false},{"id":0,"place":{"id":30,"name":"Mary Tree","visitingTime":"From 9:00am to 5:00pm","price":5.00,"city":"Cairo","category":"Coptic","rating":null,"historicalBackGround":"A sacred sycamore tree in El-Matariya where the Holy Family rested during their flight into Egypt.","latitude":30.009,"longitude":31.228,"mainImageUrl":"/images/places/30.jpeg","galleryImages":[],"isFavorite":false},"visitDate":"2026-07-07T00:00:00+03:00","visitOrder":1,"startTime":"09:00:00","endTime":"10:30:00","estimatedCost":10.00,"notes":"Day 2","isCompleted":false}],"placesCount":4}

class GenerateItineraryResponse {
  GenerateItineraryResponse({
      this.status, 
      this.message, 
      this.data,});

  GenerateItineraryResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  dynamic message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 0
/// tripName : "Cairo Trip"
/// userId : 0
/// startDate : "2026-07-06T00:00:00+03:00"
/// endDate : "2026-07-07T00:00:00+03:00"
/// totalBudget : 10.0
/// actualSpent : 0
/// travelersCount : 2
/// status : "Planned"
/// notes : "AI-generated: Coptic in Cairo (budget: 400 EGP)"
/// durationDays : 2
/// budgetRemaining : 0
/// tripPlaces : [{"id":0,"place":{"id":24,"name":"Ben Ezra Synagogue","visitingTime":"From 9:00am to 4:00pm","price":0.00,"city":"Cairo","category":"Coptic","rating":null,"historicalBackGround":"One of Egypt's oldest synagogues, located in Coptic Cairo, with a rich history and beautiful interiors.","latitude":30.007,"longitude":31.2295,"mainImageUrl":"/images/places/24.webp","galleryImages":[],"isFavorite":false},"visitDate":"2026-07-06T00:00:00+03:00","visitOrder":1,"startTime":"09:00:00","endTime":"10:30:00","estimatedCost":0.00,"notes":"Day 1","isCompleted":false},{"id":0,"place":{"id":32,"name":"Abu Serga Church","visitingTime":"From 9:00am to 4:00pm","price":0.00,"city":"Cairo","category":"Coptic","rating":null,"historicalBackGround":"A historic Coptic church built over a cave where the Holy Family stayed, featuring beautiful stonework and iconography.","latitude":30.006,"longitude":31.229,"mainImageUrl":"/images/places/32.webp","galleryImages":[],"isFavorite":false},"visitDate":"2026-07-06T00:00:00+03:00","visitOrder":2,"startTime":"11:30:00","endTime":"13:00:00","estimatedCost":0.00,"notes":"Day 1","isCompleted":false},{"id":0,"place":{"id":31,"name":"The Hanging Church","visitingTime":"From 9:00am to 4:00pm","price":0.00,"city":"Cairo","category":"Coptic","rating":null,"historicalBackGround":"One of Egypt's oldest Coptic churches, built above the Babylon Fortress gate, featuring beautiful icons and a wooden roof.","latitude":30.0055,"longitude":31.2295,"mainImageUrl":"/images/places/31.webp","galleryImages":[],"isFavorite":false},"visitDate":"2026-07-06T00:00:00+03:00","visitOrder":3,"startTime":"14:00:00","endTime":"15:30:00","estimatedCost":0.00,"notes":"Day 1","isCompleted":false},{"id":0,"place":{"id":30,"name":"Mary Tree","visitingTime":"From 9:00am to 5:00pm","price":5.00,"city":"Cairo","category":"Coptic","rating":null,"historicalBackGround":"A sacred sycamore tree in El-Matariya where the Holy Family rested during their flight into Egypt.","latitude":30.009,"longitude":31.228,"mainImageUrl":"/images/places/30.jpeg","galleryImages":[],"isFavorite":false},"visitDate":"2026-07-07T00:00:00+03:00","visitOrder":1,"startTime":"09:00:00","endTime":"10:30:00","estimatedCost":10.00,"notes":"Day 2","isCompleted":false}]
/// placesCount : 4

class Data {
  Data({
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
      this.tripPlaces, 
      this.placesCount,});

  Data.fromJson(dynamic json) {
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
    placesCount = json['placesCount'];
  }
  int? id;
  String? tripName;
  int? userId;
  String? startDate;
  String? endDate;
  double? totalBudget;
  int? actualSpent;
  int? travelersCount;
  String? status;
  String? notes;
  int? durationDays;
  int? budgetRemaining;
  List<TripPlaces>? tripPlaces;
  int? placesCount;

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
    map['placesCount'] = placesCount;
    return map;
  }

}

/// id : 0
/// place : {"id":24,"name":"Ben Ezra Synagogue","visitingTime":"From 9:00am to 4:00pm","price":0.00,"city":"Cairo","category":"Coptic","rating":null,"historicalBackGround":"One of Egypt's oldest synagogues, located in Coptic Cairo, with a rich history and beautiful interiors.","latitude":30.007,"longitude":31.2295,"mainImageUrl":"/images/places/24.webp","galleryImages":[],"isFavorite":false}
/// visitDate : "2026-07-06T00:00:00+03:00"
/// visitOrder : 1
/// startTime : "09:00:00"
/// endTime : "10:30:00"
/// estimatedCost : 0.00
/// notes : "Day 1"
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

/// id : 24
/// name : "Ben Ezra Synagogue"
/// visitingTime : "From 9:00am to 4:00pm"
/// price : 0.00
/// city : "Cairo"
/// category : "Coptic"
/// rating : null
/// historicalBackGround : "One of Egypt's oldest synagogues, located in Coptic Cairo, with a rich history and beautiful interiors."
/// latitude : 30.007
/// longitude : 31.2295
/// mainImageUrl : "/images/places/24.webp"
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
      this.historicalBackGround, 
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
    historicalBackGround = json['historicalBackGround'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    mainImageUrl = json['mainImageUrl'];
    if (json['galleryImages'] != null) {
      galleryImages = List<dynamic>.from(json['galleryImages']);
    }
    isFavorite = json['isFavorite'];
  }
  int? id;
  String? name;
  String? visitingTime;
  double? price;
  String? city;
  String? category;
  dynamic rating;
  String? historicalBackGround;
  double? latitude;
  double? longitude;
  String? mainImageUrl;
  List<dynamic>? galleryImages;
  bool? isFavorite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['visitingTime'] = visitingTime;
    map['price'] = price;
    map['city'] = city;
    map['category'] = category;
    map['rating'] = rating;
    map['historicalBackGround'] = historicalBackGround;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['mainImageUrl'] = mainImageUrl;

      map['galleryImages'] = galleryImages;

    map['isFavorite'] = isFavorite;
    return map;
  }

}