//
//  ContentView.swift
//  PendulumSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 09/08/24.
//
//  MARK: Instagram
//  TheAppWizard
//  MARK: theappwizard2408




import SwiftUI

struct ContentView: View {
    var body: some View {
        FinalView()
    }
}

#Preview {
    ContentView()
}



















struct FinalView: View {
    @State private var animate = false
    @State private var animate2 = false
    
    var body: some View {
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            Circle()
              .trim(from: 0.2, to: 0.6)
              .stroke(
               Color.white,
               style: StrokeStyle(
                  lineWidth: 2,
                  lineCap: .round,
                  lineJoin: .round,
                  dash: [5, 10]
              ))
              .frame(width: 500, height: 500)
              .rotationEffect(.degrees(-40))
              .offset(y:-70)
              .opacity(0.7)
            
            
            
            
            VStack(spacing:0){
                Rectangle()
                    .frame(width: 200,height: 10)
                    .foregroundColor(.white)
                    ZStack{
                        CombineView()
                            .rotationEffect(.degrees(animate ? 30 : -30), anchor: .top)
                            .animation(Animation.easeInOut(duration: 2).delay(0).repeatForever(autoreverses: true), value: animate)
                            .onAppear {
                                    animate.toggle()
                                }
    
                    }
                }
            
            
                    
           }
    }
}


struct CombineView: View {
    var body: some View {
        ZStack{
            VStack(spacing:0){
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 4,height: 300)
                BallView()
            }
        }
    }
}



struct BallView: View {
    var color: Color = .red
    var hasOutline: Bool = true
    var hasShadow: Bool = true
    var opacity: Double = 1.0
    
    var body: some View {
        ZStack{
            Circle()
                .fill(color)
                .frame(width: 80, height: 80)
                .overlay(
                    Circle()
                    .stroke(Color.white, lineWidth: 4)
                    .opacity(hasOutline ? 1 : 0)
                )
            
            
              Circle()
                .trim(from: 0.2, to: 0.4)
                .stroke(
                    Color.white,
                      style: StrokeStyle(
                      lineWidth: 6,
                      lineCap: .round
                            )
                    )
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(190))
                .opacity(0.7)
            
            Circle()
              .trim(from: 0.2, to: 0.3)
              .stroke(
                  Color.white,
                    style: StrokeStyle(
                    lineWidth: 6,
                    lineCap: .round
                          )
                  )
              .frame(width: 60, height: 60)
              .rotationEffect(.degrees(20))
              .opacity(0.4)
            }
            .opacity(opacity)
    }
}
