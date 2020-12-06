import 'package:dmp/components/CategoryProductItem.dart';
import 'package:dmp/doman/bloc/AllProductBloc.dart';
import 'package:dmp/doman/bloc/CategoryBloc.dart';
import 'package:dmp/ui/BasePage.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductPage extends BasePage {

  final String title;

  AllProductPage({this.title});

  @override
  AllProductPageState createState() => AllProductPageState();
}

class AllProductPageState extends BasePageState<AllProductPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AllProductBloc>(context);
    var size = MediaQuery.of(context).size;
    final double itemWidth = (size.width - 48) / 2;
    final double itemHeight = itemWidth + 108;


    return Scaffold(
      backgroundColor: clrBackground,
        appBar: AppBar(
          backgroundColor: clrWhite,
          title: Text(
            widget.title,
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

          if(state is AllProductLoadedExceptionState){
            showCustomFlash(state.message);
          }
          else if(state is AllProductLoadedState){
            return  GridView.count(
              crossAxisCount: 2,
              padding:
              EdgeInsets.only(left: 16, right: 16, bottom: 16),
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisSpacing: 16,
              shrinkWrap: false,
              physics: BouncingScrollPhysics(),
              children: List.generate(state.product.length, (index) {
                return CategoryProductItem(
                  product: state.product[index],
                  imageSize: itemWidth,
                );
              }),
            );
          }
          else if(state is CategoryLoadingState){
            return loader;
          }
          return SizedBox();
        },
      ),
    );
  }
}
