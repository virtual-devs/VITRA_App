class Login {
  List<ResultsLogin>? response;

  Login.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      response = <ResultsLogin>[];
      for (var value in json) {
        response!.add(ResultsLogin.fromJson(value));
      }
    }
  }
}

class ResultsLogin {
  String? id;
  String? username;
  String? email;
  String? password;
  String? rol;
  String? token;

  ResultsLogin({
    this.id,
    this.username,
    this.email,
    this.password,
    this.rol,
    this.token,
  });

  ResultsLogin.fromJson(Map<String, dynamic> item) {
    id = item['id'].toString();
    username = item['username'];
    email = item['email'];
    password = item['password'].toString();
    rol = item['rol'];
    token = item['token'];
  }
}
