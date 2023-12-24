//
//  ContentView.swift
//  SwiftUI Animations
//
//  Created by Nika Jamatashvili on 24.12.23.
//

import SwiftUI
import EffectsLibrary

struct ContentView: View {
    
    //MARK: Properties
    @State var effect: AnyView? = nil
    @State var changeEffect = true
    @State var isAnimated = false
    
    var config = FireworksConfig(
        intensity: .medium,
        lifetime: .long,
        initialVelocity: .fast,
        fadeOut: .medium
    )
    
    //MARK: Body
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Text("TBC IT Acamdey!")
                    .font(.title2)
                    .scaleEffect(isAnimated ? 1.4 : 1.0)
                    .foregroundColor(isAnimated ? .red : .blue)
                    .offset(y: isAnimated ? -20 : 0)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(), value:  isAnimated)
                    .onAppear() {
                        isAnimated.toggle()
                    }
                
                SwiftUIXMasTreeView()
                Spacer()
            }
            .padding(.horizontal, 40)
            .padding(.top, 40)
            changeEffect ? AnyView(SnowView()) : AnyView(FireworksView(config: config))
            
            VStack {
                Spacer()
                Button {
                    changeEffect.toggle()
                } label: {
                    Image(systemName: changeEffect ? "wand.and.stars" : "snowflake")
                        .frame(width: 24)
                        .foregroundColor(changeEffect ? .red : .blue)
                }
                .padding(12)
                .background(.gray.opacity(0.16))
                .foregroundColor(.black.opacity(0.8))
                .cornerRadius(6)
            }
            
            .frame(maxWidth: .infinity)
            
        }
        .background(effect)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
