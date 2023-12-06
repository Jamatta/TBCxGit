//
//  EditProfileView.swift
//  SwiftUIMessenger
//
//  Created by Nika Jamatashvili on 06.12.23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var dob = ""
    @State private var country = ""
    
    let fieldNames = ["Name", "Email", "Password", "Date of Birth", "Country/Region"]
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 24) {
                ScrollView {
                    VStack {
                        Circle()
                            .foregroundColor(.clear)
                            .frame(width: 168, height: 168)
                            .overlay(
                                Circle()
                                    .stroke(Color(red: 0.14, green: 0.15, blue: 0.38), lineWidth: 2)
                            )
                            .overlay(
                                Image("avatar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 160, height: 160)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.clear, lineWidth: 0))
                            )
                            .cornerRadius(164)
                            .overlay(
                                Image(systemName: "camera.fill")
                                    .foregroundColor(Color(UIColor(red: 0.14, green: 0.15, blue: 0.38, alpha: 1)))
                                    .imageScale(.large)
                                    .padding(4)
                                    .offset(x: 60, y: 60)
                            )
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            ForEach(fieldNames, id: \.self) { field in
                                VStack(alignment: .leading) {
                                    Text(field)
                                        .font(.headline)
                                    TextField("Enter \(field)", text: binding(for: field))
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                    }
                }
                
                Button("Save Changes") {
                }
                .foregroundColor(.white)
                .frame(width: 220, height: 44)
                .background(Color(UIColor(red: 0.14, green: 0.15, blue: 0.38, alpha: 1)))
                .cornerRadius(8)
                .font(Font.title3.weight(.semibold))
                
            }
            .navigationBarItems(leading:
                                    Button(action: {}) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.blue)
                    .imageScale(.large)
                    .padding(.leading, 16)
            }
            )
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Edit Profile")
                        .font(Font.title2.weight(.bold))
                }
            }
        }
    }
    
    private func binding(for field: String) -> Binding<String> {
        switch field {
        case "Name":
            return $name
        case "Email":
            return $email
        case "Password":
            return $password
        case "Date of Birth":
            return $dob
        case "Country/Region":
            return $country
        default:
            return $name
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
