//
//  Font+.swift
//  Swiftcord
//
//  Created by Vincent Kwok on 27/2/22.
//
//  Make fonts more closely match

import SwiftUI

extension Font {
    // Large title
    public static var largeTitle: Font {
		let size = NSFont.preferredFont(forTextStyle: .largeTitle).pointSize * fontScale
		return Font.custom("Ginto Bold", size: size, relativeTo: .largeTitle)
    }

    // Headline
    public static var headline: Font {
		let size = NSFont.preferredFont(forTextStyle: .headline).pointSize * fontScale
		return Font.custom("Ginto Medium", size: size, relativeTo: .headline)
    }

    // Titles
    public static var title: Font {
		let size = NSFont.preferredFont(forTextStyle: .title1).pointSize * fontScale
		return Font.custom("Ginto Bold", size: size, relativeTo: .title)
    }
    public static var title2: Font {
		let size = NSFont.preferredFont(forTextStyle: .title2).pointSize * fontScale
		return Font.custom("Ginto Medium", size: size, relativeTo: .title2)
    }
    public static var title3: Font {
		let size = NSFont.preferredFont(forTextStyle: .title3).pointSize * fontScale
		return Font.custom("Ginto Medium", size: size, relativeTo: .title3)
    }
	
	// Message
	public static var appMessage: Self {
		let defaultFont: NSFont = .labelFont(ofSize: 15)
		let fontSize = defaultFont.pointSize
		let scaledFontSize = fontSize * fontScale
		
		if #available(macOS 13.0, *) {
			return .system(size: scaledFontSize, weight: .regular, design: isEnabledRoundedFont ? .rounded : .none)
		} else {
			return .system(size: scaledFontSize, weight: .regular)
		}
	}
}

// MARK: - Helpers
private extension Font {
	static var fontScale: CGFloat {
		@AppStorage("fontSizeScale") var fontScale = 1.0
		return CGFloat(fontScale)
	}
	
	static var isEnabledRoundedFont: Bool {
		@AppStorage("isEnabledRoundedFont") var isEnabledRoundedFont = false
		return isEnabledRoundedFont
	}
}
