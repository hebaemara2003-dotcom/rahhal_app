/// recognizedLandmark : "Ramesseum"
/// placeDetails : {"id":131,"name":"Ramesseum","visitingTime":"From 6:00am to 5:00pm","price":20.00,"city":"Luxor","category":"Pharaonic & Ancient Sites","rating":null,"historicalBackGround":"The magnificent mortuary temple of Ramesses II, featuring the famous fallen colossus and beautiful reliefs.","latitude":25.727,"longitude":32.611,"mainImageUrl":"https://implant-liberty-transfer.ngrok-free.dev/images/places/131.webp","galleryImages":[],"isFavorite":false}
/// confidence : 4.39

class ImageRecognitionResponse {
  ImageRecognitionResponse({
      this.recognizedLandmark, 
      this.placeDetails, 
      this.confidence,});

  ImageRecognitionResponse.fromJson(Map<String, dynamic> json) {
    recognizedLandmark = json['recognizedLandmark'];
    placeDetails = json['placeDetails'] != null ? PlaceDetails.fromJson(json['placeDetails']) : null;
    confidence = json['confidence'];
  }
  String? recognizedLandmark;
  PlaceDetails? placeDetails;
  double? confidence;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['recognizedLandmark'] = recognizedLandmark;
    if (placeDetails != null) {
      map['placeDetails'] = placeDetails?.toJson();
    }
    map['confidence'] = confidence;
    return map;
  }

}

/// id : 131
/// name : "Ramesseum"
/// visitingTime : "From 6:00am to 5:00pm"
/// price : 20.00
/// city : "Luxor"
/// category : "Pharaonic & Ancient Sites"
/// rating : null
/// historicalBackGround : "The magnificent mortuary temple of Ramesses II, featuring the famous fallen colossus and beautiful reliefs."
/// latitude : 25.727
/// longitude : 32.611
/// mainImageUrl : "https://implant-liberty-transfer.ngrok-free.dev/images/places/131.webp"
/// galleryImages : []
/// isFavorite : false

class PlaceDetails {
  PlaceDetails({
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

  PlaceDetails.fromJson(Map<String, dynamic> json) {
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
  List<String>? galleryImages;
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
    if (galleryImages != null) {
      map['galleryImages'] = galleryImages;
    }
    map['isFavorite'] = isFavorite;
    return map;
  }

}