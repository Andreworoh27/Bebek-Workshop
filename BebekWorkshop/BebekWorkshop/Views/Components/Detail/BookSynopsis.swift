//
//  BookSynopsis.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 22/06/24.
//

import SwiftUI

struct BookSynopsis: View {
    @State var textExpanded: Bool = false
    var text: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Synopsis")
                    .font(Font.hostGrotesk(typography: .title1))
                Text(text)
                    .lineLimit(textExpanded ? .max : 4)
                    .overlay {
                        if textExpanded == false {
                            LinearGradient(
                                gradient: Gradient(colors: [.secondaryLightblueBackground, .clear]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        }
                    }
                HStack {
                    Button(textExpanded ? "Show Less" : "Show More" ) {
                        textExpanded.toggle()
                    }
                    .buttonStyle(.plain)
                    Image(systemName: textExpanded ? "chevron.up" : "chevron.down")
                }
            }
            Spacer()
        }
    }
}

#Preview {
    BookSynopsis(
        text: "It is no small matter, after all, to create something—to make it so only by setting down the words. We forget the magnitude, sometimes, of that miracle. In the dead of night, shots ring out over the grounds of a sprawling English estate. The world-weary butler Eustace recognizes the gunman—his longtime employer, Mr. Crowe—and knows he must think and act quickly. Who is the man lying dead on the lawn? Who is the woman in his company? Can he clean up his master’s mess like he always has before? Or will this bring a new kind of reckoning?"
    )
}
