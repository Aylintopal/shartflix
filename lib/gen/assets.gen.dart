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

  /// File path: assets/animations/artboard.json
  String get artboard => 'assets/animations/artboard.json';

  /// List of all assets
  List<String> get values => [artboard];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/diamond.png
  AssetGenImage get diamond => const AssetGenImage('assets/png/diamond.png');

  /// File path: assets/png/heart.png
  AssetGenImage get heart => const AssetGenImage('assets/png/heart.png');

  /// File path: assets/png/top_arrow.png
  AssetGenImage get topArrow => const AssetGenImage('assets/png/top_arrow.png');

  /// File path: assets/png/two_heart.png
  AssetGenImage get twoHeart => const AssetGenImage('assets/png/two_heart.png');

  /// List of all assets
  List<AssetGenImage> get values => [diamond, heart, topArrow, twoHeart];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/Apple.svg
  String get apple => 'assets/svg/Apple.svg';

  /// File path: assets/svg/Arrow.svg
  String get arrow => 'assets/svg/Arrow.svg';

  /// File path: assets/svg/Facebook.svg
  String get facebook => 'assets/svg/Facebook.svg';

  /// File path: assets/svg/Gem.svg
  String get gem => 'assets/svg/Gem.svg';

  /// File path: assets/svg/Google.svg
  String get google => 'assets/svg/Google.svg';

  /// File path: assets/svg/Heart-fill.svg
  String get heartFill => 'assets/svg/Heart-fill.svg';

  /// File path: assets/svg/Heart.svg
  String get heart => 'assets/svg/Heart.svg';

  /// File path: assets/svg/Hide.svg
  String get hide => 'assets/svg/Hide.svg';

  /// File path: assets/svg/Home-fill.svg
  String get homeFill => 'assets/svg/Home-fill.svg';

  /// File path: assets/svg/Home.svg
  String get home => 'assets/svg/Home.svg';

  /// File path: assets/svg/Lock.svg
  String get lock => 'assets/svg/Lock.svg';

  /// File path: assets/svg/Mail.svg
  String get mail => 'assets/svg/Mail.svg';

  /// File path: assets/svg/Plus.svg
  String get plus => 'assets/svg/Plus.svg';

  /// File path: assets/svg/Profile-fill.svg
  String get profileFill => 'assets/svg/Profile-fill.svg';

  /// File path: assets/svg/Profile.svg
  String get profile => 'assets/svg/Profile.svg';

  /// File path: assets/svg/See.svg
  String get see => 'assets/svg/See.svg';

  /// File path: assets/svg/User.svg
  String get user => 'assets/svg/User.svg';

  /// File path: assets/svg/X.svg
  String get x => 'assets/svg/X.svg';

  /// File path: assets/svg/gradient_logo.svg
  String get gradientLogo => 'assets/svg/gradient_logo.svg';

  /// File path: assets/svg/logo.svg
  String get logo => 'assets/svg/logo.svg';

  /// File path: assets/svg/vector.svg
  String get vector => 'assets/svg/vector.svg';

  /// File path: assets/svg/white_logo.svg
  String get whiteLogo => 'assets/svg/white_logo.svg';

  /// List of all assets
  List<String> get values => [
    apple,
    arrow,
    facebook,
    gem,
    google,
    heartFill,
    heart,
    hide,
    homeFill,
    home,
    lock,
    mail,
    plus,
    profileFill,
    profile,
    see,
    user,
    x,
    gradientLogo,
    logo,
    vector,
    whiteLogo,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/tr.json
  String get tr => 'assets/translations/tr.json';

  /// List of all assets
  List<String> get values => [en, tr];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();

  /// List of all assets
  static List<String> get values => [aEnv];
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
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
