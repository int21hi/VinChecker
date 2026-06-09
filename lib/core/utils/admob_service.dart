import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static final String _androidBannerId =
      'ca-app-pub-3940256099942544/6300978111';
  static final String _iosBannerId = 'ca-app-pub-3940256099942544/2934735716';

  static final String _androidInterstitialId =
      'ca-app-pub-3940256099942544/1033173712';
  static final String _iosInterstitialId =
      'ca-app-pub-3940256099942544/4411468910';

  static final String _androidRewardedId =
      'ca-app-pub-3940256099942544/5224354917';
  static final String _iosRewardedId = 'ca-app-pub-3940256099942544/1712485313';

  static InterstitialAd? _interstitialAd;
  static RewardedAd? _rewardedAd;

  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) return _androidBannerId;
    if (Platform.isIOS) return _iosBannerId;
    return _androidBannerId;
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) return _androidInterstitialId;
    if (Platform.isIOS) return _iosInterstitialId;
    return _androidInterstitialId;
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) return _androidRewardedId;
    if (Platform.isIOS) return _iosRewardedId;
    return _androidRewardedId;
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

  static void showInterstitial() {
    final ad = _interstitialAd;
    if (ad == null) return;
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        _interstitialAd?.dispose();
        _interstitialAd = null;
        loadInterstitial();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _interstitialAd?.dispose();
        _interstitialAd = null;
      },
    );
    ad.show();
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

  static void showRewarded(Function(RewardItem) onRewarded) {
    final ad = _rewardedAd;
    if (ad == null) return;
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        _rewardedAd?.dispose();
        _rewardedAd = null;
        loadRewarded();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _rewardedAd?.dispose();
        _rewardedAd = null;
      },
    );
    ad.show(
      onUserEarnedReward: (ad, reward) {
        onRewarded(reward);
      },
    );
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
