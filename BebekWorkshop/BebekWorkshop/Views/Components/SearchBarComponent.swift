//
//  SearchBarComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct SearchBarComponent: View {
    @State var searchTextInput: String = ""
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        HStack (spacing: 25) {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $searchTextInput)
                Image(systemName: "mic.fill")
            }
            .padding(8)
            .background(.white)
            .cornerRadius(50)
            
            if(userViewModel.currentLogUser == nil){
                Circle()
                    .frame(width: 37, height: 37)
                    .foregroundColor(.white)
                    .overlay(alignment: .center) {
                        Image(systemName: "person.fill")
                    }
            }else{
                NavigationLink {
                    ProfileView()
                } label: {
                    Image("cat-profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 37, height: 37)
                        .clipShape(Circle())
                }
            }
        }
        .padding(20)
        .background(Color.secondaryLightblue)
        .cornerRadius(50)
        
        
    }
}

#Preview {
    SearchBarComponent()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
