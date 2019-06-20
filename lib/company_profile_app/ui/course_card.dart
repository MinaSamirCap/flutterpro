import 'package:first_flutter_app/company_profile_app/model/company_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;

  CourseCard({this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10.0),
      width: 175,
      decoration: _createShadowRoundedCorner(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: _createThumbnail(),
          ),
          Flexible(
            flex: 5,
            child: _createCourseInfo(),
          )
        ],
      ),
    );
  }

  BoxDecoration _createShadowRoundedCorner() {
    return BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12.5),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0)
        ]);
  }

  Widget _createThumbnail() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: <Widget>[
            Image.asset(course.thumbnail),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: _createLinkButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget _createLinkButton() {
    return Material(
      color: Colors.white24,
      type: MaterialType.circle,
      child: IconButton(
          icon: Icon(Icons.link),
          onPressed: () async {
            if (await canLaunch(course.url)) {
              await launch(course.url);
            }
          }),
    );
  }

  Widget _createCourseInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
      child: Text(
        course.title,
        style: TextStyle(color: Colors.white.withOpacity(0.85)),
      ),
    );
  }
}
