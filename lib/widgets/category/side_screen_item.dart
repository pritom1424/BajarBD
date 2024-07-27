import '../../provider/providers.dart';
import '../../utils/Appvars/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideScreenItem extends ConsumerWidget {
  final String categoryIcon;
  final String catName;
  final int index;
  final int itemNumber;
  const SideScreenItem(
      {super.key,
      required this.categoryIcon,
      required this.catName,
      required this.index,
      required this.itemNumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(categoryPageProvider).setItemNumber(itemNumber);
    /*    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryPageProvider).setItemNumber(itemNumber);
    }); */
    ref.listen(categoryPageProvider, (previous, next) {
      print("ref listen ${next.itemNumber}");
    });
    return InkWell(
      onTap: () {
        ref.watch(categoryPageProvider).setClick(true, index, itemNumber);
        print(ref.read(categoryPageProvider).clickBool);
      },
      autofocus: false,
      child: Container(
        color: (ref.watch(categoryPageProvider).isClicked(index))
            ? Colors.white
            : const Color.fromARGB(255, 197, 194, 194),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: (categoryIcon.isEmpty)
                      ? Image.asset(AppConstants.appPlaceHolder)
                      : Image.network(categoryIcon),
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              catName,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
