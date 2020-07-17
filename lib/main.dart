import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phone_brand_collection/category.dart';
import 'package:phone_brand_collection/view/categoryDetail.dart';
import 'brand.dart';

void main() {
  runApp(MaterialApp(home: CategoryPage()));
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var url = "https://mobile.khaingthinkyi.me/api/brands";

Category categoryMobile;
  BrandMobile brand;

  @override
  void initState() {
    super.initState();
    showBrand();
  }

  showBrand() async {
    var data = await http.get(url);
    var jsonData = jsonDecode(data.body); //json.Decode

    brand = BrandMobile.fromJson(
        jsonData); //fromjson if function & we don't need foreach loop in pokemon.dart

    print(brand.toJson());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Brands'),
        backgroundColor: Colors.red,
      ),
      body:brand == null
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 2,
              children: brand.brands
                  .map((cat) => Padding(
                        padding: EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                             MaterialPageRoute(builder: (context) =>
                               CategoryDetail(category_id: cat.id.toString(),)                             
                            ));
                          },
                          child: Hero(
                            tag: cat.image,
                            child: Card(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(cat.image),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.redAccent,
                                      )),
                                  Text(
                                    cat.bname,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.normal),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList()),
    );
  }
}
