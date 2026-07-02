/// displayName : "Enas"
/// email : "Enas@gmail.com"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiRW5hcyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6IkVuYXNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImV4cCI6MTc4NTI3NTA2OSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzAyMi8iLCJhdWQiOiJUcmF2ZWxBcHBVc2VycyJ9.32weTqVCa6FAtFhog3-N-Tg0rdyBI0YqbGo-7ERoLE8"

class AuthResponse {
  AuthResponse({
    this.status,
      this.displayName, 
      this.email, 
      this.token,
    this.statusCode,
    this.errorMessage,
    this.errors,});

  AuthResponse.fromJson(dynamic json) {
    status = json['status'];
    displayName = json['displayName'];
    email = json['email'];
    token = json['token'];
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    errors = json['errors'];

  }
  String? status;
  String? displayName;
  String? email;
  String? token;
  String? statusCode;
  String? errorMessage;
  String? errors;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['displayName'] = displayName;
    map['email'] = email;
    map['token'] = token;
    return map;
  }

}