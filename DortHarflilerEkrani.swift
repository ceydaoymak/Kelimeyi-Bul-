//
//  DortHarflilerEkrani.swift
//  Kelimeyi Bul
//
//  Created by ceyda oymak on 5.02.2025.
//

import SwiftUI

struct DortHarflilerEkrani: View {
    @State private var wordList: [String] = []
    @State private var textInputs: [[String]] = Array(repeating: Array(repeating: "", count: 4), count: 5)
    @State private var SelectedWord: String = " "
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)
    var body: some View {
        
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hue: 0.619, saturation: 0.887, brightness: 0.566, opacity: 1) ,
                    Color(hue: 0.0, saturation: 0.0, brightness: 0.85, opacity: 0.5),
                    
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Text("Kelimeyi Tahmin Et!").foregroundColor(.white).fontWeight(.bold).font(.title).padding(.bottom,60)
                ForEach(0..<5, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(0..<4, id: \.self) { column in
                            TextField("", text: $textInputs[row][column])
                                .frame(width: 50, height: 50)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.center)
                                .font(.title)
                        }
                    }
                }
            }
            .padding()
        }
    }
    func loadWords() {
            guard let fileURL = Bundle.main.url(forResource: "4harfliler", withExtension: "txt") else {
                print(" Dosya bulunamadı!")
                return
            }
            
            do {
                let content = try String(contentsOf: fileURL, encoding: .utf8)
                let words = content.components(separatedBy: "\n")
                    .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                    .filter { !$0.isEmpty }
                    .map { $0.uppercased(with: Locale(identifier: "tr_TR")) }

                self.wordList = words
                print(" \(words.count) kelime yüklendi.")
            } catch {
                print(" Dosya okunurken hata oluştu: \(error)")
            }
        
    }
func getRandomWord() -> String? {
        guard !wordList.isEmpty else {
            return nil
            
        }
   
    return wordList.randomElement()
    }
}
    struct DortHarflilerEkrani_Previews: PreviewProvider {
        static var previews: some View {
            DortHarflilerEkrani()
        }
    }
