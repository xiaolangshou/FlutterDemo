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

    final post = {
      'title': 'hello',
      'description': 'nice to meet you.',
    };

    // 输出json格式
    final postJson = json.encode(post);
    // print(postJson);

    // 输出Map类型
    final postJsonConverted = json.decode(postJson);
    // print(postJsonConverted['title']);
    // print(postJsonConverted['description']);
    // print(postJsonConverted is Map);

    // Map类型转换为Model类型
    final postModel = Post.fromJson(postJsonConverted);
    print('id:${postModel.id}, '
        'title: ${postModel.title}, '
        'author: ${postModel.author},'
        ' description: ${postModel.description},'
        ' imageUrl: ${postModel.imageUrl}');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post {
  final Int16 id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  // 构造函数
  Post(this.id, this.title, this.author, this.description, this.imageUrl);

  Post.fromJson(Map json) : id = json['id'],
        title = json['title'],
        author = json['author'],
        description = json['description'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
    'id': id,
    'title': title,
    'author': author,
    'description': description,
    'imageUrl': imageUrl,
  };
}