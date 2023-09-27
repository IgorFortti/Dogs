//
//  ContentView.swift
//  Dogs
//
//  Created by Igor Fortti on 27/09/23.
//

import SwiftUI
import URLImage

struct DogView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State private var viewDidLoad = true
    
    var body: some View {
        ZStack {
            if let imageURL = URL(string: viewModel.dog?.message ?? "") {
                URLImage(imageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                }
            } else {
                Text("")
            }
            if viewModel.currentState == .success {
                VStack {
                    Spacer()
                    Button(action: {
                        viewModel.doFetchDog()
                    }) {
                        Text("Alterar imagem")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width - 40, height: 40)
                            .background(Color.gray.opacity(0.7))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                    }
                }
            }
        }
        .onAppear {
            if viewModel.dog == nil {
                viewModel.doFetchDog()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DogView()
    }
}
