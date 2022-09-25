import 'package:man_shop_app/data/models/search/search_model.dart';
import 'package:man_shop_app/data/web_service/search/search_web_service.dart';

class SearchRepository{
  SearchRepository(this.searchWebService);
  SearchWebService searchWebService;

  Future<SearchModel> getSearchData(String searchText) async {
    final data = await searchWebService.getSearchData(searchText);
    return SearchModel.fromJson(data as Map<String, dynamic>);
  }
}