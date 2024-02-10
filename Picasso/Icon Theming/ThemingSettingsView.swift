//
//  ThemingSettingsView.swift
//  Picasso
//
//  Created by sourcelocation on 09/12/2023.
//

import SwiftUI

struct ThemingSettingsView: View {
    
    @AppStorage("pngIconTheming") var pngIconThemingOn = false
    @AppStorage("forceWebClipsForEverything") var forceWebClipsForEverything = false
    
    var body: some View {
        Navigator {
            Form {
                Toggle("Customize system apps", isOn: $pngIconThemingOn)
                    .onChange(of: pngIconThemingOn) { new in
                        if new {
                            UIApplication.shared.confirmAlertDestructive(title: "Experimental feature", body: "This feature has NOT been tested extensively. Due to the bootloops Cowabunga v10 caused while theming icons on first release, we don't want to repeat the same mistake again with OpenPicasso. Look on our Discord or in GitHub issues to make sure you don't get bootlooped. If you choose to enable this, you are on your own.", onOK: {
                                pngIconThemingOn = true
                            }, onCancel: {
                                pngIconThemingOn = false
                            }, destructActionText: "Enable")
                        }
                    }
                    .tint(.accentColor)
                Toggle("Force Web Clip theming for all apps", isOn: $forceWebClipsForEverything)
                    .tint(.accentColor)
            }
            .navigationTitle("Theming Options")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ThemingSettingsView()
}
