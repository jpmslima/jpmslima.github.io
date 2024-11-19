# Instalando o NCBI-Entrez-Direct-E-utilities

## Introdução

*O Entrez Direct (EDirect) fornece acesso ao conjunto de bancos de dados interligados do NCBI (pubmed, seqüência, estrutura, gene, variação, expressão, etc.) a partir do terminal Unix. Os termos de busca são inseridos como argumentos de linha de comando. As operações individuais são conectadas via pipes (`|`) Unix para construir consultas em várias etapas. Os registros selecionados podem então ser recuperados em uma variedade de formatos* (Traduzido e adaptado de [Kanz, J](https://www.ncbi.nlm.nih.gov/books/NBK179288/)).

A grande vantagem do EDirect é que você já baixar os arquivos diretamente no servidor, sem precisar fazer comandos de cópia remota de arquivos (como o`scp`). Evita também que você fique procurando e baixando sequências navegando no NCBI, o que pode ser muito lento e demorado. Todos os programas já são escritos para se trabalhar com uma grande quantidade de dados e arquivos com muitas informações. O número de requisições via o EDirect é limitado. No entanto, esta limitação pode ser amenizada se você obter uma chave API. Para isso basta criar uma conta gratuita no NCBI. A vantagem de criar uma conta do tipo, além do acesso mais rápido via EDirect, é que todas as suas consultas ao NCBI ficam salvas por um período.

> *A criação da conta no NCBI é opcional para a execução deste tutorial.*

## Acessando a linha de comando

Siga as instruções abaixo para acessar a linha de comando e fazer este tutorial. Você também pode fazer em seu próprio computador, desde que ele tenha um terminal devidamente instalado. 

### Em máquinas Windows:

Há um bash (com um subsistema Ubuntu) apenas para o Windows 10 em diante (caso queira utilizar seu computador pessoal). Se quiser se aventurar, para habilitá-lo siga [ESTES PASSOS](https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/) ou procure no Google como proceder.

No caso de usar o subsistema acima, não é necessário o acesso ao servidor para treinar, apenas para verificar os arquivos pedidos.

### Em Máquinas Linux/MacOS:

Em máquinas Linux e Mac, basta abrir o programa Terminal. Não é necessária nenhuma instalação adicional (apenas a que estarão descritas abaixo).

## Instalando o EDirect

Para instalar a ferramenta iremos utilizar o comando `wget`, visto em tutoriais anteriores. Para isso, digite no terminal a seguinte linha:

```shell
sh -c "$(wget -q ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh -O -)"
```

O comando acima é em linguagem de *shell*. Ele chama o interpretador padrão do sistema chamado `dash`. O argumento `-c` indica para ele executar a linha que vem logo após. Vamos interpretar esta linha de forma bem coloquial:

¨*Execute o conjunto de instruções em shell, contidos no arquivo remoto `install-edirect.sh`, o qual você irá baixar com o comando `wget`, a partir desse servidor FTP (file transfer protocol).*"

O processo de instalação é bem auto-explicativo (em língua inglesa). Durante a instalação, ele irá "perguntar" o seguinte:

```shell
Entrez Direct has been successfully downloaded and installed.

In order to complete the configuration process, please execute the following:

  echo "export PATH=\${PATH}:/home/jpmslima/edirect" >> ${HOME}/.bashrc

or manually edit the PATH variable assignment in your .bashrc file.

Would you like to do that automatically now? [y/N]
```

- Digite **y** no terminal, para que o programa adicione automaticamente a entrada do diretório `~/edirect` no seu **$PATH** (veja o tutorial 101), para que você possa executá-lo diretamente sem precisar dar o caminho inteiro dos programas.

- A instalação irá terminar com a seguinte mensagem:

```shell
To activate EDirect for this terminal session, please execute the following:

export PATH=${PATH}:${HOME}/edirect
```

- Agora você digita o comando acima descrito:

```shell
export PATH=${PATH}:${HOME}/edirect
```

> *Esta última etapa é apenas para garantir que os programas já estarão acessíveis na sessão de terminal que estás logado. Daí não precisarás realizar logout e login novamente.*

Pronto, o EDirect está instalado na sua `HOME` e você poderá acessar os dados do NCBI diretamente pela linha de comando. Para testar, execute o comando abaixo:

```shell
efetch -db nuccore -id NM_000402 -format gb
```

A saída será a mesma informação que você obteve na primeira parte do tutorial 103, ou seja, as informações da sequência com o código de acesso [NM_000402](https://www.ncbi.nlm.nih.gov/nuccore/NM_000402).

## Baixando sequências diretamente pela linha de comando

Antes de você construir um banco BLAST customizado às suas necessidades, você precisa estar com os arquivos das sequências (nucleotídeos ou aminoácidos) no formato `fasta`. O que iremos fazer agora é baixar diretamente do GenBank as sequências de aminoácidos e de nucleotídeos partir de uma lista de códigos de acesso. Iremos verificar duas formas de obtenção desta lista: baixando-a remotamente com o `wget` ou utilizando o editor de texto `nano`.

### Baixando a lista de acessos remotamente

- Crie dentro da sua **HOME** um diretório chamado blastdbs:

```shell
mkdir blastdbs
```

- Navegue para o diretório:

```shell
cd blastdbs
```

- Digite o seguinte comando para baixar a lista dos acessos:

```shell
wget 'https://drive.google.com/uc?export=download&id=1MESslHMyHzOzoBDA39tgOdJ_Hyc3_CKO' -O proteins-acc
```

- Confirme a presença do arquivo `proteins-acc` com o comando `ls`.

### Criando um arquivo com o editor nano

Você pode criar diretamente o arquivo com o editor `nano`. Para isso execute:

```shell
nano proteins-acc
```

- Cole a lista abaixo de acessos no editor e salve o arquivo.

```shell
NP_001346945.1
NP_058702.1
NP_032088.1
XP_005162067.1
XP_024843520.1
XP_027818565.1
XP_025131861.1
XP_021471295.1
XP_012816652.1
NP_001253399.1
XP_020936403.1
XP_017899827.1
XP_023104962.1
XP_026567408.1
XP_019811665.1
XP_034505492.1
XP_004780805.1
XP_020027787.1
XP_006754841.1
XP_032331081.1
XP_017343061.1
NP_001233656.1
XP_031649832.1
XP_035145604.1
XP_023489863.1
XP_005086956.1
XP_022594835.1
XP_008827828.1
XP_029464344.1
XP_030050095.1
XP_007229025.3
XP_029575813.1
XP_030215761.1
XP_032825513.1
XP_014352665.1
XP_006625332.1
XP_031421521.1
XP_035378414.1
XP_010895992.2
XP_014001019.1
XP_023846491.1
XP_035995904.1
XP_005801804.1
XP_032429507.1
XP_013131145.2
XP_005926249.1
XP_026010264.1
XP_030277546.1
XP_010777945.1
XP_040297957.1
XP_040180762.1
XP_037744745.1
XP_005280188.1
XP_006274306.1
XP_034996671.1
XP_026531948.1
XP_040399730.1
XP_021137840.1
XP_021239628.1
XP_018780989.1
XP_015471627.1
XP_039569252.1
XP_014749058.1
XP_001505636.2
XP_038604188.1
XP_031800578.1
XP_036596424.1
XP_004482916.1
XP_016050363.1
XP_004717609.1
XP_006915387.2
XP_015979354.2
XP_037007399.1
XP_024406862.1
XP_032121205.1
XP_011902277.1
XP_005595069.2
XP_011716116.1
XP_025228079.1
XP_011828370.1
XP_018874453.2
XP_008951103.2
XP_024096176.1
XP_038307225.1
XP_025843884.1
XP_025790085.1
XP_027463639.1
XP_012422862.1
XP_035949085.1
XP_006739426.1
XP_034866677.1
XP_032253384.1
XP_030707458.1
XP_012394915.2
XP_033705597.1
XP_022422332.1
XP_028338528.1
XP_036696522.1
XP_010599375.1
XP_014689597.1
XP_008508598.1
XP_031302168.1
XP_020749442.1
XP_036881003.1
XP_004598934.1
XP_008248507.1
XP_015362441.1
XP_026236864.1
XP_012890820.1
XP_037055256.1
XP_021514945.1
XP_021009488.1
XP_029389912.1
XP_032745502.1
XP_005000084.1
XP_023561110.1
XP_021107999.1
XP_001362827.2
XP_006130125.2
XP_036126165.1
XP_037677121.1
XP_039319925.1
XP_028669262.1
XP_038237436.1
XP_008102138.1
XP_006899974.1
XP_040482628.1
XP_027991921.1
XP_021538540.1
XP_027694718.1
XP_030626021.1
XP_025909056.1
XP_027390808.1
XP_031531292.1
XP_012613637.1
XP_023364223.1
XP_011600934.2
XP_026909083.1
XP_005414274.2
XP_025718641.1
XP_032066987.1
XP_031220468.1
XP_032187492.1
XP_029785644.1
XP_012322480.1
XP_020831264.1
XP_025066596.1
XP_036029847.1
XP_029096312.1
XP_032475358.1
XP_004606548.1
XP_037397543.1
XP_039909987.1
XP_005340714.1
XP_030921325.1
XP_037367642.1
XP_036160253.1
XP_004672181.1
XP_013873430.1
XP_032857731.1
XP_029133544.1
XP_014310334.1
XP_036271581.1
XP_032959375.1
XP_040121427.1
XP_041567949.1
XP_016160403.1
XP_007991356.1
XP_034342296.1
XP_030162145.1
XP_017712906.1
XP_030790280.1
XP_030663504.1
XP_026223646.1
XP_028567138.1
XP_005910173.1
XP_007099298.2
XP_024240570.1
XP_016140048.1
XP_032702166.1
XP_013210452.1
XP_033028704.1
XP_022060189.1
XP_032612180.1
XP_036261395.1
XP_017584147.1
XP_030826141.1
XP_039184187.1
XP_028378087.1
XP_026955663.1
XP_032939439.1
XP_027777503.1
XP_034290185.1
XP_039080728.1
XP_020667741.1
XP_015667713.1
XP_032633845.1
XP_005886155.1
XP_018581469.1
XP_027563930.1
XP_026344934.1
XP_007457506.1
XP_018417324.1
XP_040830571.1
XP_011373871.1
XP_039722940.1
XP_036779468.1
XP_004695301.2
XP_015266120.1
XP_023801124.1
XP_010015302.1
XP_007425795.1
XP_005533421.1
XP_006878045.1
XP_019489215.1
XP_036912872.1
XP_026187248.1
XP_041331217.1
XP_015841550.1
XP_014439303.1
XP_039366744.1
XP_033776188.1
XP_010169878.1
XP_031172640.1
XP_025316330.1
XP_016077414.1
XP_021408363.1
XP_028849056.1
XP_005732684.1
XP_025924353.1
XP_007184661.1
XP_017695500.1
XP_011811218.1
XP_041263110.1
XP_012517460.1
XP_013026300.1
XP_031700257.1
XP_028308484.1
XP_037539775.1
XP_008587150.1
XP_028640437.1
XP_041596560.1
XP_029910808.1
XP_010637096.1
XP_039428502.1
XP_038172127.1
XP_007955328.1
XP_027000366.1
XP_016353088.1
XP_040323331.1
XP_023655523.1
XP_024601970.1
XP_030404187.1
XP_023284428.1
XP_021565823.1
XP_030330174.1
XP_017376293.1
XP_018961996.1
XP_033927614.1
XP_014652995.1
XP_012415241.1
XP_022347104.1
```

### Baixando as sequências

Com a lista de acessos obtida, iremos agora baixá-la usando a ferramenta `efetch` do EDirect.

```shell
efetch -db protein -input proteins-acc -format fasta > G6PD-craniata-AA.fasta
```

- Os argumentos significam:
  
  - `-db`: o banco de dados dos acessos. Neste caso, o de proteínas.
  
  - `-input`: o nome do arquivo contendo a lista com todos os acessos, um por linha. Neste caso o arquivo `proteins-acc`.
  
  - `-format`: o formato de saída do arquivo. Neste caso, iremos requisitar já as sequências no formato fasta.
  
  - `> G6PD-craniata-AA.fasta`: a saída do comando para o arquivo de nome `G6PD-craniata-AA.fasta`.

Confirme o conteúdo do arquivo, utilizando o comando `more`, `head` ou `tail`. As **sequências de aminoácidos** deverão estar no formato fasta.

Usando a mesma lista de acessos, iremos agora baixar as sequências de nucleotídeos que codificam para essas proteínas (CDS):

```shell
efetch -db protein -input proteins-acc -format fasta_cds_na > G6PD-craniata-NTs.fasta
```

- Note que apenas um dos argumentos foi modificado:
  
  - `-format fasta_cds_na`: sequências codificantes no formato `fasta`.

Confirme novamente o conteúdo do novo arquivo, utilizando o comando `more`, `head` ou `tail`. As **sequências de nucleotídeos** deverão estar no formato fasta.

Vamos agora baixar duas sequências para servirem como consulta no banco BLAST que iremos criar nas próximas etapas:

```shell
efetch -db nuccore -id NM_069728.7 -format fasta > NT-teste.fasta
efetch -db protein -id NP_502129.1 -format fasta > AA-teste.fasta
```

Confirme se todos os arquivos estão presentes no seu diretório com um `ls`.
