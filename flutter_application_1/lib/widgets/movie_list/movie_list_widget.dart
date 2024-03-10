import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/resourses/app_images.dart';
import 'package:flutter_application_1/theme/app_color.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemExtent: 160,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                 // border: Border.all(color: Color.fromARGB(91, 71, 69, 69)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(49, 70, 70, 70),
                      blurRadius: 15,
                    ),
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    Image(image: AssetImage(AppImages.moviePlaceholder)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12),
                          Text("Movie name (2024)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text("Genre/Genre, 1h 37m",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.middleGrey)),
                              
                          SizedBox(height: 8),
                          Text(
                              "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.lightGrey)
                          ),
                          Expanded(
                            child: 
                            Row(
                              children: [
                                Icon(
                                  Icons.visibility_outlined,
                                  color:AppColor.iconsGrey,
                                ),
                                Text("102,3k", style: TextStyle(fontSize: 12, color: AppColor.iconsGrey)),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.star_half_outlined,
                                  color: Color.fromARGB(255, 255, 199, 0),
                                ),
                                Text("8,9", style: TextStyle(fontSize: 12, color: AppColor.iconsGrey),),
                                Expanded(
                                  child:Container(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                    Icons.favorite_outline,
                                    color: AppColor.mainPurple,
                                    )
                                  ),
                                )
                                
                              ],
                            ),
                          ),
                        
                        ],
                      )
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ));
        });
  }
}
