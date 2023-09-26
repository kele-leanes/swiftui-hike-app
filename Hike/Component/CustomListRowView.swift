//
//  CustomListRowView.swift
//  Hike
//
//  Created by Ezequiel Leanes on 26/09/2023.
//

import SwiftUI

struct ListRow: Identifiable {
  let id = UUID()
  let rowLabel: String
  let rowIcon: String
  var rowContent: String?
  let rowTintColor: Color
  var rowLinkLabel: String?
  var rowLinkDestination: String?
}

struct CustomListRowView: View {
  var listRow: ListRow

  var body: some View {
    LabeledContent {
      if listRow.rowContent != nil {
        Text(listRow.rowContent!)
      } else if listRow.rowLinkLabel != nil && listRow.rowLinkDestination != nil {
        Link(listRow.rowLinkLabel!, destination: URL(string: listRow.rowLinkDestination!)!)
      } else {
        /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
      }
    } label: {
      HStack {
        ZStack {
          RoundedRectangle(cornerRadius: 8).frame(width: 30, height: 30).foregroundColor(listRow.rowTintColor)
          Image(systemName: listRow.rowIcon).foregroundColor(.white).fontWeight(.semibold)
        }

        Text(listRow.rowLabel)
      }
    }
  }
}

let listRows = [ListRow(
  rowLabel: "website",
  rowIcon: "globe",
  rowContent: nil,
  rowTintColor: .pink,
  rowLinkLabel: "Credo Academy",
  rowLinkDestination: "https://credo.academy/"
)]
#Preview {
  ForEach(listRows) { item in
    CustomListRowView(listRow: item)
  }
}
