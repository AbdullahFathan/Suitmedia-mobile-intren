import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/config/colors.dart';
import 'package:suitmedia_test/cubit/user/user_cubit.dart';
import 'package:suitmedia_test/models/user.dart';
import 'package:suitmedia_test/widgets/appbar.dart';
import 'package:suitmedia_test/widgets/user_card.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late ScrollController _scrollController;
  int page = 1;
  String name = "";

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    context.read<UserCubit>().fetchUserData(page, true);
    super.initState();
  }

  //Know end position of the list
  void _scrollListener() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0 &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      //make sure there is still available page in the server
      if (page < totalPage) {
        page++;
        context.read<UserCubit>().fetchMoreUserData(page, false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget("Third Screen", context, result: name),
        body: WillPopScope(
          //handle default back button android so it can get selected user name
          onWillPop: () async {
            Navigator.pop(context, name);
            return false;
          },
          child: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is FetchUserEror) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Eror at get user")));
              }
            },
            builder: (context, state) {
              if (state is FetchUserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchUserNoData) {
                return const Center(
                  child: Text("No Data"),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  //reset page number to initial value as [1]
                  page = 1;
                  context.read<UserCubit>().fetchUserData(page, true);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        controller: _scrollController,
                        itemCount: allUser.length,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            indent: 16,
                            endIndent: 16,
                            color: greyColor,
                          );
                        },
                        itemBuilder: (context, index) {
                          return UserCardWidget(
                            userModel: allUser[index],
                            onCallback: (String fullname) {
                              setState(() {
                                name = fullname;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        if (state is FetchMoreUserLoading) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
