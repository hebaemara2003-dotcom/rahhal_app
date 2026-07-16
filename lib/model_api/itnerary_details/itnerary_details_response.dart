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
/// tripPlaces : [{"id":0,"place":{"id":50,"name":"قلعة قايتباي","visitingTime":"من الساعة 9:00 صباحًا إلى الساعة 7:00 مساءً","price":60.00,"city":"الإسكندرية","category":"آثار إسلامية","rating":null,"historicalBackGround":"قلعة مهيبة على ساحل البحر الأبيض المتوسط ​​بالإسكندرية، تم بناؤها في موقع منارة الإسكندرية القديمة.","latitude":31.214,"longitude":29.885,"mainImageUrl":"https://implant-liberty-transfer.ngrok-free.dev/images/places/50.jpg","galleryImages":[],"isFavorite":false},"visitDate":"2027-07-07T00:00:00","visitOrder":1,"startTime":"15:00:00","endTime":"17:00:00","estimatedCost":60.00,"notes":"great","isCompleted":false}]
/// placesCount : 1

class ItneraryDetailsResponse {
  ItneraryDetailsResponse({
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

  ItneraryDetailsResponse.fromJson(dynamic json) {
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
  double? actualSpent;
  int? travelersCount;
  String? status;
  String? notes;
  int? durationDays;
  double? budgetRemaining;
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
/// place : {"id":50,"name":"قلعة قايتباي","visitingTime":"من الساعة 9:00 صباحًا إلى الساعة 7:00 مساءً","price":60.00,"city":"الإسكندرية","category":"آثار إسلامية","rating":null,"historicalBackGround":"قلعة مهيبة على ساحل البحر الأبيض المتوسط ​​بالإسكندرية، تم بناؤها في موقع منارة الإسكندرية القديمة.","latitude":31.214,"longitude":29.885,"mainImageUrl":"https://implant-liberty-transfer.ngrok-free.dev/images/places/50.jpg","galleryImages":[],"isFavorite":false}
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

/// id : 50
/// name : "قلعة قايتباي"
/// visitingTime : "من الساعة 9:00 صباحًا إلى الساعة 7:00 مساءً"
/// price : 60.00
/// city : "الإسكندرية"
/// category : "آثار إسلامية"
/// rating : null
/// historicalBackGround : "قلعة مهيبة على ساحل البحر الأبيض المتوسط ​​بالإسكندرية، تم بناؤها في موقع منارة الإسكندرية القديمة."
/// latitude : 31.214
/// longitude : 29.885
/// mainImageUrl : "https://implant-liberty-transfer.ngrok-free.dev/images/places/50.jpg"
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
      galleryImages = List<String>.from(json['galleryImages']);
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