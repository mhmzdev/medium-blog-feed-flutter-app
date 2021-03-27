import 'package:flutter/material.dart';
import 'package:medium_blog_app/model/blog.dart';
import 'package:medium_blog_app/view/blogDetails.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;

  const BlogCard({Key key, this.blog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => BlogDetails(
            blog: blog,
          ),
        ),
      ),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.2,
                width: width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                        blog.thumbnailB,
                        height: height * 0.3,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.red[900],
                        child: Text(
                          "Published Date: " +
                              blog.dateB.substring(0, blog.dateB.length - 8),
                          style: TextStyle(
                            fontSize: height * 0.015,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                blog.titleB,
                style: TextStyle(
                  fontSize: height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
