// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/lottie_loading.json
  String get lottieLoading => 'assets/animations/lottie_loading.json';

  /// List of all assets
  List<String> get values => [lottieLoading];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/activity_icon.svg
  String get activityIcon => 'assets/icons/activity_icon.svg';

  /// File path: assets/icons/back.svg
  String get back => 'assets/icons/back.svg';

  /// File path: assets/icons/deposit_white.svg
  String get depositWhite => 'assets/icons/deposit_white.svg';

  /// File path: assets/icons/incoming.svg
  String get incoming => 'assets/icons/incoming.svg';

  /// File path: assets/icons/notification_black.svg
  String get notificationBlack => 'assets/icons/notification_black.svg';

  /// File path: assets/icons/transfer.svg
  String get transfer => 'assets/icons/transfer.svg';

  /// File path: assets/icons/transfering.svg
  String get transfering => 'assets/icons/transfering.svg';

  /// List of all assets
  List<String> get values => [
        activityIcon,
        back,
        depositWhite,
        incoming,
        notificationBlack,
        transfer,
        transfering
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg_prod_details_1.png
  AssetGenImage get bgProdDetails1 =>
      const AssetGenImage('assets/images/bg_prod_details_1.png');

  /// File path: assets/images/bg_prod_details_2.png
  AssetGenImage get bgProdDetails2 =>
      const AssetGenImage('assets/images/bg_prod_details_2.png');

  /// File path: assets/images/bg_prod_details_3.png
  AssetGenImage get bgProdDetails3 =>
      const AssetGenImage('assets/images/bg_prod_details_3.png');

  /// File path: assets/images/bg_prod_details_4.png
  AssetGenImage get bgProdDetails4 =>
      const AssetGenImage('assets/images/bg_prod_details_4.png');

  /// File path: assets/images/bg_prod_details_5.png
  AssetGenImage get bgProdDetails5 =>
      const AssetGenImage('assets/images/bg_prod_details_5.png');

  /// File path: assets/images/bg_product_1.png
  AssetGenImage get bgProduct1 =>
      const AssetGenImage('assets/images/bg_product_1.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bgProdDetails1,
        bgProdDetails2,
        bgProdDetails3,
        bgProdDetails4,
        bgProdDetails5,
        bgProduct1
      ];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
