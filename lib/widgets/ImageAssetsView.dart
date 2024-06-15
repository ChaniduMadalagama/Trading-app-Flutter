import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageAssetsView extends StatelessWidget {
  String? imageUrl;
  String? errorImageAsset;
  double? height;
  double? width;
  double? errorImageAssetHeight;
  double? errorImageAssetWidth;
  double? borderRadius;
  BoxFit? boxFit;
  Alignment? imageAlignment;

  ImageAssetsView({

    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
    this.boxFit,
    this.imageAlignment,
    this.errorImageAsset,
    this.errorImageAssetHeight,
    this.errorImageAssetWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius!),
      child: Image.asset(
        imageUrl!,
        height: height,
        width: width,
        fit: boxFit,
        errorBuilder: (context, error, stackTrace) {
          print("Error >> $error");
          return Image.asset(
            errorImageAsset.toString(),
            width: errorImageAssetWidth,
            height: errorImageAssetHeight,
          );
        },
      ),
    );
  }
}
