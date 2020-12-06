import 'package:dmp/doman/remote/RemoteSource.dart';
import 'package:translator/translator.dart';

class Controller{
  final translator = GoogleTranslator();
  final _remoteSource = RemoteSource();

  Future<dynamic> getBanners() async {
    final response = await _remoteSource.fetchBanners();
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          errorMessage = 'connection_timeout';
          break;
        case "Something wrong":
          errorMessage = 'something_wrong';
          break;
        default:
          try {
            final languageCode = 'en';
            await translator
                .translate(response.getException().getErrorMessage(),
                from: 'en', to: languageCode)
                .then((value) =>
            errorMessage = "${'server_error'} ${value.text}");
          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }
  Future<dynamic> getNews() async {
    final response = await _remoteSource.fetchNews();
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          errorMessage = 'connection_timeout';
          break;
        case "Something wrong":
          errorMessage = 'something_wrong';
          break;
        default:
          try {
            final languageCode = 'en';
            await translator
                .translate(response.getException().getErrorMessage(),
                from: 'en', to: languageCode)
                .then((value) =>
            errorMessage = "${'server_error'} ${value.text}");
          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }

  Future<dynamic> getSearchProduct(String query, String lang) async {
    final response = await _remoteSource.fetchSearch(query, lang);
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          errorMessage = 'connection_timeout';
          break;
        case "Something wrong":
          errorMessage = 'something_wrong';
          break;
        default:
          try {
            final languageCode = 'en';
            await translator
                .translate(response.getException().getErrorMessage(),
                from: 'en', to: languageCode)
                .then((value) =>
            errorMessage = "${'server_error'} ${value.text}");
          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }

  Future<dynamic> getProductByCategory(String category) async {
    final response = await _remoteSource.fetchByCategory(category);
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          errorMessage = 'connection_timeout';
          break;
        case "Something wrong":
          errorMessage = 'something_wrong';
          break;
        default:
          try {
            final languageCode = 'en';
            await translator
                .translate(response.getException().getErrorMessage(),
                from: 'en', to: languageCode)
                .then((value) =>
            errorMessage = "${'server_error'} ${value.text}");
          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }

  Future<dynamic> getProduct(String id) async {
    final response = await _remoteSource.fetchProductDetail(id);
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          errorMessage = 'connection_timeout';
          break;
        case "Something wrong":
          errorMessage = 'something_wrong';
          break;
        default:
          try {
            final languageCode = 'en';
            await translator
                .translate(response.getException().getErrorMessage(),
                from: 'en', to: languageCode)
                .then((value) =>
            errorMessage = "${'server_error'} ${value.text}");
          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }

  Future<dynamic> getCategories() async {
    final response = await _remoteSource.fetchCategories('ru');
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          errorMessage = 'connection_timeout';
          break;
        case "Something wrong":
          errorMessage = 'something_wrong';
          break;
        default:
          try {
            final languageCode = 'en';
            await translator
                .translate(response.getException().getErrorMessage(),
                from: 'en', to: languageCode)
                .then((value) =>
            errorMessage = "${'server_error'} ${value.text}");
          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }

  Future<dynamic> getHomeData() async {
    final response = await _remoteSource.fetchByHome();
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          errorMessage = 'connection_timeout';
          break;
        case "Something wrong":
          errorMessage = 'something_wrong';
          break;
        default:
          try {
            final languageCode = 'en';
            await translator
                .translate(response.getException().getErrorMessage(),
                from: 'en', to: languageCode)
                .then((value) =>
            errorMessage = "${'server_error'} ${value.text}");
          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }

}
