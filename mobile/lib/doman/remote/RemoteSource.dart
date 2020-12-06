import 'package:dmp/api/ResponseHandler.dart';
import 'package:dmp/api/ServerError.dart';
import 'package:dmp/model/BannerResponse.dart';
import 'package:dmp/model/CategoryResponse.dart';
import 'package:dmp/model/NewsResponse.dart';
import 'package:dmp/model/ProductDetailResponse.dart';
import 'package:dmp/model/ProductResponse.dart';
import '../../main.dart';

class RemoteSource{
  Future<ResponseHandler<BannerResponse>> fetchBanners() async {
    BannerResponse response;
    try {
      response = await getApiClient().getBanners('app-home-slider', true);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }
  Future<ResponseHandler<NewsResponse>> fetchNews() async {
    NewsResponse response;
    try {
      response = await getApiClient().getNews(10, 1, 'ru');
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

 Future<ResponseHandler<ProductResponse>> fetchSearch(String query, String lang) async {
    ProductResponse response;
    try {
      response = await getApiClient(baseUrl: 'https://migration.track.uz/v1').getProductsBySearch(query);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

 Future<ResponseHandler<ProductResponse>> fetchByCategory(String categoryId) async {
    ProductResponse response;
    try {
      response = await getApiClient(baseUrl: 'https://migration.track.uz/v1').getProductsByCategoryId(categoryId);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }


 Future<ResponseHandler<ProductResponse>> fetchByHome() async {
    ProductResponse response;
    try {
      response = await getApiClient(baseUrl: 'https://migration.track.uz/v1').getProductsByHome();
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

 Future<ResponseHandler<ProductDetailResponse>> fetchProductDetail(String productId) async {
    ProductDetailResponse response;
    try {
      response = await getApiClient(baseUrl: 'https://migration.track.uz/v1').getProductDetails(productId);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

 Future<ResponseHandler<CategoryResponse>> fetchCategories(String lang) async {
    CategoryResponse response;
    try {
      response = await getApiClient(baseUrl: 'https://migration.track.uz/v1').getCategories();
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

}