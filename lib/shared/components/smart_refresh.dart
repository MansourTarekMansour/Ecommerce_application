import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefresh extends StatelessWidget {
  const SmartRefresh({
    this.child,
    this.footerEnabled,
    this.onLoading,
    this.onRefresh,
    this.waterDropColor,
    this.idleIconColor,
    this.controller,
    this.listLength,
  });

  final Widget? child;
  final bool? footerEnabled;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final RefreshController? controller;
  final Color? waterDropColor;
  final Color? idleIconColor;
  final int? listLength;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: footerEnabled ?? false,
      header: WaterDropHeader(
        waterDropColor: waterDropColor ?? Theme.of(context).primaryColor,
        idleIcon: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Icon(
            Icons.autorenew,
            size: 25,
            color: idleIconColor ?? Colors.white,
          ),
        ),
        complete: refreshStatue('refresh-complete', Icons.done),
        failed: refreshStatue('refresh-failed', Icons.close),
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            // body = Text("pull-up-load".tr());
            body = Text(
              "${"تم العثور على"} $listLength ${"من الاشخاص"}",
            );
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("لم نتمكن من العثور لا اشخاص");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("");
          } else {
            body = const Text("");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: controller!,
      onRefresh: () {
        onRefresh!.call();
      },
      onLoading: () {
        onLoading!.call();
      },
      child: child,
    );
  }

  Widget refreshStatue(String refreshStatue, IconData icon) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
          ),
          Container(
            width: 15.0,
          ),
          Text(
            refreshStatue,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );
}
