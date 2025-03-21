### Modificação desenho:
Cima: Nome e id
Baixo: Tipos e Img

```swift
ZStack {
VStack{
    HStack{Text()
            Text()}
    HStack{
        VStack{ForEach(type)}
                Image}
}
}
```

### Modificação 2
Esquerda: Nome do Pokémon (acima) e os Tipos (abaixo).
Direita: ID do Pokémon (na mesma altura do nome) e a Imagem (abaixo do ID).

```swift
ZStack{
    HStack{
        VStack{
            Text(name)
            VStack{
                ForEach(type)
            }
        }
        VStack{
            Text(id)
            Image()
        }
    }
}
```