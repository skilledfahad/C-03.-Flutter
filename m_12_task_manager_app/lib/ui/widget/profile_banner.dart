import 'package:flutter/material.dart';

import '../../data/utils/auth_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: CircleAvatar(
       child: ClipOval(
         child: CachedNetworkImage(
           placeholder: (context, url) => Image.asset('assets/images/img.png'),
           imageUrl: AuthUtils.userInfo.data?.photo ?? '',
           errorWidget: (context, url, error) => Image.asset('assets/images/img.png'), //const Icon(Icons.person),
         ),
       ),
      ),

      title: Text("${AuthUtils.userInfo.data?.firstName ?? "##"} ${AuthUtils.userInfo.data?.lastName ?? "##"}",
          style: const TextStyle(color: Colors.white)),

      subtitle: Text(AuthUtils.userInfo.data?.email ?? "##",style: const TextStyle(color: Colors.white)),
    );
  }
}
