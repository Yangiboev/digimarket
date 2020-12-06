import 'package:dmp/animation/fadeAnimation.dart';
import 'package:dmp/model/NewsResponse.dart';
import 'package:dmp/ui/BasePage.dart';
import 'package:dmp/ui/WebViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsPageData extends BasePage {
  final News news;

  NewsPageData({this.news});

  @override
  _NewsPageDataState createState() => _NewsPageDataState();
}

class _NewsPageDataState extends BasePageState<NewsPageData> {
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    if(widget.news.formattedDate==null){
      _dateTime = DateTime.now();
    }
    else
    _dateTime = DateTime.parse(widget.news.formattedDate.substring(0, 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'News',
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        body: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            color: Colors.transparent,
            axisDirection: AxisDirection.down,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.news.previewImage??'assets/image/placeholder_cover.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: double.infinity,
                      height: 200,
                      child: Center(
                        child: Image.asset('assets/image/placeholder_cover.jpg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1.1,
                          Text(
                            widget.news.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        FadeAnimation(
                          1.2,
                          Text(
                            "${_dateTime.day} ${_dateTime.month} ${_dateTime.year}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xFFABABAB),
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        FadeAnimation(
                          1.3,
                          Html(
                            onLinkTap: (url) => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebViewPage(
                                        title: "Goodzone",
                                        url: url,
                                      )))
                            },
                            defaultTextStyle: TextStyle(
                              fontSize: 16,
                              letterSpacing: 0.1,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF212529),
                            ),
                            data: widget.news.fullText??'',
                            customRender: (node, children) {
                              return Column(children: children);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
