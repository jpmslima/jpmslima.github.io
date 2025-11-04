# Inferindo Filogenias usando MEGAX
Um curso intensivo.

Agora vamos usar este [conjunto de dados](https://drive.google.com/uc?export=download&id=13bsRE3MGmkKOL0mjT-DigvzerH0BDau6) para construir as árvores filogenéticas. Para isso, usaremos o *__MEGAX__*.

* Abra o alinhamento. 
* Na próxima janela, clique em <code style="border: 1px solid red; background-color: #f9f2f4; padding: 2px 5px; border-radius: 3px; color: #c7254e;">Analyze</code> como _DAMBE_ (sequências de nucleotídeos codificadoras de proteínas e o código genético).
* Teste do modelo de substituição de nucleotídeos.

    📌_O teste do modelo de substituição de nucleotídeos às vezes resulta em modelos que não estão presentes nas opções do MEGA. Nesses casos, você deve escolher um modelo que possua os parâmetros necessários adequados para representar seu alinhamento de sequências. Embora altamente recomendado, especialmente para iniciantes em análises filogenéticas, este teste não é crítico._
* Examine as estatísticas do alinhamento. Clique no ícone TA à direita para iniciar o Data Explorer.

* Construa uma árvore filogenética de Neighbor-joining, com um teste de bootstrap. Use a deleção completa neste conjunto de dados. Você pode usar Tamura-Nei 93, já que o modelo GTR não existe para o método Neighbor-Joining. Não se esqueça de examinar o parâmetro de forma gama para o modelo TN93 e a proporção de sítios invariantes (se necessário).

* Construa uma árvore filogenética usando Parcimônia e também Máxima Verossimilhança. Para este último, você pode usar o modelo GTR (General Time-Reversible), selecionado pelo teste do modelo de substituição de nucleotídeos. Use também a **_deleção completa_** em ambos os métodos.

    📌_No método ML, você não precisa ajustar um parâmetro de forma gama específico, apenas precisa configurar para usar Gamma._
    
* Não se esqueça de enraizar as árvores quando necessário e de salvá-las.
    
    A árvore demonstrada abaixo não está enraizada com o outgroup mais plausível!

## Exercício:
* Qual espécie você escolhe para ser o outgroup do conjunto de dados acima? Explique.
* Compare as árvores obtidas e explique a filogenia, sempre procurando por valores de bootstrap que a sustentem (ou não).