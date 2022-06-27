import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefreshWidget extends StatefulWidget {
  final Widget child;
  final Future Function()? onRefresh;
  final Future Function()? onLoading;
  final Widget? widget;

  const CustomRefreshWidget({
    Key? key,
    required this.child,
    this.onRefresh,
    this.widget,
    this.onLoading,
  }) : super(key: key);

  @override
  State<CustomRefreshWidget> createState() => _CustomSmartRefresherState();
}

class _CustomSmartRefresherState extends State<CustomRefreshWidget> {
  @override
  void initState() {
    widget.onRefresh;
    super.initState();
  }

  bool refreshStatus = true;
  var refDureation = Future.delayed(const Duration(seconds: 4));

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void onRefresh() async {
    await Future.delayed(const Duration(seconds: 4));
    widget.onRefresh;
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) => refresher();

  Widget refresher() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: onRefresh,
      onLoading: widget.onLoading,
      child: ListView(
        children: [
          widget.child,
        ],
      ),
      header: CustomHeader(builder: (context, mode) {
        return SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: _refreshController.isRefresh
              ? widget.widget
              : Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.card_travel,
                        color: Colors.orangeAccent,
                        size: 25,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Daraz",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
        );
      }),
      // footer: CustomFooter(builder: (context, mode) {
      //   return SizedBox();
      // }),
      controller: _refreshController,
    );
  }

  Widget buildHeader(BuildContext context, RefreshStatus mode) {
    return Container();
  }
}
