import 'package:flutter/material.dart';
import 'package:mela/screens/courses_screen/widgets/cover_image_widget.dart';
import '../../constants/global.dart';
import '../lectures_in_topic_screen/widgets/lecture_item.dart';
import 'widgets/topic_item.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  var currentTopics = Global.getTopics();
  var currentLecturesIsLearning = Global.getLecturesIsLearning();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.AppBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Header
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "MELA",
                          style: Global.subTitle.copyWith(
                              fontSize: 20, color: Global.AppBarContentColor),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: Global.AppBarContentColor,
                      )
                    ]),

                //Cover Image Introduction
                const CoverImageWidget(),
                const SizedBox(height: 15),

                //Topics Grid
                GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1,
                    mainAxisExtent: 100, // set the height of each item
                  ),
                  itemCount: currentTopics.length,
                  itemBuilder: (context, index) {
                    return TopicItem(
                      topic: currentTopics[index],
                    );
                  },
                ),
                const SizedBox(height: 15),
                //Text "Chủ đề đang học"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/assets/images/fire.png',
                        width: 20,
                        height: 28,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Chủ đề đang học',
                        style: Global.subTitle.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                //Lectures is learning

                Column(
                  children: currentLecturesIsLearning.map((lecture) {
                    return LectureItem(lecture: lecture);
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
