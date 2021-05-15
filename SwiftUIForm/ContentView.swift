//
//  ContentView.swift
//  SwiftUIForm
//
//  Created by Arif Rahman Sidik on 15/05/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
   
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthdate = Date()
    @State private var shouldSendNewsLetter = false
    @State private var numberOfLikes = 4
    
    var body: some View{
        NavigationView{
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text : $firstName)
                    TextField("First Name", text : $lastName)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                }
                
                Section(header: Text("Actions")){
                    Toggle("Send Newsletter", isOn: $shouldSendNewsLetter).toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of likes", value: $numberOfLikes, in: 1...100)
                    Text("This video has \(numberOfLikes) likes")
                    Link("Term of Service", destination: URL(string: "https://agnikamika.wordpress.com")!)
                }
            }
            .navigationTitle("Account")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label : {
                        Image(systemName: "keyboard")
                    }
                    
                    Button("Save", action: saveUser)
                }
            }
        }
        .accentColor(.red)
    }
    
    func saveUser() {
        print("User Saved")
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
