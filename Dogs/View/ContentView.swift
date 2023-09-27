//
//  ContentView.swift
//  Dogs
//
//  Created by Igor Fortti on 27/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State private var viewDidLoad = true
    
    var body: some View {
        Text(viewModel.dog?.message ?? "Não deu certo")
            .padding()
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
