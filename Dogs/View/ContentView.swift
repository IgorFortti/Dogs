//
//  ContentView.swift
//  Dogs
//
//  Created by Igor Fortti on 27/09/23.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State private var viewDidLoad = true
    
    var body: some View {
            VStack {
                if let imageURL = URL(string: viewModel.dog?.message ?? "") {
                    URLImage(imageURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    }
                } else {
                    Text("Carregando imagem...")
                }
            }
            .onAppear {
                if viewDidLoad {
                    viewDidLoad.toggle()
                    viewModel.doFetchDog()
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
