import 'package:dmp/model/CategoryResponse.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'SearchCategoryItem.dart';

class VerticalSearchController extends StatelessWidget {
  VerticalSearchController({this.searchItems, this.showProgress, this.hideKeyboard});

  final List<Categories> searchItems;
  final bool showProgress;
  final void Function() hideKeyboard;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      hideKeyboard.call();
    });

    return
      ModalProgressHUD(
        inAsyncCall: showProgress,
        color: Colors.transparent,
        child: ListView.builder(
            itemCount: searchItems.length,
            controller: _scrollController,
            shrinkWrap: false,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 13),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int position) {
              return SearchCategoryItem(context, searchItems[position], position);
            }),
      );
  }
}
