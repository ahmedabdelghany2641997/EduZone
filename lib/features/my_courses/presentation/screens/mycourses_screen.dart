import 'package:eduzone/core/constants/app_strings.dart';
import 'package:eduzone/features/my_courses/presentation/cubit/my_courses_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/text_style.dart';
import '../../data/repo/my_courses_repo.dart';
import '../cubit/my_courses_states.dart';

class MycoursesScreen extends StatefulWidget {
  const MycoursesScreen({super.key});

  @override
  State<MycoursesScreen> createState() => _MycoursesScreenState();
}

class _MycoursesScreenState extends State<MycoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCoursesCubit(MyCoursesRepo())..getMyCourses(),
      child: BlocConsumer<MyCoursesCubit, MyCoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff153c62),
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.layoutBottomNavBarScreen,
                  );
                },
                icon: Icon(Icons.arrow_back, color: Colors.grey),
              ),
              title: Text(
                AppStrings.subscribed,
                style: AppTextStyle.screenTitle,
              ),
              centerTitle: true,
            ),

            body: state is GetMyCoursesLoadingState
                ? Center(child: CircularProgressIndicator())
                : state is GetMyCoursesErrorState
                ? Text(state.errorMsg)
                : state is GetMyCoursesSuccessState
                ? state.courses.isEmpty
                      ? Text("there is no courses")
                      : ListView.builder(
                          itemCount: state.courses.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        state.courses[index].image,
                                        width: 110,
                                        height: 75,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stack) =>
                                            Container(
                                              width: 110,
                                              height: 75,
                                              color: Colors.grey[300],
                                              child: const Icon(
                                                Icons.broken_image,
                                              ),
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.courses[index].title,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                context,
                                                AppRoutes.courseVideosScreen,
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(
                                                0xFF673AB7,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                  ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Text(
                                              'complete course',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                : CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
