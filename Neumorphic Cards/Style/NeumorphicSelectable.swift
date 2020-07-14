//
//  NeumorphicSelectable.swift
//  Neumorphic Cards
//
//  Created by Iván GalazJeria on 13-07-20.
//  Copyright © 2020 dqn. All rights reserved.
//

import SwiftUI

struct Neumorphic {
    struct Configuration {
        static let CornerRadius: CGFloat = 12
        struct Shadow {
            struct Light {
                static let Radius: CGFloat = 8
                static let X: CGFloat = -9
                static let Y: CGFloat = -9
            }
            struct Dark {
                static let Radius: CGFloat = 8
                static let X: CGFloat = 9
                static let Y: CGFloat = 9
            }
            struct Overlay {
                static let Radius: CGFloat = 2
                static let X: CGFloat = 1
                static let Y: CGFloat = 1
            }
        }
    }
}

struct NeumorphicSelectable: ButtonStyle {
    @Binding var isSelected: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(isSelected ? Color.Neumorphic.ShapeBackground: Color.Neumorphic.ButtonAccent)
            .background(isSelected ? Color.Neumorphic.ButtonAccent: Color.Neumorphic.ShapeBackground)
            .cornerRadius(Neumorphic.Configuration.CornerRadius)
            .shadow(color: Color.Neumorphic.LightShadow,
                    radius: Neumorphic.Configuration.Shadow.Light.Radius,
                    x: Neumorphic.Configuration.Shadow.Light.X,
                    y: Neumorphic.Configuration.Shadow.Light.Y)
            .shadow(color: Color.Neumorphic.DarkShadow,
                    radius: Neumorphic.Configuration.Shadow.Dark.Radius,
                    x: Neumorphic.Configuration.Shadow.Dark.X,
                    y: Neumorphic.Configuration.Shadow.Dark.Y)
            .overlay(
                RoundedRectangle(cornerRadius: Neumorphic.Configuration.CornerRadius)
                    .stroke(Color.Neumorphic.OptionalBorder, lineWidth: 1)
                    .shadow(color: Color.Neumorphic.DarkInnerShadow.opacity(isSelected ? 1: 0),
                            radius: Neumorphic.Configuration.Shadow.Overlay.Radius,
                            x: Neumorphic.Configuration.Shadow.Overlay.X,
                            y: Neumorphic.Configuration.Shadow.Overlay.Y)
                    .clipShape(
                        RoundedRectangle(cornerRadius: Neumorphic.Configuration.CornerRadius)
                    )
            )
    }
}
