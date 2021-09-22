import 'package:bwa_future_job/models/category_model.dart';
import 'package:bwa_future_job/models/job_model.dart';
import 'package:bwa_future_job/pages/detail_page.dart';
import 'package:bwa_future_job/providers/job_provider.dart';
import 'package:bwa_future_job/theme.dart';
import 'package:bwa_future_job/widgets/custom_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondHomePage extends StatelessWidget {
  final CategoryModel category;

  SecondHomePage({required this.category});
  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    child: Image(
                      image: NetworkImage(category.imageUrl),
                      width: double.infinity,
                      height: 270,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 178, left: edge, right: edge),
                    child: Text(
                      category.name,
                      style: jobTitleTextStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 216, left: edge, right: edge),
                    child: Text(
                      "12,309 available",
                      style: availableJobTextStyle,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, right: edge, left: edge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Big Company",
                      style: bodyTitleTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        FutureBuilder<List<JobModel>>(
                            future:
                                jobProvider.getJobsByCategory(category.name),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
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
                        // CustomList(
                        //   imageUrl: "assets/images/google_icon.png",
                        //   jobTitle: "Front-End Developer",
                        //   companyName: "Google",
                        // ),
                        // CustomList(
                        //   imageUrl: "assets/images/instagram_icon.png",
                        //   jobTitle: "UI Designer",
                        //   companyName: "Instagram",
                        // ),
                        // CustomList(
                        //   imageUrl: "assets/images/facebook_icon.png",
                        //   jobTitle: "Data Scientist",
                        //   companyName: "Facebook",
                        // ),
                        ,
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Startups",
                              style: bodyTitleTextStyle,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Column(
                              children: [
                                FutureBuilder<List<JobModel>>(
                                    future: jobProvider.getJobs(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
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
                                // CustomList(
                                //   imageUrl: "assets/images/google_icon.png",
                                //   jobTitle: "Front-End Developer",
                                //   companyName: "Google",
                                // ),
                                // CustomList(
                                //   imageUrl: "assets/images/instagram_icon.png",
                                //   jobTitle: "UI Designer",
                                //   companyName: "Instagram",
                                // ),
                                // CustomList(
                                //   imageUrl: "assets/images/facebook_icon.png",
                                //   jobTitle: "Data Scientist",
                                //   companyName: "Facebook",
                                // ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
