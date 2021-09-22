import 'package:bwa_future_job/models/category_model.dart';
import 'package:bwa_future_job/models/job_model.dart';
import 'package:bwa_future_job/providers/category_provider.dart';
import 'package:bwa_future_job/providers/job_provider.dart';
import 'package:bwa_future_job/providers/user_provider.dart';
import 'package:bwa_future_job/theme.dart';
import 'package:bwa_future_job/widgets/custom_list.dart';
import 'package:bwa_future_job/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);
    Widget header() {
      return Container(
        padding: EdgeInsets.only(top: 30, right: edge, left: edge),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Howdy",
                  style: titleTextStyle,
                ),
                Text(
                  userProvider.user.name,
                  style: subTitleTextStyle,
                )
              ],
            ),
            Spacer(),
            Image(
              image: AssetImage("assets/images/user_pic.png"),
              width: 58,
              height: 58,
            )
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                "Hot Categories",
                style: bodyTitleTextStyle,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 200,
              child: FutureBuilder<List<CategoryModel>>(
                  future: categoryProvider.getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      int index = -1;

                      return ListView(
                          scrollDirection: Axis.horizontal,
                          children: snapshot.data!.map((category) {
                            index++;
                            return Container(
                                margin: EdgeInsets.only(
                                    left: index == 0 ? edge : 0),
                                child: JobCard(
                                  category: category,
                                ));
                          }).toList());
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Just Posted",
                    style: bodyTitleTextStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FutureBuilder<List<JobModel>>(
                      future: jobProvider.getJobs(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Column(
                            children: snapshot.data!.map((job) {
                              return Container(
                                child: CustomList(
                                  job: job,
                                ),
                              );
                            }).toList(),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      })
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        unselectedItemColor: Color(0xFFB3B5C4),
        selectedItemColor: Color(0xFF272C2F),
        iconSize: 24,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/navbar_1.png"),
              ),
              label: "dasd"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/navbar_2.png"),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/navbar_3.png"),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/navbar_4.png"),
              ),
              label: ""),
        ],
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                header(),
                SizedBox(
                  height: 30,
                ),
                body()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
