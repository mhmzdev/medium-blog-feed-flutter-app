import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:medium_blog_app/model/blog.dart';

class BlogDetails extends StatelessWidget {
  final Blog blog;

  const BlogDetails({Key key, this.blog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(blog.titleB),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Html(
          data: blog.contentB,
        )),
      ),
    );
  }
}
