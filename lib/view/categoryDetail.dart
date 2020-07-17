import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:phone_brand_collection/category.dart';
import 'package:phone_brand_collection/view/specificationDetail.dart';
import '../brand.dart';
import '../specification.dart';

class CategoryDetail extends StatefulWidget {
  var category_id = "0";
  CategoryDetail({this.category_id});
  @override
  _CategoryDetailState createState() =>
      _CategoryDetailState(category_id: category_id);
}

class _CategoryDetailState extends State<CategoryDetail> {
  //final CategoryMobile categorylist;
  //CategoryMobile category;
  var category_id = "0";
  _CategoryDetailState({this.category_id});
  BrandMobile brands;
  Category category;

  //_CategoryDetailState(this.categorylist);

  @override
  void initState() {
    super.initState();
    showCategory();
  }

  showCategory() async {
    var url =
        "http://mobile.khaingthinkyi.me/api/getbrand?brand_id=${category_id}";
    var data = await http.get(url);
    var jsonData = jsonDecode(data.body); //json.Decode

    category = Category.fromJson(
        jsonData); //fromjson if function & we don't need foreach loop in pokemon.dart

    print(category.toJson());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands Category'),
        backgroundColor: Colors.red,
      ),
      body: category == null
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 2,
              children: category.specificates
                  .map((catego) => Padding(
                        padding: EdgeInsets.all(0.8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SpecificationDetail(
                                        specification_id: catego.id)));
                          },
                          child: Hero(
                            tag: catego.image,
                            child: Card(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                      width: 100,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(catego.image,),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.redAccent,
                                      )),
                                  Text(
                                    catego.cname,
                                    textAlign: TextAlign.center,
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
