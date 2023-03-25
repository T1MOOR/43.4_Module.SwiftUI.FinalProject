//
//  ContentView.swift
//  43.4_Module.SwiftUI.FinalProject
//
//  Created by Тимур Гарипов on 23.03.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            List(brandsArray) { brand in
                NavigationLink(destination: ModelsView(carsOfBrand: brand.car, brand: brand.brand)) {
                    VStack {
                        Spacer()
                        Text(brand.brand)
                            .font(.custom("AudiType-Bold", size: 25))
                            .padding(.trailing)
                            .font(.system(size: 20))
                        Spacer()
                    }
                }
            }
            .navigationTitle("Марки авто")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
    }
}


struct ModelsView: View {
    @State var becomeModal: Bool = false
    let carsOfBrand: [Car]
    let brand: String
    
    var body: some View {
        ZStack{
            List(carsOfBrand) { car in
                VStack {
                    Spacer()
                    HStack {
                        Image(car.photo).resizable()
                            .scaledToFit()
                            .frame(width: 80, alignment: .center)
                        Spacer()
                        Text(car.model)
                            .font(.custom("AudiType-Bold", size: 20))
                            .padding(.trailing)
                            .font(.system(size: 27))
                        Spacer()
                        Button("") {
                            print("Tapped")
                            self.becomeModal.toggle()
                        }
                        .sheet(isPresented: $becomeModal, content: {
                            DetailView.init(becomeModal: self.$becomeModal, currentCar: car)
                        })
                        .padding(.leading)
                    }
                    Spacer()
                }
            }
            .navigationTitle(brand)
        }
    }
}


struct DetailView: View {
    @Binding var becomeModal: Bool
    let currentCar: Car
    var body: some View {
        
        ZStack{
            
            LinearGradient(
                colors: [.gray, .black ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ZStack{
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .offset(y:-285)
                
                
                VStack {
                    Spacer()
                    Text(currentCar.model)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                    Image(currentCar.photo).resizable()
                        .scaledToFit()
                        .padding(10)
                        .ignoresSafeArea()
                    Spacer()
                    ScrollView {
                        Text(currentCar.description)
                            .multilineTextAlignment(.center)
                            .padding(.leading, 10.0)
                            .padding(.trailing, 10.0)
                        
                            .foregroundColor(.white)
                            .font(.custom("AudiType", size: 15))
                    }
                    .padding(.bottom)
                }
            }
        }
        .foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ModelsView_Previews: PreviewProvider {
    static var previews: some View {
        ModelsView(carsOfBrand: bmwArray, brand: "BMW 1 SERIES")
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        DetailView(becomeModal: .constant(true), currentCar: Car(model: "BMW 1 SERIES", photo: "BMW 1 SERIES", description: "Первая серия- это попытка баварского производителя получить свою долю в одном из самых популярных, на данный момент, сегментов автомобильного рынка. Стоит отметить, что конструкторы подошли к этому вопросу довольно категорично и постарались перенести все фамильные черты старших собратьев по модельной линейки в более компактном масштабе. С каждым годом, жесткие правила, диктуемые автомобильным рынком, все больше и больше убавляют эту категоричность, в результате чего даже таким автомобильным гигантам приходится пересмотреть свои принципы. В последних числах мая 2019 года, была анонсирована абсолютно новая BMW 1 series, кардинально отличающаяся от своих предшественниц. Эти перемены сразу бросаются в глаза. У третьего поколения, получившего индекс F40 совершенно другие пропорции. Капот стал выше и ощутимо короче, увеличился передний свес, а передние колеса переехали ближе к стойкам. В общем и целом, модель стала больше походить вторую серию с более низкой крышей."))
        
    }
}
