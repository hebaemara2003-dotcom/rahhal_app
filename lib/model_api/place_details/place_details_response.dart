/// id : 4
/// name : "بيت السحيمي"
/// visitingTime : "من الساعة 9:00 صباحًا إلى الساعة 5:00 مساءً"
/// price : 10.00
/// city : "القاهرة"
/// category : "آثار إسلامية"
/// rating : 3.40
/// historicalBackGround : "منزل إسلامي من القرن السابع عشر تم الحفاظ عليه بشكل جميل مع شاشات مشربية وزجاج ملون وأفنية هادئة تعرض القاهرة في العصر العثماني."
/// latitude : 30.0521
/// longitude : 31.2626
/// mainImageUrl : "https://implant-liberty-transfer.ngrok-free.dev/images/places/4.webp"
/// galleryImages : []
/// isFavorite : false

class PlaceDetailsResponse {
  PlaceDetailsResponse({
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

  PlaceDetailsResponse.fromJson(dynamic json) {
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
    galleryImages = List<dynamic>.from(json['galleryImages'] ?? []);
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
    map['galleryImages'] = galleryImages;
    map['isFavorite'] = isFavorite;
    return map;
  }

}