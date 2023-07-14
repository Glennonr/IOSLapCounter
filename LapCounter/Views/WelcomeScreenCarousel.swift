//
//  WelcomeScreenCarousel.swift
//  LapCounter
//
//  Created by Richie Glennon on 7/13/23.
//

import SwiftUI

struct WelcomeScreenCarousel: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @State private var pageIndex = 0
    private var pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                VStack {
                    Spacer()
                    WelcomeScreen(page: page)
                    Spacer()
                    if page == pages.last {
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("GO")
                                .padding()
                        }
                            .padding(.bottom, 60)
                            .buttonStyle(.bordered)
                    } else {
                        Button("Next", action: incrementPage)
                            .padding(.bottom, 60)
                    }
                }
                .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = colorScheme == .dark ? .white : .black
            dotAppearance.pageIndicatorTintColor = .gray
            UserDefaults.standard.welcomeScreenShown = true
        }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        pageIndex = 0
    }
    
}

struct WelcomeScreenCarousel_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenCarousel()
    }
}
