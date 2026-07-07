/// pageIndex : 1
/// pageSize : 6
/// totalCount : 6
/// data : [{"id":2,"name":"AI-Mu'izz Street","visitingTime":"From 9:00am to 5:00pm","price":20.00,"city":"Cairo","category":"Islamic Monuments","rating":1.20,"historicalBackGround":"One of Cairo's oldest streets, featuring stunning Mamluk and Fatimid architecture with historic mosques and sabil-kuttabs.","latitude":30.0496,"longitude":31.2604,"mainImageUrl":"https://implant-liberty-transfer.ngrok-free.dev/images/places/2.jpg","galleryImages":[],"isFavorite":false},{"id":3,"name":"Madrasa of Sultan Hassan & Al-Rifa'i Mosque","visitingTime":"From 9:00am to 5:00pm","price":0.00,"city":"Cairo","category":"Islamic Monuments","rating":4.56,"historicalBackGround":"A historic Madrasa and mosque complex, housing the Sultan Hassan Madrasa and the Al-Rifa'i Mosque, known for their beautiful architecture and historical significance.","latitude":30.0322,"longitude":31.2575,"mainImageUrl":"https://implant-liberty-transfer.ngrok-free.dev/images/places/3.jpg","galleryImages":[],"isFavorite":false},{"id":4,"name":"Bayt al-Suhaymi","visitingTime":"From 9:00am to 5:00pm","price":10.00,"city":"Cairo","category":"Islamic Monuments","rating":3.40,"historicalBackGround":"A beautifully preserved 17th-century Islamic house with mashrabiya screens, stained glass, and serene courtyards showcasing Ottoman-era Cairo.","latitude":30.0521,"longitude":31.2626,"mainImageUrl":"https://implant-liberty-transfer.ngrok-free.dev/images/places/4.webp","galleryImages":[],"isFavorite":false},{"id":5,"name":"Salah al-Din al-Ayyubi Citadel","visitingTime":"From 8:00am to 5:00pm","price":60.00,"city":"Cairo","category":"Islamic Monuments","rating":2.30,"historicalBackGround":"A massive medieval fortress built by Saladin, housing the iconic Muhammad Ali Mosque and offering panoramic views of Cairo.","latitude":30.029,"longitude":31.261,"mainImageUrl":"https://implant-liberty-transfer.ngrok-free.dev/images/places/5.jpg","galleryImages":[],"isFavorite":false},{"id":6,"name":"Baron Empain Palace","visitingTime":"From 9:00am to 6:00pm","price":60.00,"city":"Cairo","category":"Historical Palaces","rating":3.70,"historicalBackGround":"A unique architectural masterpiece in Heliopolis inspired by Hindu and Cambodian temples, featuring exotic carvings and stained glass.","latitude":30.0883,"longitude":31.3276,"mainImageUrl":"https://implant-liberty-transfer.ngrok-free.dev/images/places/6.webp","galleryImages":[],"isFavorite":false},{"id":7,"name":"Panorama of the Roof","visitingTime":"From 9:00am to 5:00pm","price":30.00,"city":"Cairo","category":"Islamic Monuments","rating":4.10,"historicalBackGround":"A stunning panoramic view of Cairo's rooftops and minarets, offering a breathtaking perspective of the city's skyline.","latitude":30.044,"longitude":31.258,"mainImageUrl":"https://implant-liberty-transfer.ngrok-free.dev/images/places/7.jpg","galleryImages":[],"isFavorite":false}]

class ExplorResponse {
  ExplorResponse({
      this.pageIndex, 
      this.pageSize, 
      this.totalCount, 
      this.data,});

  ExplorResponse.fromJson(dynamic json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? pageIndex;
  int? pageSize;
  int? totalCount;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageIndex'] = pageIndex;
    map['pageSize'] = pageSize;
    map['totalCount'] = totalCount;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// name : "AI-Mu'izz Street"
/// visitingTime : "From 9:00am to 5:00pm"
/// price : 20.00
/// city : "Cairo"
/// category : "Islamic Monuments"
/// rating : 1.20
/// historicalBackGround : "One of Cairo's oldest streets, featuring stunning Mamluk and Fatimid architecture with historic mosques and sabil-kuttabs."
/// latitude : 30.0496
/// longitude : 31.2604
/// mainImageUrl : "https://implant-liberty-transfer.ngrok-free.dev/images/places/2.jpg"
/// galleryImages : []
/// isFavorite : false

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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