# Estudo Arquitetura TCA - Parte 4

![](https://github.com/naiadelali/ContactsTCA-Part2/blob/main/Diagram.png?raw=true)

## Repositórios do Estudo

- Parte 1: [CounterTCA](https://github.com/naiadelali/CounterTCA)
- Parte 2: [CounterTCA-Part2](https://github.com/naiadelali/CounterTCA-Part2)
- Parte 3: [ContactsTCA-Part1](https://github.com/naiadelali/ContactsTCA-Part1)


Este README abrange as parte4 do estudo sobre a Arquitetura Componível (TCA) aplicada em projetos SwiftUI, focando na gestão de múltiplas funcionalidades de navegação e na melhoria da modelagem de domínio para uma aplicação de contatos.

## Parte 5: Destinos Múltiplos de Apresentação

Exploramos como um recurso pai pode apresentar múltiplos recursos filhos, incluindo a implementação de funcionalidades para adicionar e deletar contatos, com uma etapa de confirmação para exclusões.

### Principais Aprendizados:

- **Modelagem de Domínio para Apresentações**: Uso de `Presents()` e `PresentationAction` para modelar o estado de apresentação de funcionalidades filhas e alertas.
- **Confirmação de Ações**: Implementação de alertas para confirmar ações críticas, como a exclusão de contatos, utilizando `AlertState`.

## Parte 6: Melhoria da Modelagem de Domínio

A parte 6 foca na otimização da modelagem de domínio para navegação entre múltiplos destinos, substituindo múltiplos valores opcionais por um único enum opcional, garantindo um modelo de domínio mais conciso e seguro.

### Principais Aprendizados:

- **Enum para Navegação**: Uso de um enum para representar todos os possíveis destinos de navegação, eliminando estados inválidos e simplificando a lógica de apresentação.
- **Comunicação Pai-Filho Aprimorada**: Implementação de ações de delegação para uma comunicação direta e clara entre recursos pai e filhos.

