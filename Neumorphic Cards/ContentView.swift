//
//  ContentView.swift
//  Neumorphic Cards
//
//  Created by Iván GalazJeria on 19-05-20.
//  Copyright © 2020 dqn. All rights reserved.
//

// https://uxdesign.cc/neumorphism-in-user-interfaces-b47cef3bf3a6

import SwiftUI

struct ContentView: View {
    @State var selected: [Bool] = [false, false, false]
    var body: some View {
        ZStack {
            Color.Neumorphic.MainBackground
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 50) {
                Button(action: {
                    self.selected[0].toggle()
                }) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 40, height: 37)
                        .padding(20)
                        .foregroundColor(Color.Neumorphic.ButtonAccent)

                        .background(Color.Neumorphic.ShapeBackground)

                        .cornerRadius(20)
                        .shadow(color: Color.Neumorphic.LightShadow, radius: 16, x: -6, y: -6)
                        .shadow(color: Color.Neumorphic.DarkShadow, radius: 16, x: 6, y: 6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.Neumorphic.OptionalBorder, lineWidth: 1)

                    )
                }

                HStack {
                    // To use it
                    Spacer()
                    Button(action: {
                        self.selected[1].toggle()
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 40, height: 37)
                            .padding(20)

                    }
                    .buttonStyle(NeumorphicSelectable(isSelected: self.$selected[1]))
                    // To use it
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 40, height: 37)
                            .padding(20)

                    }
                    .buttonStyle(NeumorphicTappable())
                    Spacer()
                }

                HStack {
                    Spacer()
                    Button(action: {
                        self.selected[2].toggle()
                    }) {
                        Text("Hola")
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)

                    }
                    .buttonStyle(NeumorphicSelectable(isSelected: self.$selected[2]))
                    Spacer()
                    Button(action: {
                    }) {
                        Text("Hola")
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                    }
                    .buttonStyle(NeumorphicTappable())
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}

struct NeumorphicSelectable: ButtonStyle {
    @Binding var isSelected: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(isSelected ? Color.Neumorphic.ShapeBackground: Color.Neumorphic.ButtonAccent)
            .background(isSelected ? Color.Neumorphic.ButtonAccent: Color.Neumorphic.ShapeBackground)
            .cornerRadius(12)
            .shadow(color: Color.Neumorphic.LightShadow, radius: 8, x: -9, y: -9)
            .shadow(color: Color.Neumorphic.DarkShadow, radius: 8, x: 9, y: 9)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.Neumorphic.OptionalBorder, lineWidth: 1)
                    .shadow(color: Color.Neumorphic.DarkInnerShadow.opacity(isSelected ? 1: 0),
                            radius: 2, x: 1, y: 1)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                        
                )
        )
    }
}

struct NeumorphicTappable: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.Neumorphic.ButtonAccent)
            .background(configuration.isPressed ? Color.Neumorphic.ButtonAccent: Color.Neumorphic.ShapeBackground)
            .cornerRadius(12)
            .shadow(color: Color.Neumorphic.LightShadow, radius: 8, x: -9, y: -9)
            .shadow(color: Color.Neumorphic.DarkShadow, radius: 8, x: 9, y: 9)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.Neumorphic.OptionalBorder, lineWidth: 1)
                    .shadow(color: Color.Neumorphic.DarkInnerShadow.opacity(configuration.isPressed ? 1: 0),
                            radius: 3, x: 5, y: 5)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                )
        )
    }
}
