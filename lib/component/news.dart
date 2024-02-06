import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final String? title, image, description, date;
  const News({super.key, this.title, this.image, this.description, this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: AspectRatio(aspectRatio: 4 / 3,
                child: FancyShimmerImage(boxFit : BoxFit.cover, imageUrl: image ?? '')
            ),
          ),
          SizedBox(width: 10),
          Expanded(
              child: Column(
                children: [
                  Text(title ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis
                  ),

                  Padding(padding: EdgeInsets.only(top: 5)),

                  Text(description ?? '',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text(date ?? '',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              )
          )
        ],
      ),
    );
  }
}
