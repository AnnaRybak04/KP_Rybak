import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive/responsive_layout.dart';
import 'package:flutter_application_1/theme/app_color.dart';
import 'package:flutter_application_1/widgets/media_grid.dart';
import 'package:flutter_application_1/widgets/media_page.dart';
import 'package:flutter_application_1/widgets/search_widget.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: ResponsiveLayout.isDesktopScreen(context)
          ? Container()
          : PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text("Фільми"),
                ),
                const PopupMenuItem(
                  child: Text("Серіали"),
                ),
                const PopupMenuItem(
                  child: Text("Мультфільми"),
                ),
                const PopupMenuItem(
                  child: Text("Інше"),
                )
              ],
              onSelected: (value) {
                // Handle menu item selection
              },
            ),
      title: !ResponsiveLayout.isDesktopScreen(context)
          ? const Center(
              child: Text(
                "MovieTime",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            )
          : Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "MovieTime",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MediaPage(
                                          type_of_content: 'movies',
                                        )),
                              );
                            },
                            child: const Text(
                              "Фільми",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              //  Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => TVShowsPage()),
                              // );
                            },
                            child: const Text("Серіали",
                                style: TextStyle(
                                  color: Colors.white,
                                ))),
                        TextButton(
                            onPressed: () {},
                            child: const Text("Мультфільми",
                                style: TextStyle(
                                  color: Colors.white,
                                ))),
                        TextButton(
                            onPressed: () {},
                            child: const Text("Інше",
                                style: TextStyle(
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      actions: [
        ResponsiveLayout.isDesktopScreen(context)
            ? Padding(
                padding: const EdgeInsets.only(right: 36.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        //  showSearch(context: context, delegate: SearchWidget());
                      },
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    IconButton(
                      icon: const Icon(Icons.star_border_outlined),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    // IconButton(
                    //   icon: const Icon(Icons.favorite_border),
                    //   onPressed: () {
                    //    Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>  MediaPage()
                    //           ),
                    //     );
                    //   },
                    // )
                  ],
                ))
            : Padding(
                padding: const EdgeInsets.only(right: 36.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        //   showSearch(context: context, delegate: SearchWidget());

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const SearchPage()),
                        // );
                      },
                    ),
                    PopupMenuButton(
                      icon: const Icon(Icons.account_circle_outlined),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                            child: Row(
                          children: [
                            Icon(Icons.star_outline,
                                color: AppColor.mainPurple),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Оцінене",
                              style: TextStyle(color: AppColor.mainPurple),
                            )
                          ],
                        )),
                        const PopupMenuItem(
                            child: Row(children: [
                          Icon(
                            Icons.favorite_border,
                            color: AppColor.mainPurple,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Збережене",
                              style: TextStyle(color: AppColor.mainPurple)),
                        ])),
                      ],
                      onSelected: (value) {},
                    ),
                  ],
                ))
      ],
      backgroundColor: AppColor.mainPurple,
      foregroundColor: Colors.white,
    );
