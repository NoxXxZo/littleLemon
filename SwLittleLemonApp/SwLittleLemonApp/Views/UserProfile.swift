//
//  UserProfile.swift
//  SwLittleLemonApp
//
//  Created by Arturo Camacho on 27/6/24.
//

import SwiftUI

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    
    @State private var isLoggedOut = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            NavigationLink(destination: Onboarding(), isActive: $isLoggedOut) { }
            VStack(spacing: 5) {
                VStack {
                    Text("Profile")
                        //.bold()
                        //.font(.title3)
                        .onboardingTextStyle()
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxHeight: 75)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Spacer()
                }
                
                VStack{
                    Text("First name")
                    //.frame(maxWidth: .infinity, alignment: .leading)
                        .onboardingTextStyle()
                    HStack{
                        Text("\(firstName)")
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    Text("Last name")
                        //.frame(maxWidth: .infinity, alignment: .leading)
                        .onboardingTextStyle()
                    HStack{
                        Text("\(lastName)")
                        Spacer()
                    }
                    //TextField("Last Name", text: $lastName)
                    
                }
                
                VStack {
                    Spacer()
                    Text("E-mail")
                        //.frame(maxWidth: .infinity, alignment: .leading)
                        .onboardingTextStyle()
                    HStack{
                        Text("\(email)")
                        Spacer()
                    }
                    //TextField("E-mail", text: $email)
                        //.keyboardType(.emailAddress)
                }
                
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            
            Button("Log out") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                UserDefaults.standard.set("", forKey: kPhoneNumber)
                UserDefaults.standard.set(false, forKey: kOrderStatuses)
                UserDefaults.standard.set(false, forKey: kPasswordChanges)
                UserDefaults.standard.set(false, forKey: kSpecialOffers)
                UserDefaults.standard.set(false, forKey: kNewsletter)
                isLoggedOut = true
            }
            .buttonStyle(ButtonStyleYellowColorWide())
            Spacer(minLength: 20)
            if viewModel.errorMessageShow {
                withAnimation() {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
            
        }
        .onAppear {
            firstName = viewModel.firstName
            lastName = viewModel.lastName
            email = viewModel.email
            phoneNumber = viewModel.phoneNumber
            
            orderStatuses = viewModel.orderStatuses
            passwordChanges = viewModel.passwordChanges
            specialOffers = viewModel.specialOffers
            newsletter = viewModel.newsletter
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
