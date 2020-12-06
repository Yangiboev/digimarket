import 'package:dmp/doman/bloc/AllProductBloc.dart';
import 'package:dmp/model/CategoryResponse.dart';
import 'package:dmp/ui/AllProductPage.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class SearchCategoryItem extends StatelessWidget {
  SearchCategoryItem(this.buildContext, this.item, this.position);

  final BuildContext buildContext;
  final Categories item;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Container(
        child: InkWell(
          onTap: ()  {
          Provider.of<AllProductBloc>(context, listen: false).addEvent(LoadAllProductEvent(category: item.id));
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AllProductPage(title: item.name,)));
          },
          child: Card(
            elevation: 0.0,
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(item.name,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    )),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: CachedNetworkImage(
                    imageUrl: image[position]??'assets/image/placeholder_cover.jpg',
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> image = [
  "http://cdn.test.delever.uz/delever/2154fbb3-ac2a-4e77-ae38-355e72c17190",
  "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.mobilnishop.com%2Fblog%2Fwp-content%2Fuploads%2F2018%2F12%2Fnajbolji-telefoni-2018-godine-04-386x655.jpg&imgrefurl=https%3A%2F%2Fwww.mobilnishop.com%2Fblog%2Faktuelno%2Fnajbolji-telefoni-2018-godine%2F&tbnid=AWgLZlCHm6HAKM&vet=12ahUKEwja79Hr-7jtAhWWxyoKHSiUBvcQMygDegUIARDpAQ..i&docid=m8yBHASWURZOUM&w=386&h=655&q=telefoni&ved=2ahUKEwja79Hr-7jtAhWWxyoKHSiUBvcQMygDegUIARDpAQ",
  "",
  "",
];
