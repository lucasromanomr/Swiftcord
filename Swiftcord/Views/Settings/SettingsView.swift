//
//  PreferencesView.swift
//  Swiftcord
//
//  Created by Vincent Kwok on 5/3/22.
//

import SwiftUI
 
struct PrivacySettingsView: View {
    var body: some View {
        Text("Privacy Settings")
            .font(.title)
    }
}
 

struct SettingsView: View {
    @EnvironmentObject var gateway: DiscordGateway

    var body: some View {
        if let user = gateway.cache.user {
            TabView {
                UserSettingsView(user: user).tabItem {
                    Label("User", systemImage: "person.crop.circle")
                }
                
                BillingSettingsView().tabItem {
                    Label("Billing", systemImage: "dollarsign.circle")
                }
               
                AppSettingsView().tabItem {
                    Label("App", systemImage: "macwindow")
                }
                
                ActivitySettingsView().tabItem {
                    Label("Activity", systemImage: "hammer")
                }
                
                MiscSettingsView().tabItem {
                    Label("Others", systemImage: "ellipsis")
                }
            }
            .frame(width: 900, height: 600)
        }
        else {
            VStack(spacing: 8) {
                Image(systemName: "wifi.slash").font(.system(size: 30)).foregroundColor(.accentColor)
                Text("Gateway isn't connected")
                    .font(.title)
                    .padding(.top, 8)
                Text("Settings can only be modified after logging in and while the gateway is connected.")
                    .opacity(0.75)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(width: 400)
            .padding(16)
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}