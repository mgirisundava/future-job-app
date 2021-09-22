import 'package:bwa_future_job/models/job_model.dart';
import 'package:bwa_future_job/providers/job_provider.dart';
import 'package:bwa_future_job/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final JobModel job;

  DetailPage({required this.job});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;

  @override
  Widget applyButton() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 45,
      width: 200,
      child: TextButton(
        onPressed: () {
          setState(() {
            isApplied = !isApplied;
          });
        },
        child: Text(
          "Apply for Job",
          style: buttonTextStyle,
        ),
        style: TextButton.styleFrom(
            backgroundColor: deepBlueColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(66))),
      ),
    );
  }

  Widget cancelButton() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 45,
      width: 200,
      child: TextButton(
        onPressed: () {
          setState(() {
            isApplied = !isApplied;
          });
        },
        child: Text(
          "Cancel Apply",
          style: buttonTextStyle,
        ),
        style: TextButton.styleFrom(
            backgroundColor: Color(0xFFFD4F56),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(66))),
      ),
    );
  }

  Widget isAppliedMessage() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
      padding: EdgeInsets.fromLTRB(edge, 10, edge, 10),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Color(0xFFECEDF1), borderRadius: BorderRadius.circular(49)),
      child: Text(
        "You have applied this job and the\nrecruiter will contact you",
        style: companyNameTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget detailItem(String text) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("assets/images/dot.png"),
            height: 12,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(text, style: requirementTextStyle),
          ),
        ],
      ),
    );
  }

  Widget aboutJob() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About the job', style: requirementTitleTextStyle),
          Column(
            children: widget.job.about.map((text) => detailItem(text)).toList()
            // detailItem(
            //   'Full-Time On Site',
            // ),
            // detailItem(
            //   'Start at \$18,000 per month',
            // ),
            ,
          ),
        ],
      ),
    );
  }

  Widget qualifications() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Qualifications', style: requirementTitleTextStyle),
          Column(
              children: widget.job.qualifications
                  .map((text) => detailItem(text))
                  .toList()
              // [
              //   detailItem(
              //     'Candidate must possess at least a Bachelor\'s Degree.',
              //   ),
              //   detailItem(
              //     'Able to use Microsoft Office and Google based service.',
              //   ),
              //   detailItem(
              //     'Have an excellent time management, good at organized and details',
              //   ),
              // ],
              ),
        ],
      ),
    );
  }

  Widget responsibilities() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Responsibilities', style: requirementTitleTextStyle),
          Column(
              children: widget.job.responsibilities
                  .map((text) => detailItem(text))
                  .toList()
              // [
              //   detailItem(
              //     'Initiate and promote any programs, events, training, or activities.',
              //   ),
              //   detailItem(
              //     'Assessing and anticipating needs and collaborate with Division.',
              //   ),
              // ],
              ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: edge),
            child: Column(
              children: [
                isApplied
                    ? isAppliedMessage()
                    : Padding(padding: EdgeInsets.only(top: 40)),
                Center(
                  child: Image(
                    image: NetworkImage(widget.job.companyLogo),
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.job.name,
                  style: applyJobTitleTextStyle,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "${widget.job.companyName}, ${widget.job.location}",
                  style: companyNameTextStyle,
                ),

//TODO : About the job
                aboutJob(),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 30, left: edge, right: edge),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           "About the job",
                //           style: requirementTitleTextStyle,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 16,
                //       ),
                //       Row(
                //         children: [
                //           Image(
                //             image: AssetImage("assets/images/dot.png"),
                //             height: 12,
                //           ),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             "Full-Time On Site",
                //             style: requirementTextStyle,
                //           ),
                //           SizedBox(
                //             height: 16,
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Image(
                //             image: AssetImage("assets/images/dot.png"),
                //             height: 12,
                //           ),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             "Start at \$18,000 per month",
                //             style: requirementTextStyle,
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),

// TODO : Qualifications
                qualifications(),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 30, left: edge, right: edge),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Qualifications",
                //         style: requirementTitleTextStyle,
                //       ),
                //       SizedBox(
                //         height: 16,
                //       ),
                //       Row(
                //         children: [
                //           Image(
                //             image: AssetImage("assets/images/dot.png"),
                //             height: 12,
                //           ),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             "Candidate must possess at least a\nBachelor's Degree.",
                //             style: requirementTextStyle,
                //           ),
                //           SizedBox(
                //             height: 16,
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Image(
                //             image: AssetImage("assets/images/dot.png"),
                //             height: 12,
                //           ),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             "Able to use Microsoft Office and Google\nbased service.",
                //             style: requirementTextStyle,
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Image(
                //             image: AssetImage("assets/images/dot.png"),
                //             height: 12,
                //           ),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             "Have an excellent time management,\ngood at organized and details",
                //             style: requirementTextStyle,
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),

//TODO : Responsibilities
                responsibilities(),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 30, left: edge, right: edge),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Responsibilities",
                //         style: requirementTitleTextStyle,
                //       ),
                //       SizedBox(
                //         height: 16,
                //       ),
                //       Row(
                //         children: [
                //           Image(
                //             image: AssetImage("assets/images/dot.png"),
                //             height: 12,
                //           ),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             "Initiate and promote any programs, events,\ntraining, or activities.",
                //             style: requirementTextStyle,
                //           ),
                //           SizedBox(
                //             height: 16,
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Image(
                //             image: AssetImage("assets/images/dot.png"),
                //             height: 12,
                //           ),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             "Assessing and anticipating needs and\ncollaborate with Division.",
                //             style: requirementTextStyle,
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),

//TODO : BUTTON

                isApplied ? cancelButton() : applyButton(),

                SizedBox(
                  height: 20,
                ),
                Text(
                  "Message Recruiter",
                  style: messageRecruiterTextStyle,
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
