import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/models/userInfo_model.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/account_page.dart';
import 'package:pinterest_clone/storage/storage.dart';

import '../../../services/userInfo_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<UserInfoModel> info = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountPage(),
                ),
              ),
              icon: const Icon(
                Icons.settings,
                size: 25,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                FutureBuilder(
                    future: UserInfoService.getPhotos(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        EasyLoading.show();
                        return const SizedBox();
                      } else if (snapshot.hasData) {
                        snapshot.data?.fold((l) {
                          EasyLoading.showError(l);
                        }, (r) {
                          EasyLoading.dismiss();
                          //UserInfoModel infoModel = r;
                          info.add(r);
                        });
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 65,
                              child: Center(
                                child: Text(
                                  info[0].name[0],
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              info[0].name.toString(),
                              style: const TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              info[0].username.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${info[0].followersCount} followers . ${info[0].followingCount} following',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                                width: 180,
                                height: 50,
                                child: AppBar(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  bottom: const TabBar(
                                      indicatorWeight: 3,
                                      indicatorPadding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      tabs: [
                                        Tab(
                                          text: 'Created',
                                        ),
                                        Tab(
                                          text: 'Saved',
                                        ),
                                      ]),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: (MediaQuery.of(context).size.height * 0.332 * box!.values.length) / 2,
                              child: TabBarView(children: [
                                Container(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      const Text(
                                        'Inspire with an Idea Pin',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(shape: const StadiumBorder(), backgroundColor: const Color.fromARGB(255, 235, 21, 21)),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 12),
                                              child: Text(
                                                'Create',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.83,
                                                height: 43,
                                                child: TextFormField(
                                                  textAlignVertical: TextAlignVertical.bottom,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  cursorColor: Colors.red,
                                                  cursorHeight: 25,
                                                  decoration: const InputDecoration(
                                                    hintText: 'Search your Pins',
                                                    prefixIcon: Icon(
                                                      Icons.search,
                                                    ),
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                      borderSide: BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SafeArea(
                                          child: MasonryGridView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              itemCount: box!.values.length,
                                              //physics: ClampingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return box!.isNotEmpty
                                                    ? Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(15),
                                                              child: Image(image: NetworkImage(box!.getAt(index)!.urls!.small!)),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      const Icon(
                                                                        Icons.favorite,
                                                                        color: Color.fromARGB(255, 211, 14, 14),
                                                                        size: 15,
                                                                      ),
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width * 0.3,
                                                                        child: Text(
                                                                          // ignore: unnecessary_null_comparison
                                                                          box!.getAt(index)!.description ?? 'Likes',
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style: const TextStyle(
                                                                            fontSize: 12,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  IconButton(
                                                                      onPressed: () {},
                                                                      icon: const Icon(
                                                                        Icons.more_horiz,
                                                                      ))
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    : const Center(
                                                        child: Text(
                                                          'You haven\'t saved media',
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            )
                          ],
                        );
                      } else {
                        return Text("Error: ${snapshot.error}");
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
