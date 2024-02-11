import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/features/Home/data/data_sources/home_remote_data_source.dart';
import 'package:moton/features/Home/data/repositories_impl/home_repo_impl.dart';
import 'package:moton/features/Home/domain/entities/classes_entity.dart';
import 'package:moton/features/Home/domain/use_cases/home_usecase.dart';
import 'package:moton/features/Home/presentation/blocs/cubit/home_cubit.dart';
import 'package:moton/shared/costant.dart';
import 'package:moton/shared/utils/api_service.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  // ignore: use_super_parameters
  Home({Key? key}) : super(key: key);

  List<String> labelScreens = [
    "الرئيسية",
    "الاداء",
    "التقارير والشهادات",
    "الملف الشخصي"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext) => HomeCubit(FetchHomeUsecase(HomeRepoImpl(
          homeRemoteDataSource: HomeRemoteDataSourceImpl(ApiService(Dio())))))
        ..fetchSemsters(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is Homesuccess) {
            print("state.semsters");
            final List<ClassesEntity> semsters = state.semsters;
            print(semsters[0].info![0].name);
            print(semsters.length);
          }
          if (state is HomeFailure) {
            print(state.errMessage);
          }
          if (state is HomeLoding) {
            print("load");
          }
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: defaultcolor,
                                image: const DecorationImage(
                                  fit: BoxFit.none,
                                  alignment: Alignment.topRight,
                                  image: AssetImage(
                                      "matrial/icons/background screen.png"),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "اهلا بك يا",
                                          style: TextStyle(
                                            color: Colors.grey[200],
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Text("نبيل"),
                                        const Spacer(),
                                        const Icon(
                                          Icons.notifications_outlined,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text("ابدأ دراستك الان"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, .90),
                            child: Container(
                              height: 22,
                              decoration: BoxDecoration(
                                  color: defaultcolor,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50))),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 40,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: const Column(
                        children: [],
                      ),
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
