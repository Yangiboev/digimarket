import 'package:dmp/animation/fadeAnimation.dart';
import 'package:dmp/doman/bloc/ProductBloc.dart';
import 'package:dmp/model/ProductResponse.dart';
import 'package:dmp/ui/BasePage.dart';
import 'package:dmp/ui/WebViewPage.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:provider/provider.dart';

class ProductPageData extends BasePage {
  final Product product;

  ProductPageData({this.product});

  @override
  _ProductPageDataState createState() => _ProductPageDataState();
}

class _ProductPageDataState extends BasePageState<ProductPageData> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProductBloc>(context);

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
            widget.product.name,
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        body: NestedScrollView(
          physics: ScrollPhysics(parent: PageScrollPhysics()),
    headerSliverBuilder:
    (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: widget.product.image??'assets/image/placeholder_cover.jpg',
                                  width: double.infinity,
                                  height: 400,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: double.infinity,
                                    height: 400,
                                    child: Center(
                                      child: Image.asset('assets/image/placeholder_cover.jpg'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
                                  child: FadeAnimation(
                                    1.1,
                                    Text(
                                      widget.product.description,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            )
                      ])
                  ),
            ];
    },
    body:Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
              child: StreamBuilder(
                  stream: bloc.state,
                  initialData: bloc.initialState,
                  builder: (_, snapshot){
                    final state = snapshot.data;
                    if(state is ProductLoadedState) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: const Color(0xFFF4F4F4),
                          height: 0.3,
                        ),
                        shrinkWrap: false,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: state.prices.length,
                        itemBuilder: (_, index){
                          final fmf = FlutterMoneyFormatter(
                            amount: state.prices[index].price.toDouble(),
                            settings: MoneyFormatterSettings(thousandSeparator: ' '),
                          ).output;
                          return ListTile(
                            title: Text(
                              state.prices[index].shop,
                              style: styDefaultTextStyle.copyWith(
                              ),
                            ),
                            leading: InkWell(
                              child: Icon(
                                Icons.add_link,
                                color: Colors.blue,
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=> WebViewPage(title: widget.product.name, url: state.prices[index].url,)));
                              },
                            ),
                            trailing: Text(
                              fmf.withoutFractionDigits,
                              style: styDefaultTextStyle.copyWith(
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container(
                      height: 56,
                      width: MediaQuery.of(context).size.width,
                      child: loader,
                    );
                  }
              ),
            )
    ));
  }
}

