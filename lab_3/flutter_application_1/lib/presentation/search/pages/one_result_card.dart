import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/content_type_enum.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/search_item.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/widgets/one_card.dart';
import 'package:flutter_application_1/shared/widgets/one_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OneResultCard extends StatelessWidget {
  const OneResultCard({super.key, required this.search});
  final SearchItem search;

  @override
  Widget build(BuildContext context) {
    // Ініціалізуємо кубіт деталей медіа
    final MediaDetailsCubit bloc = BlocProvider.of<MediaDetailsCubit>(context);
    return OneCard(
      onTap: () {
        // Перевіряємо тип контенту медіа: фільм або серіал
        if (search.mediaType == ContentTypeEnum.movies) {
          // Якщо тип - фільм, встановлюємо ID фільму в кубіт
          bloc.setMovie(search.id);
        } else if (search.mediaType == ContentTypeEnum.tvShows) {
          // Якщо тип - серіал, встановлюємо ID серіалу в кубіт
          bloc.setTVShow(search.id);
        }
        // Переходимо на екран деталей медіа
        context.pushNamed(MainRouteName.movieDetails);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusConstants.normal)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusConstants.normal),
          color: Colors.white,
        ),
        height: PaddingConstants.extraImmense * 2,
        child: Row(
          children: [
            SizedBox(
              width: PaddingConstants.extraImmense * 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(BorderRadiusConstants.normal),
                  bottomLeft: Radius.circular(BorderRadiusConstants.normal),
                ),
                child: OneImage(
                  radius:
                      BorderRadius.circular(BorderRadiusConstants.superSmall),
                  imageLink: search.imageUrl,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(PaddingConstants.extraSmall),
                child: Text(search.name,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
