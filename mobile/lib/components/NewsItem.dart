import 'package:animations/animations.dart';
import 'package:dmp/model/NewsResponse.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'NewsPageData.dart';

class NewsItem extends StatelessWidget {
  NewsItem(this.context, this.news);

  final BuildContext context;
  final News news;

  @override
  Widget build(BuildContext context) {
    if(news.formattedDate==null){
      news.formattedDate = DateTime.now().toString();
    }
    DateTime _dateTime = DateTime.parse(news.formattedDate.substring(0, 10));
    return OpenContainer(
      openBuilder: (context, _){
        return NewsPageData(
          news: news,
        );
      },
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      transitionDuration: duration,
      closedBuilder: (context, openContainer){
        return InkWell(
          onTap: openContainer,
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: news.previewImage??'assets/image/placeholder_cover.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Image.asset('assets/image/placeholder_cover.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              news.title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "${_dateTime.day} ${_dateTime.month} ${_dateTime.year}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: const Color(0xFFABABAB),
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}