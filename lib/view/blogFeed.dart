import 'package:flutter/material.dart';
import 'package:medium_blog_app/controller/blogController.dart';
import 'package:medium_blog_app/widgets/blogCard.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogFeed extends StatefulWidget {
  @override
  _BlogFeedState createState() => _BlogFeedState();
}

class _BlogFeedState extends State<BlogFeed> {
  void launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: MediumAPI().getAllBlogs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://img.icons8.com/ios-filled/250/000000/medium-monogram--v1.png",
                            height: 45.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Medium Blog Feed",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    for (int i = 0; i < snapshot.data.blogs.length; i++)
                      BlogCard(
                        blog: snapshot.data.blogs[i],
                      ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: MaterialButton(
                        color: Colors.black,
                        onPressed: () =>
                            launchURL('https://mhamzadev.medium.com/'),
                        child: Text(
                          "Read More",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
