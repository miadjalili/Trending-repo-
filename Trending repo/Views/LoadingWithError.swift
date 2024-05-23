//
//  LoadingWithError.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-05-17.
//

import SwiftUI


struct LoadingWithError: View {

    var retryAction: () -> Void
    var cancelAction: () -> Void

    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            VStack(content: {
                LottieHelperView()
                    .frame(width: 250,height: 250)
                    .padding(.bottom,30)
                Text("Something went wrong...")
                    .font(.title2)
                    .foregroundStyle(.windowBackground)
                    .padding(.bottom, 30)
                Text("An alien is blocking your signal")
                    .font(.subheadline)
                    .foregroundColor(.gray)
        
                VStack(spacing:20, content: {
                    Button(action: {
                        retryAction()
                    }, label: {
                        Text("RETRY")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                    })
                    
                    Button(action: {
                        cancelAction()
               
                    }, label: {
                        Text("Cancel")
                        .font(.headline)
                        .foregroundColor(.green)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                    })
                })
                .padding()
            })
           
           
        }
    }
}

#Preview {
    LoadingWithError(retryAction: {}, cancelAction:{})
    
}
