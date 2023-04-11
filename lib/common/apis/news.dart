import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
import 'package:flutter_ducafecat_news_getx/common/utils/utils.dart';
import 'package:flutter_ducafecat_news_getx/common/values/values.dart';

/// 新闻,这里的API的作用是在上述基础上针对本app进行包装组合，以便进行显示。
class NewsAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<NewsPageListResponseEntity> newsPageList({
    NewsPageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news',
      queryParameters: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY,
    );
    return NewsPageListResponseEntity.fromJson(response);
  }

  /// 推荐
  static Future<NewsItem> newsRecommend({
    NewsRecommendRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news/recommend',
      queryParameters: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return NewsItem.fromJson(response);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> categories({
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/categories',
      cacheDisk: cacheDisk,
    );
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> channels({
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/channels',
      cacheDisk: cacheDisk,
    );
    return response
        .map<ChannelResponseEntity>(
            (item) => ChannelResponseEntity.fromJson(item))
        .toList();
  }

  /// 标签列表
  static Future<List<TagResponseEntity>> tags({
    TagRequestEntity? params,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/tags',
      queryParameters: params?.toJson(),
      cacheDisk: cacheDisk,
    );
    return response
        .map<TagResponseEntity>((item) => TagResponseEntity.fromJson(item))
        .toList();
  }
}
