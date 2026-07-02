/// userName : "Enas"
/// email : "Enas@gmail.com"
/// completedTripsCount : 0
/// visitedPlacesCount : 0
/// savedPlacesCount : 1
/// recentTrips : [{"id":1,"tripName":"Cairo in One Day","startDate":"2026-08-08T09:00:00"},{"id":8,"tripName":"My Trip3","startDate":"2026-06-24T00:00:00"},{"id":6,"tripName":"My Trip1","startDate":"2026-06-21T00:00:00"},{"id":7,"tripName":"My Trip2","startDate":"2026-06-21T00:00:00"}]

class ProfileResponse {
  ProfileResponse({
      this.userName, 
      this.email, 
      this.completedTripsCount, 
      this.visitedPlacesCount, 
      this.savedPlacesCount, 
      this.recentTrips,});

  ProfileResponse.fromJson(dynamic json) {
    userName = json['userName'];
    email = json['email'];
    completedTripsCount = json['completedTripsCount'];
    visitedPlacesCount = json['visitedPlacesCount'];
    savedPlacesCount = json['savedPlacesCount'];
    if (json['recentTrips'] != null) {
      recentTrips = [];
      json['recentTrips'].forEach((v) {
        recentTrips?.add(RecentTrips.fromJson(v));
      });
    }
  }
  String? userName;
  String? email;
  int? completedTripsCount;
  int? visitedPlacesCount;
  int? savedPlacesCount;
  List<RecentTrips>? recentTrips;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['email'] = email;
    map['completedTripsCount'] = completedTripsCount;
    map['visitedPlacesCount'] = visitedPlacesCount;
    map['savedPlacesCount'] = savedPlacesCount;
    if (recentTrips != null) {
      map['recentTrips'] = recentTrips?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// tripName : "Cairo in One Day"
/// startDate : "2026-08-08T09:00:00"

class RecentTrips {
  RecentTrips({
      this.id, 
      this.tripName, 
      this.startDate,});

  RecentTrips.fromJson(dynamic json) {
    id = json['id'];
    tripName = json['tripName'];
    startDate = json['startDate'];
  }
  int? id;
  String? tripName;
  String? startDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['tripName'] = tripName;
    map['startDate'] = startDate;
    return map;
  }

}