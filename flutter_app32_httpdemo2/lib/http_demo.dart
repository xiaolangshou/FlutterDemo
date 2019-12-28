import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();

    fetchPosts().then((value) => print(value.isp + value.ip + value.city));
  }

  Future<Post> fetchPosts() async {
    final response = await http.get('http://ip.taobao.com/service/getIpInfo.php?ip=202.108.22.5');
//    print('statusCode: ${response.statusCode}');
//    print('body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      Post posts = Post.fromJson(responseBody['data']);
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post {
  final String ip;
  final String country;
  final String area;
  final String region;
  final String city;
  final String county;
  final String isp;
  final String country_id;
  final String area_id;
  final String region_id;
  final String city_id;
  final String county_id;
  final String isp_id;

  Post(
    this.ip,
    this.country,
    this.area,
    this.region,
    this.city,
    this.county,
    this.isp,
    this.country_id,
    this.area_id,
    this.region_id,
    this.city_id,
    this.county_id,
    this.isp_id
  );

  Post.fromJson(Map json)
      : ip = json['ip'],
        country = json['country'],
        area = json['area'],
        region = json['region'],
        city = json['city'],
        county = json['county'],
        isp = json['isp'],
        country_id = json['country_id'],
        area_id = json['area_id'],
        region_id = json['region_id'],
        city_id = json['city_id'],
        county_id = json['county_id'],
        isp_id = json['city_id'];

  Map toJson() => {
        'ip': ip,
        'country': country,
        'area': area,
        'region': region,
        'city': city,
        'county': county,
        'isp': isp,
        'country_id': country_id,
        'area_id': area_id,
        'region_id': region_id,
        'city_id': city_id,
        'county_id': county_id,
        'isp_id': isp_id,
      };
}
