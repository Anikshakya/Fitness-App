// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomImageRefresher extends StatefulWidget {
  final Widget child;
  final VoidCallback? onRefresh;
  final image;

  const CustomImageRefresher({
    Key? key,
    required this.child,
    this.onRefresh,
    this.image,
  }) : super(key: key);

  @override
  State<CustomImageRefresher> createState() => _CustomSmartRefresherState();
}

class _CustomSmartRefresherState extends State<CustomImageRefresher> {
  @override
  void initState() {
    widget.onRefresh;

    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    await Future.delayed(const Duration(seconds: 4));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) => refresher();

  Widget refresher() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: onRefresh,
      child: ListView(
        children: [
          widget.child,
        ],
      ),
      header: CustomHeader(builder: (context, mode) {
        return Container(
          padding: const EdgeInsets.only(top: 45),
          height: 100,
          child: Image.asset(
            widget.image,
            fit: BoxFit.contain,
          ),
        );
      }),
      controller: _refreshController,
    );
  }

  Widget buildHeader(BuildContext context, RefreshStatus mode) {
    return Container();
  }
}
