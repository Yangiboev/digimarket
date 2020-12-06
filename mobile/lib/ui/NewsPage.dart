import 'package:dmp/components/NewsItem.dart';
import 'package:dmp/doman/bloc/NewsBloc.dart';
import 'package:dmp/ui/BasePage.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsPage extends BasePage {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends BasePageState<NewsPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NewsBloc>(context);


    return Scaffold(
      backgroundColor: clrBackground,
        appBar: AppBar(
          backgroundColor: clrWhite,
          title: Text(
            'News',
            style: styDefaultTextStyle.copyWith(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),

          ),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      body: StreamBuilder(
        initialData: bloc.initialState,
        stream: bloc.state,
        builder: (_, snapshot){
          final state = snapshot.data;

          if(state is NewsLoadedExceptionState){
            showCustomFlash(state.message);
          }
          else if(state is NewsLoadedState){
            return  ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: const Color(0xFFF4F4F4),
                  height: 0.3,
                ),
                itemCount: state.news.length,
                shrinkWrap: false,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int position) {
                  return NewsItem(context, state.news[position]);
                });
          }
          else if(state is NewsLoadingState){
            return loader;
          }
          return SizedBox();
        },
      ),
    );
  }
}
