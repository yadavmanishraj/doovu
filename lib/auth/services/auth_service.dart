// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppWriteAuthService {
  final Account _account;
  AppWriteAuthService(Client client) : _account = Account(client) {
    init();
  }

  late User _user;

  User get user => _user;

  init() async {
    _user = await _account.get();
  }

  Future<User?> get initialUser async {
    try {
      return await _account.get();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<User> registerWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    _user = await _account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    await _account.createEmailSession(email: email, password: password);
    return _user;
  }

  Future registerWithGoogle() async {
    var user = await _account.createOAuth2Session(
        provider: 'google', success: "", failure: "");
  }

  Future<User> loginWithEmailPassword(
      {required String email, required String password}) async {
    await _account.createEmailSession(email: email, password: password);
    _user = await _account.get();
    return _user;
  }
}
