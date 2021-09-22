import 'package:bwa_future_job/models/job_model.dart';
import 'package:bwa_future_job/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:bwa_future_job/theme.dart';

class CustomList extends StatelessWidget {
  final JobModel job;

  CustomList({required this.job});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      job: job,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(job.companyLogo),
              height: 45,
            ),
            SizedBox(
              width: 26,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.name,
                    style: jobTextStyle,
                  ),
                  Text(
                    job.companyName,
                    style: companyNameTextStyle,
                  ),
                  SizedBox(
                    height: 18.5,
                  ),
                  Divider(
                    color: Color(0xFFECEDF1),
                    thickness: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
