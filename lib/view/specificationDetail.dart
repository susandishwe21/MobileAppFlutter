import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phone_brand_collection/brand.dart';
import '../specification.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class SpecificationDetail extends StatefulWidget {
  var specification_id = "0";
  SpecificationDetail({this.specification_id});

  @override
  _SpecificationDetailState createState() =>
      _SpecificationDetailState(specification_id: specification_id);
}

class _SpecificationDetailState extends State<SpecificationDetail> {
  var specification_id = "0";
  _SpecificationDetailState({this.specification_id});
  BrandMobile brandMobile;
  Specifications specification;

  @override
  void initState() {
    super.initState();
    showSpecifications();
  }

  showSpecifications() async {
    var url =
        "http://mobile.khaingthinkyi.me/api/getSpecification?category_id=${specification_id}";
    var data = await http.get(url);
    var jsonData = jsonDecode(data.body); //json.Decode

    specification = Specifications.fromJson(
        jsonData); //fromjson if function & we don't need foreach loop in pokemon.dart

    print(specification.toJson());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands Specification'),
        backgroundColor: Colors.red,
      ),
      body: specification == null
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 1,
              children: specification.specifications
                  .map((spec) => Padding(
                        padding: EdgeInsets.all(0.8),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Hero(
                            tag: spec.image,
                            child: Card(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(spec.image),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.redAccent,
                                      )),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "CPU : ${spec.cpu}",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Memory : ${spec.memory}",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Battery : ${spec.battery}",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      RaisedButton(
                                          onPressed: () {
                                            FlutterYoutube
                                                .playYoutubeVideoByUrl(
                                              apiKey:
                                                  "https://mobile.khaingthinkyi.me/api/getSpecification?category_id=${specification_id}",
                                              videoUrl:
                                                  "https://www.youtube.com/watch?v=${spec.youtube}",
                                              autoPlay: false,
                                            );
                                          },
                                          child: const Text(
                                            "You Tube",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "Capacity : ${spec.capacity}",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Price : ${spec.price}",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ), 
                            ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
