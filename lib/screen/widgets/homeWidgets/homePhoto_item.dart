import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/models/allAlbum.model.dart';
import 'package:pinterest_clone/screen/pages/others/SearchEterPage.dart';
import 'package:pinterest_clone/screen/pages/others/homePhotoEnter.dart';
import 'package:pinterest_clone/storage/storage.dart';

import '../../../models/SearchModel.dart';

Widget homeItem1(AllPhotoModel model, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePhotoEnter(model)));
    },
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: model.urls!.small!,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 30,
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: CachedNetworkImageProvider(model.user!.profileImage!.small!),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                model.user!.name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Color.fromARGB(255, 218, 216, 216),
                      )),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget searchItem(Result post, BuildContext context) {
  return InkWell(
    onTap: () {
      searchedPhotos!.add(post.description!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPhotoEnter(post),
        ),
      );
    },
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            image: NetworkImage(post.urls!.small!),
          ),
        ),
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Type',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Color.fromARGB(255, 218, 216, 216),
                  ))
            ],
          ),
        )
      ],
    ),
  );
}
