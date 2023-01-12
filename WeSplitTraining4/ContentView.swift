//
//  ContentView.swift
//  WeSplitTraining4
//
//  Created by Putut Yusri Bahtiar on 06/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0
    @State private var numberOfPeople = 2
    @State private var tipsPercentage = 0
    @State private var currency = "USD"
    
    let tipsPercentages = [10, 15, 20, 25]
    let currencies = ["USD", "EUR", "IDR", "JPY"]
    
    
    var totalPerson: Int {
        let checkAmount = Int(amount)
        let checkNumberOfPeople = Int(numberOfPeople + 2)
        
        let totalTips = checkAmount / 100 * tipsPercentage
        let grandTotal = totalTips + amount
        let payPerPerson = grandTotal / checkNumberOfPeople
        
        return payPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .currency(code: currency))
                        .id(currency)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Currency", selection: $currency) {
                        ForEach(currencies, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .pickerStyle(.segmented)
                
                Section {
                    Picker("Tips Percentage", selection: $tipsPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How Much Tips ?")
                }
                
                Section {
                    Text(amount, format: .currency(code: currency))
                } header: {
                    Text("Total Amount")
                }
                
                Section {
                    Text(totalPerson, format: .currency(code: currency))
                } header: {
                    Text("Amount per rperson")
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
