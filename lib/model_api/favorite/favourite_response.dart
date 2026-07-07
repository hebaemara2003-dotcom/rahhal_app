/// id : 5
/// name : "Salah al-Din al-Ayyubi Citadel"
/// visitingTime : "From 8:00am to 5:00pm"
/// price : 60.00
/// city : "Cairo"
/// category : "Islamic Monuments"
/// rating : 2.30
/// historicalBackGround : "A massive medieval fortress built by Saladin, housing the iconic Muhammad Ali Mosque and offering panoramic views of Cairo."
/// latitude : 30.029
/// longitude : 31.261
/// mainImageUrl : "https://implant-liberty-transfer.ngrok-free.dev/images/places/5.jpg"
/// galleryImages : []
/// isFavorite : true

class FavouriteResponse {
  FavouriteResponse({
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

  FavouriteResponse.fromJson(dynamic json) {
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
      map['galleryImages'] = galleryImages;
    }
    map['isFavorite'] = isFavorite;
    return map;
  }

}