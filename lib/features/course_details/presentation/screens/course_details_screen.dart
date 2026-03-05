import 'package:eduzone/core/functions.dart';
import 'package:eduzone/features/home/data/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/widgets/custom__button.dart';
import '../../data/repo/course_details_repo.dart';
import '../cubit/course_details_cubit.dart';
import '../cubit/course_details_states.dart';

class CourseDetailsScreen extends StatefulWidget {
  final CourseModel courseModel;

  const CourseDetailsScreen({super.key, required this.courseModel});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseDetailsCubit(CourseDetailsRepo()),
      child: BlocConsumer<CourseDetailsCubit, EnrollState>(
        listener: (context, state) {
          if (state is EnrollFailureState) {
            snackBarMessage(context: context, text: state.error);
          }
          if (state is EnrollSuccessState) {
            snackBarMessage(context: context, text: "Enroll Success");
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
              ),
              title: Text(
                AppStrings.courseDetails,
                style: AppTextStyle.screenTitle,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Card(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 15,
                      color: Colors.white,
                      shadowColor: Colors.black,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.courseModel.image ??
                              "https://www.aljazeera.net/wp-content/uploads/2025/11/87959_n-1762773175.jpg?resize=770%2C513&quality=80",
                          width: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      widget.courseModel.title ?? " Php laravel course",
                      style: AppTextStyle.sectionHeading,
                    ),
                    SizedBox(height: 15),

                    Text(
                      " ${widget.courseModel.price}EGP",
                      style: AppTextStyle.priceText,
                    ),
                    SizedBox(height: 35),
                    Text(
                      widget.courseModel.desc ?? " Description",
                      style: AppTextStyle.bodyText,
                    ),
                    Text(
                      " This course provides thorough coverage of PHP from basic to advanced topics. It has been praised for its practical approach, including hands-on projects",
                      style: AppTextStyle.desc,
                    ),
                    SizedBox(height: 65),
                    state is EnrollLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : CustomBotton(
                            text: 'Start Course',
                            onPressed: () {
                              context.read<CourseDetailsCubit>().enrollCourse(
                                courseId: widget.courseModel.id,
                                userId: Supabase
                                    .instance
                                    .client
                                    .auth
                                    .currentUser!
                                    .id,
                              );
                            },
                            color: AppColors.primaryColor,
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
