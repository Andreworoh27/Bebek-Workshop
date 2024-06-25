//
//  ProfileHeaderView.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 24/06/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var backgroundColor: Color
    var profileImage: Image
    var name: String
    var username: String
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    profileImage
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 4) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 21, height: 21)
                                    .background(
                                        Image("streakcat")
                                    )
                                Text("36")
                                    .font(Font.custom("Host Grotesk", size: 22))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 58, height: 25)
                        }
                        .padding(EdgeInsets(top: 2, leading: 6, bottom: 3, trailing: 6))
                        .frame(width: 70, height: 29)
                        .background(Color.tertiaryBlush)
                        .cornerRadius(5)
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 4, x: 4, y: 4
                        )
                        
                    }
                    
                }
                .frame(width: 125.70, height: 125.70)
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(Font.hostGrotesk(typography: .largeTitle))
                        .fontWeight(.bold)
                    
                    Text(username)
                        .font(Font.body)
                        .foregroundColor(.black)
                }
                .padding(.leading, 20)
                
                Spacer()
                
                    .padding(.trailing, 20)
            }
            .padding(.horizontal, 50.0)
            .frame(height: 286)
            .background(backgroundColor)
            .cornerRadius(100, corners: [.bottomRight])
            .shadow(radius: 5)
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(
            backgroundColor: Color.secondaryLightblue,
            profileImage: Image(systemName: "person.crop.circle"),
            name: "John Doe",
            username: "@johndoe"
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
