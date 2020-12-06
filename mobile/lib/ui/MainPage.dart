import 'dart:io';
import 'package:dmp/doman/bloc/CategoryBloc.dart';
import 'package:dmp/doman/bloc/HomeBloc.dart';
import 'package:dmp/doman/bloc/NewsBloc.dart';
import 'package:dmp/ui/ShopsPage.dart';
import 'package:dmp/utils/bottom_menu_item.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'BasePage.dart';
import 'FavoritePage.dart';
import 'HomePage.dart';
import 'NewsPage.dart';
import 'SearchPage.dart';

class MainPage extends BasePage {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends BasePageState<MainPage> {
  BottomMenu _layoutSelection = BottomMenu.menu_home;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeBloc>(context, listen: false).addEvent(LoadHomeEvent());
    Provider.of<HomeBloc>(context, listen: false).addEvent(LoadHomeBannersEvent());
    Provider.of<CategoryBloc>(context, listen: false).addEvent(LoadCategoryEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: clrWhite,
        title: Stack(
          children: [
            Text(
              menuItemName(_layoutSelection, context),
              style: TextStyle(
                  color: clrTextPrimary, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 24),
                child: Visibility(
                  child: Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: logo),
                  visible: logoVisibility(_layoutSelection),
                ),
              ),
            )
          ],
        ),
        actions: <Widget>[
          Center(
            child: IconButton(
              onPressed: () => {actionIconPressed(context, _layoutSelection)},
              icon: Visibility(
                child: SvgPicture.asset(
                  appBarIcon(_layoutSelection),
                  width: 24,
                  height: 24,
                  color: clrTextPrimary,
                ),
                visible: appbarIconVisibility(_layoutSelection),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: heightWidgetForIos(),
        child: Localizations(
          locale: const Locale('en', 'US'),
          delegates: <LocalizationsDelegate<dynamic>>[
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          child: MediaQuery(
            data: const MediaQueryData(),
            child: CupertinoTabBar(
              activeColor: clrAssets,
              backgroundColor: clrWhite,
              items: <BottomNavigationBarItem>[
                _buildMenuItem(
                    icon: SvgPicture.asset(
                      'assets/svg/ic_home.svg',
                      width: 24,
                      height: 24,
                      color:
                          _setMenuItemColor(bottomMenu: BottomMenu.menu_home),
                    ),
                    bottomMenu: BottomMenu.menu_home),
                _buildMenuItem(
                    icon: SvgPicture.asset(
                      'assets/svg/ic_search.svg',
                      width: 24,
                      height: 24,
                      color:
                          _setMenuItemColor(bottomMenu: BottomMenu.menu_search),
                    ),
                    bottomMenu: BottomMenu.menu_search),
                _buildMenuItem(
                    icon: SvgPicture.asset(
                      'assets/svg/ic_favorite.svg',
                      width: 24,
                      height: 24,
                      color: _setMenuItemColor(
                          bottomMenu: BottomMenu.menu_favorites),
                    ),
                    bottomMenu: BottomMenu.menu_favorites),
                _buildMenuItem(
                    icon: SvgPicture.asset(
                      'assets/svg/ic_shops.svg',
                      width: 24,
                      height: 24,
                      color: _setMenuItemColor(
                          bottomMenu: BottomMenu.menu_shops),
                    ),
                    bottomMenu: BottomMenu.menu_shops),
              ],
              onTap: _onSelectMenuItem,
            ),
          ),
        ),
      ),
      body: IndexedStack(
        children: [
          HomePage(),
          SearchPage(),
          FavoritePage(),
          ShopsPage(),
        ],
        index: _layoutSelection.index,
        /*child: _buildPage(),
        bucket: bucket,*/
      ),
      backgroundColor: clrBackground,
    );
  }

  // ignore: missing_return
  double heightWidgetForIos() {
    if (Platform.isAndroid) {
      return 50.0;
    } else if (Platform.isIOS) {
      return 70.0;
    }
  }

  actionIconPressed(BuildContext context, BottomMenu layoutType) {
    switch (layoutType) {
      case BottomMenu.menu_home:
        navigateToNewsPage(context);
        break;
      case BottomMenu.menu_search:
        break;
      case BottomMenu.menu_favorites:
        break;
      case BottomMenu.menu_shops:
        navigateToNewsPage(context);
        break;
    }
  }

  Future navigateToNewsPage(context) async {
    Provider.of<NewsBloc>(context, listen: false).addEvent(LoadNewsEvent());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsPage()));
  }



  BottomNavigationBarItem _buildMenuItem({Widget icon, BottomMenu bottomMenu}) {
    return BottomNavigationBarItem(icon: icon);
  }

  Color _setMenuItemColor({BottomMenu bottomMenu}) =>
      _layoutSelection == bottomMenu ? clrAssets : clrPrimary;

  void _onSelectMenuItem(int index) {
    switch (index) {
      case 0:
        _onLayoutSelected(BottomMenu.menu_home);
        break;
      case 1:
        _onLayoutSelected(BottomMenu.menu_search);
        break;
      case 2:
        _onLayoutSelected(BottomMenu.menu_favorites);
        break;
      case 3:
        _onLayoutSelected(BottomMenu.menu_shops);
        break;
    }
  }

  void _onLayoutSelected(BottomMenu selection) {
    setState(() => _layoutSelection = selection);
  }
}
