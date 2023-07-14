//
//  WelcomeScreen.swift
//  LapCounter
//
//  Created by Richie Glennon on 7/13/23.
//

import SwiftUI

struct WelcomeScreen: View {
    
    var page: Page
    
    var body: some View {
        VStack {
            if !page.imageURL.isEmpty{
                Image("\(page.imageURL)")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .cornerRadius(30)
                    .background(.gray.opacity(0.10))
                    .cornerRadius(10)
                    .padding()
            }
            
            Text(page.name)
                .font(.title)
                .padding(.bottom, 10)
            
            Text(page.description)
                .font(.subheadline)
                .frame(width: 300)
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen(page: Page.samplePage)
    }
}
