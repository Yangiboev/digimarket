import 'package:dmp/components/search_item.dart';
import 'package:dmp/components/vertical_scroll_search_page_items.dart';
import 'package:dmp/doman/bloc/CategoryBloc.dart';
import 'package:dmp/doman/notifier/SearchVM.dart';
import 'package:dmp/model/ProductResponse.dart';
import 'package:dmp/ui/BasePage.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SearchPage extends BasePage {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends BasePageState<SearchPage> {
  CategoryBloc bloc;
  SearchNotifier _searchNotifier;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CategoryBloc>(context);
    _searchNotifier = Provider.of<SearchNotifier>(context);

    return Scaffold(
      backgroundColor: clrBackground,
      body:  Builder(
        builder: (baseContext) {
      return Theme(
        data: ThemeData(
            cursorColor: clrAssets, accentColor: clrAssets),
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Color(0x00FFFFFF),
            child: SearchBar<Product>(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search',
                textStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.black),
                searchBarStyle: SearchBarStyle(
                  backgroundColor: clrWhite,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(10.0)),
                  padding: EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 0, bottom: 0),
                ),
                searchBarPadding:
                const EdgeInsets.symmetric(horizontal: 12),
                onSearch: search,
                shrinkWrap: false,
                listPadding: EdgeInsets.only(left: 12, right: 12, top: 8),
                loader: Center(child: CircularProgressIndicator()),
                debounceDuration: Duration(milliseconds: 800),
                placeHolder: StreamBuilder<CategoryState>(
                  initialData: bloc.initialState,
                  stream: bloc.state,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    if (state == null)
                      return loader;
                    else if (state is CategoryLoadingState)
                      return loader;
                    else if (state is CategoryLoadedExceptionState) {
                      showCustomFlash(state.message);
                      // createSnackBar(state.message, baseContext);
                      return Container();
                    } else if (state is SearchLoadedExceptionState) {
                      showCustomFlash(state.message);
                      // createSnackBar(state.message, baseContext);
                      return Container();
                    } else if (state is CategoryLoadedState)
                      return VerticalSearchController(
                        searchItems: state.categories,
                        hideKeyboard: hideKeyboard,
                        showProgress: state is CategoryLoadingState,
                      );
                    return Container();
                  },
                ),
                emptyWidget: ListView(
                  children: [
                    SizedBox(
                      height: 48,
                    ),
                    SvgPicture.asset(
                      'assets/svg/search_empty.svg',
                      height: 240,
                      width: 160,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Not found',
                      textAlign: TextAlign.center,
                      style: styDefaultTextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 17),
                    )
                  ],
                ),
                onError: (error) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Not found',
                    ),
                  );
                },
                minimumChars: 3,
                cancellationWidget: Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: clrWhite,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onCancelled: () {
                  hideKeyboard();
                },
                onItemFound: (item, int index) {
                  return SearchItem(
                      _searchNotifier.list[index], hideKeyboard);
                }),
          ),
        ),
      );
    },
    )
    );
  }

  Future<List<Product>> search(String query) async {
    final data = await bloc.getData(query, 'ru');
    _searchNotifier.addList(data);
    return data;
  }

  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
