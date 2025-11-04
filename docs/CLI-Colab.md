# Introdução ao *Shell* no GoogleColab

Embora pareça assustadora para iniciantes, a Interface de Linha de Comando (CLI) é uma forma poderosa de lidar diretamente com a máquina e os dados a serem analisados. É uma das formas usuais de trabalho em Bioinformática e em ciências de dados. É também pela CLI que acessamos servidores computacionais remotos para a execução de tarefas mais complexas.

Para evitarmos a instalação de programas nos computadores da sala ou no seu computador pessoal utilizaremos o ambiente do GoogleColab. O ambiente do Colab é uma máquina virtual executando Ubuntu Linux, e os usuários têm acesso root, permitindo a instalação de softwares conforme necessário. Isso o torna adequado para praticar vários comandos Linux relacionados à manipulação de arquivos, gerenciamento de pacotes e administração do sistema. Ele também serve como um ambiente de desenvolvimento em Python, Julia e R (como veremos em neste outro notebook).

## O que são os notebooks computacionais?

Os notebooks Jupyter são uma ferramenta interativa usada para programação, análise de dados e documentação. Eles permitem que os usuários combinem código, texto explicativo, fórmulas matemáticas, gráficos e outros elementos em um único documento.Eles são muito utilizados em ciência de dados, aprendizado de máquina e pesquisa acadêmica, pois facilitam o compartilhamento e a reprodutibilidade de experimentos computacionais. O GoogleColab os incorpora em uma máquina virtual para você ter seu próprio ambiente de desenvolvimento ou análise de dados.

## O que é a *Shell*?

Um *shell* é um programa que recebe comandos digitados pelo usuário ou armazenados em arquivos e os encaminha para o sistema operacional, que então os executa. O *shell* é acessado por meio de um terminal ou emulador de terminal.

Ken Thompson, do Bell Labs, desenvolveu o predecessor do *shell* moderno para a primeira versão do UNIX em 1971. Em 1977, Stephen Bourne introduziu o Bourne shell (`sh`), que adicionou a capacidade de invocar scripts (pequenos programas reutilizáveis) dentro do shell. O Bourne shell ainda é relevante e, em alguns casos, continua sendo o shell padrão do usuário root.

Hoje é mais comum utilizarmos o Bash, conhecido como *Bourne Again Shell*. Este foi desenvolvido por Brian Fox para substituir o Bourne shell. Ele adiciona vários recursos úteis ao `sh` e é o shell padrão do terminal de várias distribuições Linux.

### Observações

- Este tutorial foi adaptado a partir do Livro The Biostars Handbook (Istvan Albert, 2022) e do *Command-line Bootcamp** por Keith Bradnam e está licenciado via Creative Commons Attribution 4.0 International License. O conteúdo original foi traduzido e modificado em parte de sua estrutura apenas para fins didáticos. **A reprodução dele para qualquer outro fim não é permitida e nem consentida.**

## Acesso ao Notebook

O notebook pode ser acessado e executado no modo playground no link abaixo:

[Introdução a CLI-Colab](https://colab.research.google.com/drive/1mhX_2Ua3aqJeCzIpiUtrcHcYwjHQDPbD?usp=sharing)

## Visualização do GoogleColab

O Notebook completamente executado, para fins de conferência, está descrito abaixo.

<script src="https://gist.github.com/jpmslima/b952f357094385c0d7262943bd48ad44.js"></script>