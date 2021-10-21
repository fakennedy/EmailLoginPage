//
//  OpeningView.swift
//  Email Login Page
//
//  Created by Izzie Watts on 18/08/2021.
//

import SwiftUI

struct OpeningView: View {
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("BG1"), Color("BG2")]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                //gloss background
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    //Slightly Darkening
                    Color.black
                        .opacity(0.7)
                        .blur(radius: 200)
                        .ignoresSafeArea()
                    
                    Circle()
                        .fill(Color("Purple"))
                        .padding(50)
                        .blur(radius: 120)
                    //Moving Top....
                        .offset(x: -size.width / 1.8, y: -size.height / 5)
                    
                    Circle()
                        .fill(Color("LightBlue"))
                        .padding(50)
                        .blur(radius: 150)
                    //Moving Top....
                        .offset(x: size.width / 1.8, y: -size.height / 2)
                    
                    Circle()
                        .fill(Color("LightBlue"))
                        .padding(50)
                        .blur(radius: 90)
                    //Moving Top....
                        .offset(x: size.width / 1.8, y: size.height / 2)
                    
                    //Adding purple on both bottom ends..
                    Circle()
                        .fill(Color("Purple"))
                        .padding(100)
                        .blur(radius: 110)
                    //Moving Top....
                        .offset(x: size.width / 1.8, y: size.height / 2)
                    
                    Circle()
                        .fill(Color("Purple"))
                        .padding(100)
                        .blur(radius: 110)
                    //Moving Top....
                        .offset(x: -size.width / 1.8, y: size.height / 2)
                    
                }
                
                //Content
                VStack(spacing: 20){
                    Text("Welcome to Narnia")
                        .font(.largeTitle.bold())
                        
                    
                    //Sign in buttons
                    SignInButtons(image: "applelogo", text: "Continue with Apple", isSystem: true){
                        
                    }
                    .cornerRadius(35.0)//temp location
                    
                    SignInButtons(image: "google", text: "Continue with Google", isSystem: false){
                        
                    }
                    .cornerRadius(35.0) //Temp location
                    
                    SignInButtons(image: "facebook", text: "Continue with Facebook", isSystem: false){
                        
                    }
                    .cornerRadius(35.0) //Temp location
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("Already have an account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 5)
                            .frame(width: 220, height: 50)
                            .cornerRadius(35)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                    }
                    
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
            }
        }
    }
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}

struct SignInButtons: View{
    var image: String
    var text: String
    var isSystem: Bool
    
    var onCLick : ()->()
    
    var body: some View{
        HStack{
            (
                isSystem ? Image(systemName: image) : Image(image)
            )
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                
            
            Text(text)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
        }
        .foregroundColor(!isSystem ? .white : .black)
        .padding(.vertical,15)
        .padding(.horizontal,40)
        .background(
            Color.white.opacity(isSystem ? 1 : 0.1)
           // ,in: Capsule()
        )
        
        .onTapGesture {
            onCLick()
        }
    }
}
