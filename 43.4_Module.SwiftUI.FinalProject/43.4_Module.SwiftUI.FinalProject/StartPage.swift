//
//  ContentView.swift
//  43.4_Module.SwiftUI.FinalProject
//
//  Created by Тимур Гарипов on 27.02.23.
//

import SwiftUI

struct StartPage: View {
    
    @State var becomeModal: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(
                    colors: [.gray, .black ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    
                    Image("audi")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .aspectRatio(contentMode: .fit)
                    
                    VStack {
                        Text("Найдите свой идеальный автомобиль")
                            .foregroundColor(.white)
                            .font(.custom("AudiType-Bold", size: 25))
                            .multilineTextAlignment(.center)
                            .shadow(color: .blue, radius: 10)
                        
                        HStack {
                            Spacer()
                            NavigationLink(destination: ContentView()){
                                Image(systemName: "chevron.right.circle.fill")
                            }
                            .foregroundColor(.blue)
                            .font(.custom("Avenir Next", size: 40))
                            .shadow(color: .blue, radius: 30)
                        } .padding(.trailing, 40.0)
                            .padding(.top, 20.0)
                    }
                }
            }
        }
        
    }
    

    struct StartPage_Previews: PreviewProvider {
        static var previews: some View {
            StartPage()
        }
    }
}
