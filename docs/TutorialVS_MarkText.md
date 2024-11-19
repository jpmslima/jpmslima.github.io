![Biome](https://drive.google.com/uc?id=1Rgh88avopwh7YtUKsD5hXMwF3BFH5-Kj)

# Tutorial - Triagem Molecular Virtual (SBVS)

## _Acoplamento de inúmeros ligantes em um alvo biológico_

Observações:

- Este tutorial foi construído pela discente de doutorado do PPg-Bioinfo, M.Sc. Jéssika Viana, especificamente para as disciplinas de Bioinformática Estrutural, como parte das atividades do Estágio em Docência da UFRN. O tutorial foi revisado pelo professor da disciplina, João Paulo Matos (DBQ/CB e PPg-Bioinfo/BioME). Este tutorial foi construído ***apenas para fins didáticos***. **A reprodução dele para qualquer outro fim não é permitida e nem consentida pelo professor do curso e pela docente em estágio.**

## Introdução

Neste tutorial iremos utilizar o software [AutoDock Vina](http://vina.scripps.edu/), também visto no tutorial passado sobre atracamento molecular. Também iremos utilizar o Shell e a triagem virtual baseada na estrutura do receptor. O objetivo do estudo é avaliar se ligantes com características químicas similares ao inibidor [3WL]() (total de 100 ligantes) apresentam interação similar, maior ou menor com a proteína [3CLpro do SARS-CoV-2](). 

Este tutorial será dividido em seis partes:

- Otimização do receptor e geração do formato pdbqt
- geração da estrutura 3D dos ligantes
- criação de um arquivo de configurações
- criação do arquivo executor sh
- realização do VS baseado em docking
- análise dos resultados. 

## 1) Otimização do receptor e geração do formato pdbqt

Primeiramente, crie uma pasta/diretório para que todos os dados e resultados da triagem sejam alocados nela. Dentro deste novo diretório insira apenas a estrutura do receptor no formato PDBQT (você gerou este arquivo automaticamente no tutorial passado sobre docking no AutoDock Vina, como visto na figura abaixo). Nesta nova pasta o arquivo deve ser chamado de: _dock.receptor.pdbqt_

<img title="" src="file:///C:/Users/viana/Documents/estagioDocenciaII2020.2/minhasaulas/tutorial_vs/figura1.png" alt="" width="271" data-align="center">

## 2) Criação do arquivo de configurações

A seguir criaremos o arquivo de configurações no bloco de notas (ou Notepad++). Este arquivo, que deverá ser chamado de **dock.conf** e conterá as seguintes informações: 

receptor = dock.receptor.pdbqt

center_x = 116.00
center_y = -15.00
center_z = 67.00

size_x = 18.00

size_y = 18.00

size_z = 18.00

energy_range = 3

exhaustiveness = 8

num_modes = 9

A linha 1 contém a descrição “receptor”, que indica o arquivo do receptor em formato .pdbqt. Da linha 2-7 traz as coordenadas do sítio ativo, sendo estas marcadas pelo *center* (posição da caixa em x, y e z) e pelo *size* (tamanho da caixa em x, y e z). A linha 8, chamada de *num_modes*, identifica o número de poses/conformações existentes para cada molécula. 

![](C:\Users\viana\Documents\estagioDocenciaII2020.2\minhasaulas\tutorial_vs\figura2.png)

## 3) Geração da estrutura 3D dos ligantes

Copie a lista de códigos SMILE disponível neste link do drive: 

[ligantes.smi - Google Drive](https://drive.google.com/file/d/1M6yco6WaT0dG01OcKA1fEpv4dmvbuhp9/view?usp=sharing)

 e salve um arquivo como _moleculas.smi_

Veja abaixo que este arquivo contém, em cada linha, o formato SMILE (1D) da estrutura de uma molécula. É com este código que iremos criar as estruturas tridimensionais das moléculas.

<img title="" src="file:///C:/Users/viana/Documents/estagioDocenciaII2020.2/minhasaulas/tutorial_vs/figura3.png" alt="" width="563" data-align="center">

Em seguida, no terminal siga até o caminho de encontro a sua pasta/diretório. Nele, que já contém o arquivo dock.receptor.pdbqt, você irá inserir as estruturas das moléculas 3D. Para isso, no terminal, execute os seguintes comandos:

```sh
obabel -ismi moleculas.smi -omol2 -0ant*.mol2 --gen3D 
obabel ant*.mol2 -O lig*.pdbqt
```

Utilizando o comando ls veja que foram criados os ligantes com o nome ligant1, ligant2... em formato PDBQT. Basicamente o que o comando realizou foi converter as estruturas que estavam em formato smi (SMILE) em estruturas em formato 3D no formato mol2. No segundo comando convertemos do formato mol2 3D para em formato PDBQT. Este último formato é essencial para a realização do docking no Autodock Vina sob linha de comando.

![](C:\Users\viana\Documents\estagioDocenciaII2020.2\minhasaulas\tutorial_vs\figura4.png)

## 4) Criação do arquivo executor .sh

Em seguida, crie um arquivo chamado vina_screen_local.sh, que será o nosso script para execução do docking. Para isso, baixe o link através do [Manual Virtual Screening](http://vina.scripps.edu/vina_screen_local.sh) do AutoDock Vina. 

Note que o Script do AutoDock Vina contém uma nomeação diferente para alguns arquivos. Desta forma, altere a 3ª linha de ligand para **ligant** e a 7ª linha altere o conf.txt por **dock.conf**, como demonstrado na seguinte imagem:

![](C:\Users\viana\Documents\estagioDocenciaII2020.2\minhasaulas\tutorial_vs\figura5.png)

Neste script é possível observar uma série de comandos que culminará no cálculo da interação de cada ligante com receptor selecionado. Na 6ª linha é possível observar a execução do programa Vina, que chamará os arquivos de configuração do sítio ativo (que contém também a referencia do receptor) e os ligantes em pdbqt. Como dados de saída são gerados dois arquivos, que veremos no tópico seguinte.

A partir deste ponto você deverá ter em seu diretório: o arquivo de coordenadas do sítio ativo (**dock.conf**), o arquivo do receptor (**dock.receptor.pdbqt**), os arquivos de cada ligante (**ligant1, ligant2...**) e o arquivo executor (**vina_screen_local.sh**). Neste caso executarei o VS do docking para os dois primeiros ligantes, mas faça para todos os ligantes em pdbqt!

##### Não se esqueça de verificar antes!

![](C:\Users\viana\Documents\estagioDocenciaII2020.2\minhasaulas\tutorial_vs\figura6.png)

## 5) Realização do VS baseado em docking

No terminal do Linux, vá para seu diretório e digite o comando de execução do script abaixo:

```sh
chmod +x vina_screen_local.sh
./vina_screen_local.sh
```

No terminal será executado o processamento do docking para cada ligante. Pode demorar um pouco, e vai variar pela quantidade de ligantes utilizados. Em nosso caso pode-se demorar cerca de 30 minutos.

![](C:\Users\viana\Documents\estagioDocenciaII2020.2\minhasaulas\tutorial_vs\figura7.png)

Observe que é gerado na tela do terminal um pequeno resumo do docking em cada ligante, contendo o valor de energia para cada conformação do ligante analisado. 

Ao final de todo o processamento, verifique seu diretório. Observe que foram criadas pastas para cada ligante do estudo. Em cada pasta conterá um arquivo log.txt e um arquivo out.pdbqt.

O arquivo log.txt conterá as informações de energia (afinidade de ligação) e o RMSD de cada conformação com relação ao composto de melhor energia. O arquivo out.pdbqt conterá os valores de energia e as coordenadas X, Y e Z de cada conformação gerada no docking. É com ele que veremos nossos resultados dentro do UCSF Chimera.

## 6) Análise dos resultados

Após finalizado a VS baseado em docking, criaremos um arquivo chamado de *vina_screen_get_top.py*.
O script do seguinte arquivo está apresentado [nesta página](http://vina.scripps.edu/vina_screen_get_top.py). Copie os dados, cole em um bloco de notas (ou notepad++) e salve com o nome: *vina_screen_get_top.py*

<img title="" src="file:///C:/Users/viana/Documents/estagioDocenciaII2020.2/minhasaulas/tutorial_vs/figura8.png" alt="" width="546" data-align="center">

Em seguida, no terminal, execute o seguinte comando:

```sh
python2 vina_screen_get_top.py 10
```

Note que ao final do comando digitamos o valor 10. Esse valor, chamado de argumento, demonstra que o script deve selecionar os 10 ligantes de melhor interação (ou seja, os 10 ligantes que apresentaram os valores mais negativos de energia). Na tela ele mostrará o número de arquivos encontrados, a pasta referente ao ligante e o arquivo que contém o valor de energia (out.pdbqt). Ao fazer isso, vá em cada pasta do ligante selecionado e verifique o valor de energia (através do arquivo log.txt ou do out.pdbqt).

<img src="file:///C:/Users/viana/Documents/estagioDocenciaII2020.2/minhasaulas/tutorial_vs/figura9.png" title="" alt="" data-align="center">

Para visualizar o resultado no UCSF Chimera: 

> Tools > Surface/Binding Analysis > View Dock > arquivo out.pdbqt

## 

## Atividade

Agora observe seus resultados da triagem virtual e responda as seguintes indagações: 

Quais ligantes apresentaram os 10 melhores valores de interação com a enzima 3CLpro? E quais os valores de energia desses ligantes? Descreva-os criando uma tabela. 

Qual o flavonoide que apresentou a pior interação com a enzima 3CLpro? 

No Chimera, observe as diferenças das ligações de hidrogênio (veja o tutorial passado de docking). Quantas ligações de hidrogênio foram identificadas no composto de maior energia? 

Observe as poses (as várias conformações de cada ligante) para cada ligante. Quais diferenças você pode notar sobre a estrutura dos flavonoides? Em qual fragmento molecular é possível identificar maior movimentação na estrutura? 

**Instalando os programas no Linux através do terminal:**

OpenBabel       | sudo apt install openbabel       |

AutoDock Vina | sudo apt install autodock-vina |
