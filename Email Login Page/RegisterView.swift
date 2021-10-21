//
//  RegisterView.swift
//  Email Login Page
//
//  Created by Izzie Watts on 13/08/2021.
//

import SwiftUI

struct RegisterView: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var postcode = ""
    
    var body: some View {
        NavigationView{
            VStack{
                //User profile title
                Text("User Profile")
                    .font(.title)
                    .fontWeight(.bold)
                    
                Spacer()
            
                //Email field
                TextField("Email", text: self.$email)
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color"): self.color, lineWidth: 2))
                .padding(.top,25)
                
                //Postcode field
                TextField("Postcode", text: self.$postcode)
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color"): self.color, lineWidth: 2))
                .padding(.top,25)
                
                //Password field
                TextField("Password", text: self.$pass)
                    .autocapitalization(.none)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color"): self.color, lineWidth: 2))
                    .padding(.top,25)
                
            //Button
            
                NavigationLink(destination: RegisterView()) {
                    Text("RegisterPage")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 5)
                        .frame(width: 220, height: 50)
                        .background(Color.green)
                        .cornerRadius(35)
                }
                Spacer()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

//https://www.youtube.com/watch?v=LbpGjAJRhLM
//https://www.youtube.com/watch?v=8hvaniprctk
