import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static final String _androidDebugAppId =
      'ca-app-pub-3940256099942544~3347511713';
  static final String _androidReleaseAppId =
      'ca-app-pub-3129438966237121~4065166841';

  static final String _androidDebugBannerId =
      'ca-app-pub-3940256099942544/6300978111';
  static final String _androidDebugInterstitialId =
      'ca-app-pub-3940256099942544/1033173712';
  static final String _androidDebugRewardedId =
      'ca-app-pub-3940256099942544/5224354917';

  static final String _androidReleaseBannerId =
      'ca-app-pub-3129438966237121/2804056067';
  static final String _androidReleaseInterstitialId =
      'ca-app-pub-3129438966237121/1494843829';
  static final String _androidReleaseRewardedId =
      'ca-app-pub-3129438966237121/3769990080';

  static final String _iosDebugAppId = 'ca-app-pub-3940256099942544~3347511713';
  static final String _iosReleaseAppId = 'ca-app-pub-3129438966237121~9700973611';

  static final String _iosDebugBannerId =
      'ca-app-pub-3940256099942544/2934735716';
  static final String _iosReleaseBannerId =
      'ca-app-pub-3129438966237121/1143826745';

  static final String _iosDebugInterstitialId =
      'ca-app-pub-3940256099942544/4411468910';
  static final String _iosReleaseInterstitialId =
      'ca-app-pub-3129438966237121/7074810270';

  static final String _iosDebugRewardedId =
      'ca-app-pub-3940256099942544/1712485313';
  static final String _iosReleaseRewardedId =
      'ca-app-pub-3129438966237121/7864811059';

  static InterstitialAd? _interstitialAd;
  static RewardedAd? _rewardedAd;

  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  static bool get _useReleaseAds => kReleaseMode;

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return _useReleaseAds ? _androidReleaseBannerId : _androidDebugBannerId;
    }
    if (Platform.isIOS) {
      return _useReleaseAds ? _iosReleaseBannerId : _iosDebugBannerId;
    }
    return _androidDebugBannerId;
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return _useReleaseAds ? _androidReleaseInterstitialId : _androidDebugInterstitialId;
    }
    if (Platform.isIOS) {
      return _useReleaseAds ? _iosReleaseInterstitialId : _iosDebugInterstitialId;
    }
    return _androidDebugInterstitialId;
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return _useReleaseAds ? _androidReleaseRewardedId : _androidDebugRewardedId;
    }
    if (Platform.isIOS) {
      return _useReleaseAds ? _iosReleaseRewardedId : _iosDebugRewardedId;
    }
    return _androidDebugRewardedId;
  }

  static String get androidAppId {
    return _useReleaseAds ? _androidReleaseAppId : _androidDebugAppId;
  }

  static String get iosAppId {
    return _useReleaseAds ? _iosReleaseAppId : _iosDebugAppId;
  }

  // Interstitial
  static Future<void> loadInterstitial() async {
    await InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          _interstitialAd = null;
        },
      ),
    );
  }

  static Future<void> showInterstitial({void Function()? onAdDismissed}) async {
    final ad = _interstitialAd;
    if (ad == null) {
      onAdDismissed?.call();
      return;
    }

    final completer = Completer<void>();

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _interstitialAd = null;
        loadInterstitial();
        onAdDismissed?.call();
        if (!completer.isCompleted) {
          completer.complete();
        }
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _interstitialAd = null;
        if (!completer.isCompleted) {
          completer.complete();
        }
      },
    );

    ad.show();
    return completer.future;
  }

  // Rewarded
  static Future<void> loadRewarded() async {
    await RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          _rewardedAd = null;
        },
      ),
    );
  }

  static Future<bool> showRewarded() async {
    final ad = _rewardedAd;
    if (ad == null) return false;

    final completer = Completer<bool>();
    var granted = false;

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _rewardedAd = null;
        loadRewarded();
        if (!completer.isCompleted) {
          completer.complete(granted);
        }
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _rewardedAd = null;
        if (!completer.isCompleted) {
          completer.complete(false);
        }
      },
    );

    ad.show(
      onUserEarnedReward: (ad, reward) {
        granted = true;
      },
    );

    return completer.future;
  }

  // Helpers for Banner creation
  static BannerAd createBannerAd({AdSize size = AdSize.banner}) {
    return BannerAd(
      size: size,
      adUnitId: bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );
  }
}
