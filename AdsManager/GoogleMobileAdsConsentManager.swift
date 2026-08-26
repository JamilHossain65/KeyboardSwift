//
//  GoogleMobileAdsConsentManager.swift
//  KeyboardSwift
//
//  Created by Jamil on 29/3/26.
//

import Foundation
import GoogleMobileAds
import UserMessagingPlatform

@MainActor
class GoogleMobileAdsConsentManager: NSObject {
  static let shared = GoogleMobileAdsConsentManager()

  var canRequestAds: Bool {
      return UMPConsentInformation.sharedInstance.canRequestAds
  }

  var isPrivacyOptionsRequired: Bool {
      return UMPConsentInformation.sharedInstance.privacyOptionsRequirementStatus == .required
  }

  /// Helper method to call the UMP SDK methods to request consent information and load/present a
  /// consent form if necessary.
    func gatherConsent(
      from viewController: UIViewController? = nil,
      consentGatheringComplete: @escaping @MainActor (Error?) -> Void
    ) {
        let parameters = UMPRequestParameters()

      // For testing purposes, you can use UMPDebugGeography to simulate a location.
        let debugSettings = UMPDebugSettings()
      // debugSettings.geography = DebugGeography.EEA
      #if DEBUG
        debugSettings.geography = UMPDebugGeography.EEA
      #endif  // DEBUG
        
      parameters.debugSettings = debugSettings

      // Requesting an update to consent information should be called on every app launch.
        UMPConsentInformation.sharedInstance.requestConsentInfoUpdate(with: parameters) {
        requestConsentError in
        guard requestConsentError == nil else {
          Task { @MainActor in
            consentGatheringComplete(requestConsentError)
          }
          return
        }

        Task { @MainActor in
          do {
              try await UMPConsentForm.loadAndPresentIfRequired(from: viewController)
            // Consent has been gathered.
            consentGatheringComplete(nil)
          } catch {
            consentGatheringComplete(error)
          }
        }
      }
    }

  /// Helper method to call the UMP SDK method to present the privacy options form.
  @MainActor func presentPrivacyOptionsForm(from viewController: UIViewController? = nil)
    async throws
  {
      try await UMPConsentForm.presentPrivacyOptionsForm(from: viewController)
  }

}
