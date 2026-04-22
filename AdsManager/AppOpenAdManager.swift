//
//  AppOpenAdManager.swift
//  KeyboardSwift
//
//  Created by Jamil on 29/3/26.
//

@preconcurrency import GoogleMobileAds

@MainActor
// [START app_open_ad_manager_delegate]
protocol AppOpenAdManagerDelegate: AnyObject {
  /// Method to be invoked when an app open ad life cycle is complete (i.e. dismissed or fails to
  /// show).
  func appOpenAdManagerAdDidComplete(_ appOpenAdManager: AppOpenAdManager)
}
// [END app_open_ad_manager_delegate]

@MainActor
// [START app_open_ad_manager]
class AppOpenAdManager: NSObject {
  /// The app open ad.
  var appOpenAd: AppOpenAd?
  /// Maintains a reference to the delegate.
  weak var appOpenAdManagerDelegate: AppOpenAdManagerDelegate?
  /// Keeps track of if an app open ad is loading.
  var isLoadingAd = false
  /// Keeps track of if an app open ad is showing.
  var isShowingAd = false
  /// Keeps track of the time when an app open ad was loaded to discard expired ad.
  var loadTime: Date?
  /// For more interval details, see https://support.google.com/admob/answer/9341964
  let timeoutInterval: TimeInterval = 4 * 3_600

  static let shared = AppOpenAdManager()
  // [END app_open_ad_manager]

  // [START ad_expiration]
  private func wasLoadTimeLessThanNHoursAgo(timeoutInterval: TimeInterval) -> Bool {
    // Check if ad was loaded more than n hours ago.
    if let loadTime = loadTime {
      return Date().timeIntervalSince(loadTime) < timeoutInterval
    }
    return false
  }

  private func isAdAvailable() -> Bool {
    // Check if ad exists and can be shown.
    return appOpenAd != nil && wasLoadTimeLessThanNHoursAgo(timeoutInterval: timeoutInterval)
  }
  // [END ad_expiration]

  // [START load_ad]
  func loadAd() async {
    // Do not load ad if there is an unused ad or one is already loading.
    if isLoadingAd || isAdAvailable() {
      return
    }
    isLoadingAd = true

    do {
      appOpenAd = try await AppOpenAd.load(
        with: appOpenAdKey, request: Request())
      // [START set_delegate]
      appOpenAd?.fullScreenContentDelegate = self
      // [END set_delegate]
      loadTime = Date()
    } catch {
      print("App open ad failed to load with error: \(error.localizedDescription)")
      appOpenAd = nil
      loadTime = nil
    }
    isLoadingAd = false
  }
  // [END load_ad]

  // [START show_ad]
  func showAdIfAvailable() {
    // If the app open ad is already showing, do not show the ad again.
    if isShowingAd {
      return print("App open ad is already showing.")
    }

    // If the app open ad is not available yet but is supposed to show, load
    // a new ad.
    if !isAdAvailable() {
      print("App open ad is not ready yet.")
      // The app open ad is considered to be complete in this example.
      appOpenAdManagerDelegate?.appOpenAdManagerAdDidComplete(self)
      // Load a new ad.
      // [START_EXCLUDE silent]
        
        if GoogleMobileAdsConsentManager.shared.canRequestAds {
        Task {
          await loadAd()
        }
      }
      // [END_EXCLUDE]
      return
    }

    if let appOpenAd {
        if isAlreadyShowingAd { return }
        appOpenAd.present(from: nil)
        currentAdUnit = .INTERSTITIAL
        isShowingAd = true
        isAlreadyShowingAd = true
    }
  }
  // [END show_ad]
}

extension AppOpenAdManager: FullScreenContentDelegate {
  // [START ad_events]
  func adDidRecordImpression(_ ad: FullScreenPresentingAd) {
    print("App open ad recorded an impression.")
  }

  func adDidRecordClick(_ ad: FullScreenPresentingAd) {
    print("App open ad recorded a click.")
  }

  func adWillDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
    print("App open ad will be dismissed.")
  }

  func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
    print("App open ad will be presented.")
  }

  func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
    print("App open ad was dismissed.")
    appOpenAd = nil
    isShowingAd = false
    isAlreadyShowingAd = false
    appOpenAdManagerDelegate?.appOpenAdManagerAdDidComplete(self)
    Task {
      await loadAd()
    }
  }

  func ad(_ ad: FullScreenPresentingAd,didFailToPresentFullScreenContentWithError error: Error) {
    print("App open ad failed to present with error: \(error.localizedDescription)")
    appOpenAd = nil
    isShowingAd = false
    isAlreadyShowingAd = false
    appOpenAdManagerDelegate?.appOpenAdManagerAdDidComplete(self)
    Task {
      await loadAd()
    }
  }
  // [END ad_events]
}

