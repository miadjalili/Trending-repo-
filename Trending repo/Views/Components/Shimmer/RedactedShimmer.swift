//
//  RedactedShimmer.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-05-14.
//
import SwiftUI
import Foundation


public struct RedactAndShimmerViewModifier: ViewModifier {
    private let Condition: Bool
    init(Condition: Bool) {
        self.Condition = Condition
    }
    
    public func body(content: Content) -> some View {
        if Condition {
            content
                .redacted(reason: .placeholder)
                .shimmering()
        }else {
            content
        }
    }
}



extension View {
    public func redactShimmer(condition: Bool) -> some View {
        modifier(RedactAndShimmerViewModifier(Condition: condition))
    }
}
