//
//  ArticleCellView.swift
//  AccessibleNews
//
//  Created by Nika Jamatashvili on 28.12.23.
//

import SwiftUI

struct ArticleCellView: View {
    // MARK: Properties
    var news: News
    @Environment(\.sizeCategory) var sizeCategory: ContentSizeCategory
    
    let headlineFont = Font.headline.bold()
    let subheadlineFont = Font.subheadline
    let captionFont = Font.caption
    
    // MARK: Body
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text(news.title)
                    .font(.headline)
                    .lineLimit(1)
                    .foregroundColor(Color.primary)
                    .multilineTextAlignment(.leading)
                    .adaptiveFont(size: 18)
                    .accessibility(label: Text("Title: \(news.title)"))
                
                Text(news.description)
                    .font(.subheadline)
                    .lineLimit(3)
                    .foregroundColor(Color.primary.opacity(0.72))
                    .multilineTextAlignment(.leading)
                    .adaptiveFont(size: 14)
                    .accessibility(label: Text("Description: \(news.description)"))
            }
            
            HStack {
                Text(news.source)
                    .accessibility(label: Text("Source: \(news.source)"))
                Spacer()
            }
            .font(.caption)
            .foregroundColor(Color.primary.opacity(0.64))
            .adaptiveFont(size: 14)
        }
        .padding(12)
        .accessibilityElement(children: .combine)
        
    }
}

// MARK: Extension for font size change
extension View {
    func adaptiveFont(size: CGFloat) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return self.font(.system(size: scaledSize))
    }
}
