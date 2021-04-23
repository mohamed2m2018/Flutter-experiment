import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, int number) => buildImage(images[number]),
      itemCount: images?.length,
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Image.network(image?.url),
          ),
          Text(image?.title ?? 'Sorry no description for this image'),
        ],
      ),
    );
  }
}
