import 'package:eduzone/core/constants/app_colors.dart';
import 'package:eduzone/core/theme/text_style.dart';
import 'package:eduzone/features/home/data/repo/home_repo.dart';
import 'package:eduzone/features/home/persentation/cubit/home_cubit/home_cubit.dart';
import 'package:eduzone/features/home/persentation/cubit/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom__button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubit/home_cubit/home_states.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo()),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(color: AppColors.primaryColor),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Hi Ahmed AbdElghany",
                          style: AppTextStyle.s18colorWhite(context),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Welcome to EduZone",
                          style: AppTextStyle.s18colorWhite(context),
                        ),
                        SizedBox(height: 10),
                        CustomTextfield(prefixIcon: Icon(Icons.search)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  if(state.SuccessHomeState),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                            color: AppColors.lightBlueColor,
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.network(
                                  "https://www.aljazeera.net/wp-content/uploads/2025/11/87959_n-1762773175.jpg?resize=770%2C513&quality=80",
                                  fit: .contain,
                                  width: double.infinity,
                                  height: 100,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Flutter course",
                                style: AppTextStyle.s20bold(context),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "300 EGP",
                                style: AppTextStyle.s20bold(context),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: CustomBotton(
                                  text: 'Show Details',
                                  onPressed: () {},
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
