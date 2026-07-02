/// id : 36
/// name : "Pyramid of Khufu"
/// visitingTime : "From 7:00am to 5:00pm"
/// price : 100.00
/// city : "Giza"
/// category : "Pharaonic & Ancient Sites"
/// rating : null
/// historicalBackGround : "The Great Pyramid, the largest and oldest of the Giza pyramids, and the only surviving wonder of the ancient world."
/// latitude : 29.9792
/// longitude : 31.1342
/// mainImageUrl : "https://implant-liberty-transfer.ngrok-free.dev/images/places/36.webp"
/// galleryImages : []
/// isFavorite : false

class SearchResponse {
  SearchResponse({
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

  SearchResponse.fromJson(dynamic json) {
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
    if (galleryImages != null) {
      map['galleryImages'] = galleryImages?.map((v) => v.toJson()).toList();
    }
    map['isFavorite'] = isFavorite;
    return map;
  }

}