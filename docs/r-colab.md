# Introdução ao R

Um tutorial básico para introduzir os primeiros comandos na linguagem/ambiente estatístico [R](https://www.r-project.org/). Para a execução dos comandos abaixo não é necessária a instalação do R em sua máquina. O GoogleColaboratory incluiu há alguns anos, o suporte a um ambiente de execução em R, que funciona muito bem, inclusive com pacotes do [Bioconductor](https://bioconductor.org).

>*Se você quiser modificar o notebook descrito nessa página, salve uma cópia dele no seu próprio GoogleDrive*. *Esta cópia só será possível ser acessada como usuário visualizador e não tem permissões de edição.*

## Observações Importantes

Este tutorial introdutivo ao R no Colab foi baseado ou adaptado dos seguintes tutoriais, apenas para fins didáticos. Reprodução do tutorial ou de trechos deles devem vir acompanhados das referências originais.

- Apresentação em pdf:
    - [https://professordanilo.com.br/wp-content/uploads/2020/10/Slide-Introducao-ao-R.pdf](https://professordanilo.com.br/wp-content/uploads/2020/10/Slide-Introducao-ao-R.pdf) (Trechos de texto e do código)
- Outros Tutoriais:
    - [https://vanderleidebastiani.github.io/tutoriais/Introducao_ao_R.html](https://vanderleidebastiani.github.io/tutoriais/Introducao_ao_R.html) (Trechos de texto e do código)
    - [https://ucdavis-bioinformatics-training.github.io/2022_February_Introduction_to_R_for_Bioinformatics/](https://ucdavis-bioinformatics-training.github.io/2022_February_Introduction_to_R_for_Bioinformatics/) (Exemplos)
    - [https://bio723-class.github.io/Bio723-book/index.html](https://bio723-class.github.io/Bio723-book/index.html) (Exemplos)
    - [https://bioinformatics.ccr.cancer.gov/docs/data-visualization-with-r/Lesson2_intro_to_ggplot/](https://bioinformatics.ccr.cancer.gov/docs/data-visualization-with-r/Lesson2_intro_to_ggplot/) (Exemplos).

## Endereço do Notebook Jupyter-Colab/R

O notebook poderá ser acessado em:

[Introdução ao R-Colab](https://colab.research.google.com/drive/1D_nDMbIidES4II4YyQxCSzOy4fCsskly?usp=sharing)

## O que é o R?

Inicialmente escrito por Robert Gentleman e Ross Ihaka do Departamento de Estatística da Universidade de Auckland (Nova Zelândia), o R é uma linguagem e um ambiente de programação voltado para manipulação, análise de dados e apresentação gráfica. É um projeto em constante desenvolvimento pela comunidade científica e desenvolvedora, e mantida pelo *R Development Core Team*.

O R possui uma estrutura de código aberto (*open source*) sendo gratuito com distribuição livre. Parte dos métodos estão implementados no ambiente básico do R (R base), mas muitos métodos estão implementadas em pacotes de funções adicionais (packages), disponíveis em repositórios como o [CRAN](https://cran.r-project.org/) e o [Bioconductor](https://www.bioconductor.org/).

### Vantagens e Desvantagens do R

- O ambiente R é livre e de código-aberto. Qualquer pessoa tem a liberdade para instalar, usar e modificar.
- É multiplataforma, funcionando em todos os sistemas operacionais de computadores pessoais e em ambientes web (como o GoogleColab) e servidores remotos.
- É escalável e eficiente para lidar com grandes quantidades de dados (*big data*), cálculos e apresentações gráficas, sendo a linguagem/ambiente preferida por cientistas de dados.
- Atualmente, junto com Python é uma das principais linguagens utilizadas para análise de dados em Bioinformática.

#### Desvantagens

- Os primeiros contatos e entendimento dos comandos e das diferentes estruturas de dados pode ser desafiador, principalmente para pessoas não acostumadas com ambiente de linha de comando.
- Apresenta conflitos de versões que normalmente são facilmente contornáveis.

### Interface

O R funciona por meio de linhas de comandos. Junto com os comandos ele recebe os dados, executa as funções e retorna os resultados. O R quanto o RStudio apresentam algumas janelas:

O **Console** é a janela principal (a única que abre ao iniciar o R). Nela é possível digitar os comandos, vizualizar os resultados e mensagens de alerta e mensagens de erros. É possível navegar pelas funções já executadas, mas é difícil de editar os comandos nesta janela. Nesta janela a seta (>) indica que o R esta pronto para receber um comando; o sinal de mais (+) indica que o comando da linha anterior ainda não esta completo, faltando algo para o comando ser executado. A ausência de um desses dois simbólos (> ou +) indica que o R ainda não finalizou o processo do comando anterior. Normalmente quando são mostrados os resultados de uma função um símbolos de cochetes ([]) com um valor numério (geralmente começa com [1]) é mostrado. Esse valor indica a posição (índice) do primeiro valor da respectiva linha.

### Área de trabalho e diretório de trabalho

O R é uma linguagem de programação orientada a objeto, nele os objetos são atribuidos e salvos automaticamente de maneira temporária em uma área de trabalho (*workspace*). Ao abrir o R o *workspace* estará vazio, mas pode-se criar novos objetos para armazenar dados ou resultados de análises. Uma vez armazenados esses objetos podem ser exportados ou salvos em arquivos. Ao fechar o R, os objetos da área de trabalho serão apagados, exceto se foram anteriormente salvos.

O R sempre fica associado a uma pasta específica do seu computador, essa pasta será o diretório de trabalho (*working directory*). Os arquivos que estão neste diretório são fáceis de carregar e qualquer arquivo exportado será salvo no diretório caso não especificado o contrário. O diretório de trabalho pode ser alterado, sem qualquer mudanças nos objetos da área de trabalho.

## Visualização do Notebook

O Notebook completamente executado, para fins de conferência, está descrito abaixo.

<script src="https://gist.github.com/jpmslima/7f9bea22baef31fce83b19f86983a84e.js"></script>