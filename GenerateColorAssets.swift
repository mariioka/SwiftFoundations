import Foundation

struct ColorItem: Decodable {
    let name: String
    let color: String
}

let jsonPath = "./colors.json" 
let outputFolder = "./Cores" 

let fileManager = FileManager.default
try? fileManager.createDirectory(atPath: outputFolder, withIntermediateDirectories: true)

guard let data = fileManager.contents(atPath: jsonPath),
      let colors = try? JSONDecoder().decode([ColorItem].self, from: data) else {
    print("Erro ao carregar JSON")
    exit(1)
}

for color in colors {
    let colorSetFolder = "\(outputFolder)/\(color.name).colorset"
    try? fileManager.createDirectory(atPath: colorSetFolder, withIntermediateDirectories: true)

    let contents: [String: Any] = [
        "info": [
            "version": 1,
            "author": "xcode"
        ],
        "colors": [
            [
                "idiom": "universal",
                "color": [
                    "color-space": "srgb",
                    "components": [
                        "red": String(Int(color.color.dropFirst().prefix(2), radix: 16)!) + "/255.0",
                        "green": String(Int(color.color.dropFirst(3).prefix(2), radix: 16)!) + "/255.0",
                        "blue": String(Int(color.color.dropFirst(5).prefix(2), radix: 16)!) + "/255.0",
                        "alpha": "1.0"
                    ]
                ]
            ]
        ]
    ]

    let jsonData = try! JSONSerialization.data(withJSONObject: contents, options: .prettyPrinted)
    try! jsonData.write(to: URL(fileURLWithPath: "\(colorSetFolder)/Contents.json"))
}

print("Color Assets gerados com sucesso na pasta '\(outputFolder)'")
