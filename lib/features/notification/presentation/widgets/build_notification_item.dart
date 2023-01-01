import 'package:flutter/material.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/notification/domain/entities/notification.dart';

class BuildNotificationItem extends StatelessWidget {
  final DataDetails dataDetails;
  const BuildNotificationItem({Key? key,required this.dataDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dataDetails.title.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Text(
              dataDetails.message.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
