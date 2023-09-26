//
//  CardView.swift
//  Hike
//
//  Created by Ezequiel Leanes on 25/09/2023.
//

import SwiftUI

struct CardView: View {
  @State private var imageNumber: Int = 1
  @State private var randomNumber: Int = 1
  @State private var isShowingSheet = false

  func randomImage() {
    repeat {
      randomNumber = Int.random(in: 1...5)
    } while randomNumber == imageNumber
    imageNumber = randomNumber
  }

  var body: some View {
    ZStack {
      CustomBackgroundView()
      VStack {
        // MARK: - HEADER

        VStack(alignment: .leading) {
          HStack {
            Text("Hiking")
              .fontWeight(.black)
              .font(.system(size: 52))
              .foregroundStyle(
                LinearGradient(
                  colors: [
                    Color.customGrayLight,
                    Color.customGrayMedium
                  ],
                  startPoint: .top,
                  endPoint: .bottom
                )
              )
            Spacer()
            Button {
              // ACTION: Show a Sheet
              isShowingSheet.toggle()
            } label: {
              CustomButtomView()
            }.sheet(isPresented: $isShowingSheet) {
              SettingsView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
            }
          }
          Text("Fun and enjoyable outdoor activity for friends and families.")
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/ .leading/*@END_MENU_TOKEN@*/)
            .italic()
            .foregroundColor(.customGrayMedium)
        }.padding(.horizontal, 30)

        // MARK: - MAIN CONTENT

        ZStack {
          CustomCircleView()
          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.default, value: imageNumber)
        }

        // MARK: - FOOTER

        Button {
          randomImage()
        } label: {
          Text("Explore More")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(LinearGradient(
              colors: [.customGreenLight, .customGreenMedium],
              startPoint: .top,
              endPoint: .bottom
            ))
            .shadow(color: /*@START_MENU_TOKEN@*/ .black/*@END_MENU_TOKEN@*/ .opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButton())
      }
    }.frame(width: 320, height: 570)
  }
}

#Preview {
  CardView()
}
