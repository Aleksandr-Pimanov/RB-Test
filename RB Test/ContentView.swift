//
//  ContentView.swift
//  RB Test
//
//  Created by Александр Пиманов on 15.02.2024.
//

import SwiftUI

struct ContentView: View {
    // this param we can set to our first chart (now i just hardcode the value)
    @State var value: Double = .zero
    
    @State private var values: [Double] = [0.3, 0.3, 0.4]
    @State private var colors: [Color] = [.green, .red, .gray]
    
    var body: some View {
        List {
            Section {
                setupFirstSectionContent()
            }
            Section {
                setupSecondSectionContent()
            }
        }
    }
    
// MARK: - First section
    @ViewBuilder private func setupFirstSectionContent() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(Strings.medianMultiple.rawValue)
                .fontWeight(.bold)
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    HorizontalChartView(
                        value: .constant(0.5),
                        color: .green
                    )
                    HStack {
                        Text(Strings.win.rawValue)
                            .foregroundStyle(.gray)
                        Text("1.94")
                            .fontWeight(.bold)
                    }
                    .padding(.bottom)
                }
                HStack(spacing: 15) {
                    HorizontalChartView(
                        value: .constant(0.7),
                        color: .red
                    )
                    HStack {
                        Text(Strings.loss.rawValue)
                            .foregroundStyle(.gray)
                        Text("2.17")
                            .fontWeight(.bold)
                    }
                    .padding(.bottom)
                }
                
                HStack(spacing: 15) {
                    HorizontalChartView(
                        value: .constant(0.2),
                        color: .gray
                    )
                    HStack {
                        Text(Strings.refund.rawValue)
                            .foregroundStyle(.gray)
                        Text("1.26")
                            .fontWeight(.bold)
                    }
                    .padding(.bottom)
                }
            }
        }
    }
    
// MARK: - Second section
    @ViewBuilder private func setupSecondSectionContent() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(Strings.winOrLoss.rawValue)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: -20) {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text(Strings.betsCount.rawValue)
                        .fontWeight(.bold)
                }
                
                DynamicChartView(
                    values: values,
                    colors: colors
                )
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ContentView()
}
