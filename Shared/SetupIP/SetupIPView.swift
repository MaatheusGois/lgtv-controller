//
//  SetupIPView.swift
//  controller
//
//  Created by Matheus Gois on 09/08/24.
//

import SwiftUI

struct SetupIPView: View {
    @State private var userInput: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack {
            Spacer()
            Text("Enter with the IP:")
                .font(.headline)

            TextField("Type the LGTV IP here...", text: $userInput)
                .padding()

            Button(action: {
                if isValidIPAddress(userInput) {
                    Environment.shared.ip = userInput
                } else {
                    alertMessage = "The IP address is not valid. Please enter a valid IP."
                    showAlert = true
                }
            }) {
                Text("Submit")
                    .padding(10)
                    .foregroundColor(.white)
            }
            .background(Color.blue)
            .cornerRadius(10)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invalid IP"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }

            Spacer()
        }
        .padding()
    }

    func isValidIPAddress(_ ipAddress: String) -> Bool {
        let ipRegex = "^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", ipRegex)
        return predicate.evaluate(with: ipAddress)
    }
}
