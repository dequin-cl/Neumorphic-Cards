//
//  NeumorphicTappable.swift
//  Neumorphic Cards
//
//  Created by Iván GalazJeria on 13-07-20.
//  Copyright © 2020 dqn. All rights reserved.
//

import SwiftUI

struct NeumorphicTappable: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .foregroundColor(Color.Neumorphic.ButtonAccent)
            
            .background(configuration.isPressed ? Color.Neumorphic.ButtonAccent: Color.Neumorphic.ShapeBackground)
            .cornerRadius(12)
            .onLongPressGesture {
                
            }
            .shadow(color: Color.Neumorphic.LightShadow,
                    radius: Neumorphic.Configuration.Shadow.Light.Radius,
                    x: Neumorphic.Configuration.Shadow.Light.X,
                    y: Neumorphic.Configuration.Shadow.Light.Y)
            .shadow(color: Color.Neumorphic.DarkShadow,
                    radius: Neumorphic.Configuration.Shadow.Dark.Radius,
                    x: Neumorphic.Configuration.Shadow.Dark.X,
                    y: Neumorphic.Configuration.Shadow.Dark.Y)
            .overlay(
                RoundedRectangle(cornerRadius: Neumorphic.Configuration.Shadow.Light.Radius)
                    .stroke(Color.Neumorphic.OptionalBorder, lineWidth: 1)
                    .shadow(color: Color.Neumorphic.DarkInnerShadow.opacity(configuration.isPressed ? 1: 0),
                            radius: Neumorphic.Configuration.Shadow.Overlay.Radius,
                            x: Neumorphic.Configuration.Shadow.Overlay.X,
                            y: Neumorphic.Configuration.Shadow.Overlay.Y)

                    .clipShape(
                        RoundedRectangle(cornerRadius: Neumorphic.Configuration.Shadow.Light.Radius)
                )
        )
    }
}
