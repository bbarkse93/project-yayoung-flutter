import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class NoticeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(110);

  const NoticeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: iconArrowBack(mColor: kBlack,mSize: gapSemiMedium),
      ),
      title: Center(child: Text("고객센터", style: title3())),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: InkWell(
            onTap: (){
            },
            child: Container(
              child: SizedBox(width: gapMediumLarge,),
            ),
          ),
        )
      ],
      bottom: TabBar(
        indicatorColor: kPrimaryColor,
        tabs: [
          Tab(
            child: Text("FAQ", style: subTitle1()),
          ),
          Tab(
            child: Text("공지사항", style: subTitle1()),
          ),
        ],
      ),
    );
  }

}
