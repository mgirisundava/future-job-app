import 'package:bwa_future_job/models/category_model.dart';
import 'package:bwa_future_job/pages/second_home_page.dart';
import 'package:flutter/material.dart';
import 'package:bwa_future_job/theme.dart';

class JobCard extends StatelessWidget {
  final CategoryModel category;

  JobCard({required this.category});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondHomePage(
                      category: category,
                    )));
      },
      child: Container(
        width: 150,
        height: 200,
        margin: EdgeInsets.only(right: edge),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(category.imageUrl))),
        child: Padding(
          padding: EdgeInsets.only(top: 15, right: 10, bottom: 15, left: 10),
          child: Text(
            category.name,
            style: imageTitleTextStyle,
          ),
        ),
      ),
    );
  }
}
