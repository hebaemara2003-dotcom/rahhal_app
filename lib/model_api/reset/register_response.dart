/// status : "success"
/// data : {"displayName":"heba123","email":"hebaemara2003@gmail.com","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiaGViYTEyMyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6ImhlYmFlbWFyYTIwMDNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI5IiwiZXhwIjoxNzg1MzQ4Mjk1LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MDIyLyIsImF1ZCI6IlRyYXZlbEFwcFVzZXJzIn0.HvXM-rLoyigayaVzzHG3jbZYpYM0QlUku5TNCnywikI"}

class ResetResponse {
  ResetResponse({
      this.status, 
      this.data,});

  ResetResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// displayName : "heba123"
/// email : "hebaemara2003@gmail.com"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiaGViYTEyMyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6ImhlYmFlbWFyYTIwMDNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI5IiwiZXhwIjoxNzg1MzQ4Mjk1LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MDIyLyIsImF1ZCI6IlRyYXZlbEFwcFVzZXJzIn0.HvXM-rLoyigayaVzzHG3jbZYpYM0QlUku5TNCnywikI"

class Data {
  Data({
      this.displayName, 
      this.email, 
      this.token,});

  Data.fromJson(dynamic json) {
    displayName = json['displayName'];
    email = json['email'];
    token = json['token'];
  }
  String? displayName;
  String? email;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['displayName'] = displayName;
    map['email'] = email;
    map['token'] = token;
    return map;
  }

}