import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            HStack {
                // Esquerda: Nome e Tipos
                VStack(alignment: .leading, spacing: 10) {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.leading)
                    
                    VStack {
                        ForEach(pokemon.types, id: \.self) { type in
                            Text(type.rawValue.capitalized)
                                .font(.caption)
                                .padding(5)
                                .background(type.color.opacity(0.2)) // Ajuste de cor baseado no tipo
                                .cornerRadius(5)
                        }
                    }
                }
                
                Spacer()

                // Direita: ID e Imagem
                VStack(alignment: .trailing, spacing: 10) {
                    Text("#\(pokemon.id)")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 16)
                        .padding(.trailing, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    Image(pokemon.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(Color.pokeGreen)
        .cornerRadius(12)
        .shadow(color: .green, radius: 9, x: 0.0, y: 0.0 )
        .shadow(radius: 2)
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard(pokemon: Pokemon(id: 150, name: "Mewtwo", types: [.psychic]))
    }
}
