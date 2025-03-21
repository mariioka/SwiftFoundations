//Modificação desenho:
/*ZStack {
VStack{
    HStack{Text()
            Text()}
    HStack{
        VStack{ForEach(type)}
                Image}
}
}
*/

import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            VStack {
                // Primeiro HStack: Nome e ID
                HStack {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Text("#\(pokemon.id)")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.trailing)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                }
                .padding([.top, .horizontal])

                // Segundo HStack: Tipos e Imagem
                HStack {
                    // Tipos do Pokémon em um VStack
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(pokemon.types, id: \.self) { type in
                            Text(type.rawValue.capitalized)
                                .font(.caption)
                                .padding(5)
                                .background(type.color.opacity(0.2)) // Cor do tipo
                                .cornerRadius(5)
                        }
                    }
                    
                    Spacer()
                    
                    // Imagem do Pokémon
                    Image(pokemon.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
                .padding([.horizontal, .bottom])
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
