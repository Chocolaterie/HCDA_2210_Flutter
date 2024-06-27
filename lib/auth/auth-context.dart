class AuthContext {

  String token = "";

  static final AuthContext _instance = AuthContext._internal();
  AuthContext._internal();
  factory AuthContext(){
    return _instance;
  }

  void refreshAuthContext(String newToken){
    token = newToken;
  }

  bool isLogged(){
    return token.isNotEmpty;
  }
}