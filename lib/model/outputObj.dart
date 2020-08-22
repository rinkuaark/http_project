// class OutputObjMain {
//   final OutputObj

// }

class OutputObj {
  final OutputLogin outputObj;

  OutputObj({this.outputObj});

  factory OutputObj.fromJson(Map<String, dynamic> json) {
    return OutputObj(outputObj: OutputLogin.fromJson(json['outputObj']));
  }
}

class OutputLogin {
  int gid;
  String gtoken;
  String gloc_name;
  int gloc_timeout;
  int gloc_id;

  OutputLogin(
      {this.gid, this.gtoken, this.gloc_name, this.gloc_timeout, this.gloc_id});

  factory OutputLogin.fromJson(Map<String, dynamic> json) {
    return OutputLogin(
      gid: json["gid"],
      gtoken: json["gtoken"],
      gloc_name: json["gloc_name"],
      gloc_timeout: json["gloc_timeout"],
      gloc_id: json["gloc_id"],
    );
  }
}
