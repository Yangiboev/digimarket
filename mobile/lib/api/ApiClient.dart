import 'package:dmp/model/BannerResponse.dart';
import 'package:dmp/model/BrandResponse.dart';
import 'package:dmp/model/CategoryResponse.dart';
import 'package:dmp/model/NewsResponse.dart';
import 'package:dmp/model/ProductDetailResponse.dart';
import 'package:dmp/model/ProductResponse.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ApiClient.g.dart';

@RestApi(baseUrl: "https://api.goodzone.uz/v1")
abstract class ApiClient {
  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET("/banner")
  Future<BannerResponse> getBanners(
    @Query("position") String position,
    @Query("active") bool active,
  );

  @GET("/category")
  Future<CategoryResponse> getCategories();

  @GET("/product")
  Future<ProductResponse> getProductsBySearch(
      @Query("name") String name);

  @GET("/product")
  Future<ProductResponse> getProductsByCategoryId(
      @Query("category_id") String categoryId);

  @GET("/product")
  Future<ProductResponse> getProductsByHome();

  @GET("/product/{product_id}")
  Future<ProductDetailResponse> getProductDetails(
      @Path("product_id") String productId);

  @GET("/new")
  Future<NewsResponse> getNews(@Query("limit") int limit,
      @Query("page") int page, @Query("lang") String lang);
}
