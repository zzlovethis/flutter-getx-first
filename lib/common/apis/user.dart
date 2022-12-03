import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
import 'package:flutter_ducafecat_news_getx/common/utils/utils.dart';

///网络一层---具体数据一层---
///在数据API中，将网络和数据模型结合在一起。
/// 用户
class UserAPI {
  /// 登录
  static Future<UserLoginResponseEntity> login({
    UserLoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      '/user/login',
      data: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  /// 注册
  static Future<UserRegisterRequestEntity> register({
    UserRegisterRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      '/user/register',
      data: params?.toJson(),
    );
    return UserRegisterRequestEntity.fromJson(response);
  }

  /// Profile
  static Future<UserLoginResponseEntity> profile() async {
    var response = await HttpUtil().post(
      '/user/profile',
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  /// Logout
  static Future logout() async {
    return await HttpUtil().post(
      '/user/logout',
    );
  }
}
