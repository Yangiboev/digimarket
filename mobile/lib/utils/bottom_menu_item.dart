import 'package:flutter/material.dart';

enum BottomMenu {
  menu_home,
  menu_search,
  menu_favorites,
  menu_shops,
}

String menuItemName(BottomMenu layoutType, BuildContext context) {
  switch (layoutType) {
    case BottomMenu.menu_home:
      return '';
    case BottomMenu.menu_search:
      return "Categories";
    case BottomMenu.menu_favorites:
      return "Favorite";
    case BottomMenu.menu_shops:
      return "Shops";
    default:
      return '';
  }
}

bool logoVisibility(BottomMenu layoutType) {
  switch (layoutType) {
    case BottomMenu.menu_home:
      return true;
    case BottomMenu.menu_search:
      return false;
    case BottomMenu.menu_favorites:
      return false;
    case BottomMenu.menu_shops:
      return false;
    default:
      return false;
  }
}

bool appbarIconVisibility(BottomMenu layoutType) {
  switch (layoutType) {
    case BottomMenu.menu_home:
      return true;
    case BottomMenu.menu_search:
      return false;
    case BottomMenu.menu_favorites:
      return false;
    case BottomMenu.menu_shops:
      return true;
    default:
      return false;
  }
}

String appBarIcon(BottomMenu layoutType) {
  switch (layoutType) {
    case BottomMenu.menu_home:
      return 'assets/svg/ic_notifications.svg';
    case BottomMenu.menu_search:
      return '';
    case BottomMenu.menu_favorites:
      return '';
    default:
      return '';
  }
}

IconData bottomMenuIcon(BottomMenu layoutType) {
  switch (layoutType) {
    case BottomMenu.menu_home:
      return Icons.home;
    case BottomMenu.menu_search:
      return Icons.search;
    case BottomMenu.menu_favorites:
      return Icons.favorite;
    case BottomMenu.menu_favorites:
      return Icons.shopping_basket_sharp;
    default:
      return null;
  }
}
