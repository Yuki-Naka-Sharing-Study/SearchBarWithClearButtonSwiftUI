//
//  ContentView.swift
//  SearchBarWithClearButtonSwiftUI
//
//  Created by 仲優樹 on 2025/06/12.
//

import SwiftUI

struct SearchBarWithClearButton: View {
    @State private var searchText: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .frame(height: 48)
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 12)
                    TextField("検索", text: $searchText)
                        .focused($isFocused)
                        .frame(height: 48)
                    if !searchText.isEmpty {
                        Button(action: {
                            isFocused = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                searchText = ""
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .frame(width: 24, height: 24)
                        }
                        .padding(.trailing, 8)
                        .contentShape(Rectangle())
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            Spacer()
        }
    }
}

#Preview {
    SearchBarWithClearButton()
}
