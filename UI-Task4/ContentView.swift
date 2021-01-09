//
//  ContentView.swift
//  UI-Task4
//
//  Created by Зехниддин on 09/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var showingActionSheet = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.gray
    }
    
    var body: some View {
        TabView {
            AlertView(showingAlert: $showingAlert)
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Alert")
                }
            
            ActionSheetView(showingActionSheet: $showingActionSheet)
                .tabItem {
                    Image(systemName: "2.circle")
                        .renderingMode(.original)
                        .font(.system(size: 30))
                    Text("Sheet")
                }
        }
    }
}


struct AlertView: View {
    @Binding var showingAlert: Bool
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Alert Dialog")
                .modifier(CustomModifier())
        }
        .alert(isPresented: $showingAlert) {
            let title = Text("iOS")
            let message = Text("Here we go")
            
            return Alert(
                title: title,
                message: message,
                primaryButton: .destructive(Text("NO")) {
                    print("NO clicked")
                },
                secondaryButton: .default(Text("OK")) {
                    print("OK clicked")
                }
            )
        }
    }
}


struct ActionSheetView: View {
    @Binding var showingActionSheet: Bool
    
    var body: some View {
        Button(action: {
            self.showingActionSheet = true
        }) {
            Text("Action Sheet")
                .modifier(CustomModifier())
        }
        .actionSheet(isPresented: $showingActionSheet) {
            let title = Text("iOS")
            let message = Text("Here we go")
            
            return ActionSheet(
                title: title,
                message: message,
                buttons: [
                    .default(Text("OK")) { print("OK clicked") },
                    .destructive(Text("NO")) { print("NO clicked") }
                ]
            )
        }
    }
}


struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .background(Capsule().colorMultiply(.black))
            .cornerRadius(15)
            .font(.title2)
            .shadow(color: .black, radius: 10)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

