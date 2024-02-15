//
//  DynamicChartView.swift
//  RB Test
//
//  Created by Александр Пиманов on 15.02.2024.
//

import SwiftUI

struct DynamicChartView: View {
    @State var text = ""
    var values: [Double] = []
    var colors: [Color] = []
        
    var body: some View {
        HStack {
            Color.gray.opacity(0.2)
                .frame(maxWidth: .infinity, maxHeight: 10)
                .overlay(GeometryReader { gp in
                    HStack(spacing: 5) {
                        ForEach(0..<values.count, id: \.self) { index in
                            VStack {
                                Rectangle()
                                    .fill(colors[index])
                                    .frame(width: values[index] * gp.size.width, height: 10)
                                
                                Text(String(format: "%.0f%%", values[index] * 100))
                            }
                        }
                    }
                })
        }
    }
}

#Preview {
    DynamicChartView()
}
