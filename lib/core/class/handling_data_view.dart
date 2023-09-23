import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app_with_getx/core/class/status_request.dart';
import 'package:flutter_weather_app_with_getx/core/constant/image_asset.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            heightFactor: 3,
            child: SpinKitDoubleBounce(
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child:
                    Lottie.asset(ImageAsset.offline, height: 250, width: 250))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(ImageAsset.noData,
                        height: 250, width: 250),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(ImageAsset.noData,
                            height: 250, width: 250))
                    : widget;
  }
}
