import 'dart:convert';
import '../data_source/users_data_source.dart';
import '../model/user_dto.dart';

class UserRepository {
  final UserDataSource _userDataSource = UserDataSource();

  Future<List<UserModel>> fetchUsers() async {
    final rawData = await _userDataSource.fetchRawUserData();
    final List<dynamic> jsonList = json.decode(rawData);
    return jsonList.map((json) => UserModel.fromJson(json)).toList();
  }
}
