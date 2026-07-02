/// id : 3
/// name : "Madrasa of Sultan Hassan & Al-Rifa'i Mosque"
/// visitingTime : "From 9:00am to 5:00pm"
/// price : 0.00
/// city : "Cairo"
/// category : "Islamic Monuments"
/// rating : 4.56
/// historicalBackGround : "A historic Madrasa and mosque complex, housing the Sultan Hassan Madrasa and the Al-Rifa'i Mosque, known for their beautiful architecture and historical significance."
/// latitude : 30.0322
/// longitude : 31.2575
/// mainImageUrl : "https://implant-liberty-transfer.ngrok-free.dev/images/places/3.jpg"
/// galleryImages : []
/// isFavorite : false

class TopRatedPlaces {
  TopRatedPlaces({
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

  TopRatedPlaces.fromJson(dynamic json) {
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
    if (galleryImages != null) {
      map['galleryImages'] = galleryImages?.map((v) => v.toJson()).toList();
    }
    map['isFavorite'] = isFavorite;
    return map;
  }

}