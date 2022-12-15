import 'package:riverpod_firestore_steam1/models/user/user.dart';

class SessionUser {
  final User? _user;
  final String? _jwtToken;
  final bool? _isLogin;


  SessionUser(this._user, this._jwtToken, this._isLogin);

  get user => _user;
  get jwtToken => _jwtToken!;
  get isLogin => _isLogin!;

}
