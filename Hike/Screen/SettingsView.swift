//
//  SettingsView.swift
//  Hike
//
//  Created by Ezequiel Leanes on 26/09/2023.
//

import SwiftUI

struct SettingsView: View {
  private let alternateAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Camera",
    "AppIcon-Backpack",
    "AppIcon-Campfire"
  ]
  private let listRowContent = [
    ListRow(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue),
    ListRow(rowLabel: "Compatibillity", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red),
    ListRow(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange),
    ListRow(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple),
    ListRow(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Ezequiel Leanes", rowTintColor: .mint),
    ListRow(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink),
    ListRow(
      rowLabel: "website",
      rowIcon: "globe",
      rowTintColor: .indigo,
      rowLinkLabel: "Credo Academy",
      rowLinkDestination: "https://credo.academy"
    )
  ]
  var body: some View {
    List {
      // MARK: - SECTION HEADER

      Section {
        HStack {
          Spacer()
          Image(systemName: "laurel.leading").font(.system(size: 80, weight: .black))
          VStack(spacing: -10) {
            Text("Hike").font(.system(size: 66, weight: .black))
            Text("Editors' choice")
              .fontWeight(.medium)
          }
          Image(systemName: "laurel.trailing").font(.system(size: 80, weight: .black))
          Spacer()
        }.foregroundStyle(
          LinearGradient(
            colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
            startPoint: .topLeading,
            endPoint: .bottom
          )
        )
        .padding(.top, 8)
        VStack(spacing: 8) {
          Text("Where you can find \nperfect tracks?").font(.title2).fontWeight(.heavy)

          Text(
            "The hike which looks gorgeous in photos but is even better once you actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app."
          )
          .font(.footnote).italic()
          Text("Dust off the boots! It's time for a walk.").fontWeight(.heavy)
            .foregroundStyle(Color.customGreenMedium)
        }.multilineTextAlignment(.center).padding(.bottom, 16).frame(maxWidth: .infinity)
      }.listRowSeparator(.hidden)

      // MARK: - SECTION: ICONS

      Section(header: Text("Alternate Icons")) {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 12) {
            ForEach(alternateAppIcons.indices, id: \.self) { item in
              Button {
                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) {
                  error in
                  if error != nil {
                    print("Failed request to update te app's icon: \(String(describing: error?.localizedDescription)))")
                  } else {
                    print("Success!")
                  }
                }
              } label: {
                Image("\(alternateAppIcons[item])-Preview")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80, height: 80)
                  .cornerRadius(16)
              }
              .buttonStyle(.borderless)
            }
          }
        }.padding(.top, 12)
        Text("Choose your favourite app icon from the collectin above")
          .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
          .multilineTextAlignment(.center)
          .foregroundColor(.secondary)
          .font(.footnote)
          .padding(.bottom, 12)
      }.listRowSeparator(.hidden)

      // MARK: - SECTION: ABOUT

      Section(
        header: Text("ABOUT THE APP"),
        footer: HStack {
          Spacer()
          Text("Copyright © All right reserved.")
          Spacer()
        }.padding(.vertical, 8)
      ) {
        // 1. Basic Labeled content
        //  LabeledContent("Application", value: "Hike")

        // 2. Advanced Labeled Content
        ForEach(listRowContent) { item in
          CustomListRowView(listRow: item)
        }
      }
    }
  }
}

#Preview {
  SettingsView()
}
