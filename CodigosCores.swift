//Codigo Cor para o fundo do Card
//dentro de PokemonCard(View)
struct PokemonCardView: View {
    var body: some View {
        HStack {
        }
        .background(Color("\(pokemon.types.first)Color"))
    }
}

//Codigo Cor para o fundo do Text: tipo
//dentro de PokemonCard(View)
    ForEach(pokemon.types, id: \.self) { type in    //for tipos
        Text(type.rawValue.capitalized)             //Text(tipo)
            .background(type.color)
            .foregroundColor(.white)
    }
