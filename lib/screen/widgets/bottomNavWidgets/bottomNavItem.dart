import 'package:flutter/material.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/account_page.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/add.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/chat.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/home.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/search.dart';
import 'package:rive/rive.dart';

import '../../../main.dart';

Widget bottomNavItem(int index, String bottomIcon, void Function() setUI, BuildContext context) {
  return InkWell(
    onTap: () {
      index != 2 ? b = index : b;
      index == 2
          ? showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  height: 210,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close,
                              ),
                            ),
                            const Text(
                              'Start creating now',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.all_inbox_rounded,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Idea Pin',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.pin_drop,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Pin',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.pages_rounded,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Board',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          : null;
      setUI();
    },
    child: SizedBox(
      height: 50,
      width: 40,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 5,
            child: GestureDetector(
              child: AnimatedContainer(
                height: b == index ? 4 : 0,
                width: b == index ? 30 : 0,
                alignment: Alignment.center,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOutExpo,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          RiveAnimation.asset(
            'assets/1298-2487-animated-icon-set-1-color.riv',
            artboard: bottomIcon,
            onInit: (artboard) {},
          ),
        ],
      ),
    ),
  );
}

List list = [
  'HOME',
  'SEARCH',
  'SETTINGS',
  'CHAT',
  'USER',
];
List<StatefulWidget> pages = [
  const HomePage(),
  const SearchPage(),
  const AddPage(),
  const ChatPage(),
  const AccountPage(),
];
