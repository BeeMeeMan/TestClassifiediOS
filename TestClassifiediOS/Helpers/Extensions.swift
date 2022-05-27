//
//  Extensions.swift
//  TestClassifiediOS
//
//  Created by Korsun Yevhenii on 26.05.2022.
//

import SwiftUI

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}

extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
    static var statusBarHeight: CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    static var isSmallScreen: Bool {
        UIDevice().userInterfaceIdiom == .phone &&  UIScreen.main.nativeBounds.height <= 1334
    }
}
