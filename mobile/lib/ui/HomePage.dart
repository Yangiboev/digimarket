import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dmp/components/horizontal_scroll_home_page_popular.dart';
import 'package:dmp/doman/bloc/AllProductBloc.dart';
import 'package:dmp/doman/bloc/HomeBloc.dart';
import 'package:dmp/ui/AllProductPage.dart';
import 'package:dmp/ui/BasePage.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends BasePage {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);

    return StreamBuilder(
      initialData: bloc.initialState,
        stream: bloc.state,
        builder: (_, state){
          final snapshot = state.data;
        if(snapshot is HomeLoadedState)
          return ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              color: Colors.transparent,
              axisDirection: AxisDirection.down,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () => {},
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 200.0,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            onPageChanged: (int index, CarouselPageChangedReason reason) {},
                            scrollDirection: Axis.horizontal,
                          ),
                          items: snapshot.banners.map((i) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: i.image ?? 'assets/image/placeholder_cover.jpg',
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    Image.asset('assets/image/placeholder_cover.jpg'),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 8, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: clrTextSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            InkWell(
                              onTap: () => {
                                openAll("Popular", false,
                                    false, true)
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                      color: clrAssets,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    HorizontalPopularController(
                        popularList: snapshot.product??[]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 8, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'new_items',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: clrTextSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            InkWell(
                              onTap: () => {
                                openAll('new_items', true,
                                    false, false)
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                      color: clrAssets,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    HorizontalPopularController(
                        popularList: snapshot.product??[]),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recommended',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: clrTextSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            InkWell(
                              onTap: () => {
                                openAll('recommended', false, true, false)
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                      color: clrAssets,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    HorizontalPopularController(
                      popularList: snapshot.product??[],
                    ),
                    SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
          );
        else if(snapshot is HomeLoadingState){
          return loader;
        }
        else if(snapshot is HomeLoadedExceptionState){
          showCustomFlash(snapshot.message);
        }
        return SizedBox();
        },
    );
  }

  void openAll(String title, bool news, bool recommended, bool popular) async {
    Provider.of<AllProductBloc>(context, listen: false).addEvent(LoadAllProductEvent(category: ''));
    Navigator.push(context, MaterialPageRoute(builder: (context)=> AllProductPage(title: title,)));
  }
}
