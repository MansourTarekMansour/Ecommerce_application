import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:man_shop_app/data/models/search/search_model.dart';
import 'package:man_shop_app/data/repositories/search/search_repository.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepository) : super(SearchInitialState());

  SearchModel? searchModel;
  late SearchRepository searchRepository;

  Future<void> getSearchData(String searchText) async {
    emit(SearchLoadingState());
    try {
      searchModel = await searchRepository.getSearchData(searchText);
      emit(SearchSuccessState());
    } catch (error, s) {
      log('getSearchData error', error: error, stackTrace: s);
      emit(SearchErrorState(error.toString()));
    }
  }

}
