//
//  HorizontalChartView.swift
//  RB Test
//
//  Created by Александр Пиманов on 15.02.2024.
//

import SwiftUI

struct HorizontalChartView: View {
    @Binding var value: Double
    
    var color: Color?
    
    var body: some View {
        HStack {
            Color.gray.opacity(0.2)
                .frame(maxWidth: .infinity, maxHeight: 10)
                .overlay(GeometryReader { gp in
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(color ?? Color.clear)
                            .frame(width: value * gp.size.width, height: 10)
                    }
                })
        }
    }
}

#Preview {
    HorizontalChartView(value: .constant(0.6))
}
