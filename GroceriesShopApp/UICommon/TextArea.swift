//
//  TextArea.swift
//  GroceriesShopApp
//
//  Created by Mac on 20/03/2025.
//

import SwiftUI

struct TextArea: View {
    private let placeholder: String
    @Binding var text: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        TextEditor(text: $text)
            .background(
                HStack(alignment: .top) {
                    text == "" ? Text(placeholder) : Text("")
                    Spacer()
                }
                .foregroundColor(Color.primary.opacity(0.25))
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 7, trailing: 0))
            )
    }
}
