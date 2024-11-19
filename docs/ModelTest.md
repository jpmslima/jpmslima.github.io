O objetivo do presente tutorial é mostrar as diferentes formas de avaliar e estimar um modelo de substituição de nucleotídeos (e aminoáciods também) adequado ao seu *dataset* para posterior análise filogenética.

Como ressaltado durante o curso, a etapa de estimar um modelo de substituição não é necessariamente obrigatória em toda análise filogenética. Quando se conhece bem as sequências de trabalho e as características do alinhamento obtido, o pesquisador pode escolher diretamente um único modelo matemático. No entanto, como são inúmeros modelos disponíveis, tal escolha pode ser desafiadora para iniciantes. No pior caso, o desconhecimento pode levar a escolha de um modelo que subestime caracterísitcas importantes do alinhamento, levando a estimativas de menor acurácia. Por outro lado, incluir muitos parâmetros aumenta a variância e consequentemente a precisão das análises.

Grande parte das ferramentas utiliza o princípio estatístico da verossimilhança (*L*). Para isso, eles calculam *L* para todos os modelos disponíveis e depois fazem uma classificação hierárquica (usando ou não critérios de informação). São cálculos computacionalmente intensos mesmo para muitos PCs atuais.

**Observação:**

- Este tutorial foi elaborado a partir de experiência pessoal, das leituras dos manuais e dos artigos de descrição dos programas, ***apenas para fins didáticos***. <span style="color:red">**A reprodução dele para qualquer outro fim não é permitida e nem consentida pelo professor do curso e pelo BioME.**</span>


## Usando o MEGA X

Nas suas primeiras versões o programa [MEGA](www.megasoftware.net)  não possuía uma rotina para realização de testes do modelo de substituição. Mesmo assim, ele foi um dos primeiros programas a incluir nativamente esta função. O algoritmo é rápido, no entanto ele testa um número maior de modelos dos que estão disponíveis na própria ferramenta.

- Utilizaremos o arquivo de alinhamento múltiplo de sequências [vert-aligned.fasta](https://drive.google.com/uc?export=download&id=12-vfD16vil2cTmNM2VOMfuj48LGo9iT2).
- Execute o programa MEGAX (nos computadores do curso o ícone estará na área de trabalho).
- Abra o alinhamento clicando no botão ``TA`` e em seguida em *Open a File/Session...*, de acordo com a figura abaixo:

![MegaX](https://drive.google.com/uc?id=1FJSEHkqgypK-v62xTtaN0D-9-Y_50Ih0)

- Na janela *pop-up* seguinte, clique em *Analyze* (essas sequências já foram alinhadas anteriormente):

![Analyze](https://drive.google.com/uc?id=1Y3fe37o7GmCXhcgr5VWJo3Y60vQUXYFy)

- O MEGA lhe fará as seguintes perguntas: se são sequências de nucleotídeos. Clique em Ok.

![Nucleotide sequences](https://drive.google.com/uc?id=1UxoBNG69mCqcMvWmynlKkMYYYMN5rGGh)

- Se são sequências codificantes para proteínas. Responda *Yes*.

![Coding sequences](https://drive.google.com/uc?id=1LP3I1oxJERBUTshJ78gMljzi0Iq2FHRa)

- Ao responder, você precisará selecionar o código genético específico. Clique em *Vertebrate Mitochondrial*:

![Select genetic code](https://drive.google.com/uc?id=1UdZJ6ywkOrnEQLTIexLHCD30sARuyAGD)

- Com o arquivo aberto, agora você clicará em ```Models```,

![Models in MEGA X](https://drive.google.com/uc?id=1JzEoxIAKVW1aL2YzbPyjcQ3a0BrbByyc)

- E selecione o primeiro item, *Find Best DNA/Protein Models (ML)...*:

![best-fit model in Mega X](https://drive.google.com/uc?id=1-cdQ7NmejYsU9sTHdo2CMX15zuczWaH8)

- E responda sim na caixa de diálogo que aparece logo depois, para usar o conjunto de dados que está aberto:

![](https://drive.google.com/uc?id=1_b3jhh81Pr92Tg1YA_17BbHTPVEIFDVY)

- Após a confirmação, a seguinte caixa irá aparecer:

![](https://drive.google.com/uc?id=1wrzx8j5wxKeLwnvpC9TvpML361SytAzg)

- Vamos as opções (da forma como apresentadas na figura acima):
	- Utilizaremos uma árvore automática de *Neighbor-Joining* como hipótese inicial para estes dados.
	- Como as sequências desse alinhamento são de nucleotídeos, utilizaremos o tipo de substituições adequado.
	- Nas opções dos subgrupos de dados, utilizaremos todos os sítios, todas as posições de códons e não utilizaremos filtros para troca de ramos (*Branch-swap filter*).
	- Deixe o número de *Threads* no padrão que apareceu no computador que você está usando.
	- Finalmente, clique em Ok. O processo irá demorar um pouco, dependendo dos recursos computacionais disponíveis. Os resultados aparecerão como a tabela abaixo:

![Best-fit models results](https://drive.google.com/uc?id=1DIKllj-vrTKGndev704GabyUCiUypE_K)

Os resultados são descritos na forma de uma lista do melhor modelo para o menos adequado para os dados utilizados. No MEGA X o critério de informação utilizado é o Bayesiano (BIC). Por ele, podemos verificar que o modelo GTR (*General Time-reversible*) mais correção gamma (+G) foi o modelo escolhido pelo critério bayesiano, embora não seja o modelo com a menor verossimilhança (*lnL*). O restante das informações desta tabela serão discutidas presencialmente.

> *Não esqueça de salvar esta tabela em um dos formatos que o MEGA X disponibiliza, a partir dos ícones presentes no canto superior esquerdo da tela.*

> *O MEGA X também possui a função de calcular o melhor modelo de substituição de aminoácidos. Para isso, basta iniciar as análises com um alinhamento de aminoácidos e na caixa de diálogo escolher a opção correta.*

## Usando o jModelTest

O programa jModelTest ([Darriba et al. 2012](https://www.ncbi.nlm.nih.gov/pubmed/?term=Darriba+D%2C+Taboada+GL%2C+Doallo+R%2C+Posada+D.+2012.+jModelTest+2%3A+more+models%2C+new+heuristics+and+parallel+computing.+Nature+Methods+9(8)%2C+772.)) é uma versão estendida do popular programa ModelTest (o qual era um rotina executada dentro do programa PAUP*). O programa é hoje autônomo e bem mais rápido, após a inclusão das ferramentas ```PHYML```, ```ReadSeq``` e ```Consense```, que eram do antigo pacote [PHYLIP](http://evolution.genetics.washington.edu/phylip.html). Adicionalmente, o jModelTest permite a optimização de árvores base para cada modelo individual, seleção de modelos de acordo com um novo critério teórico de decisão, e filogenias médias de modelos. Recentemente, uma nova versão melhorada e mais rápida, que serve tanto para sequências de DNA como de proteínas foi lançada, o ModelTest-NG ([Darriba et al. 2019](https://academic.oup.com/mbe/article/37/1/291/5552155)).

**Observação:**

- Algumas informações sobre os passos abaixo foram traduzidas e adaptadas a partir do descrito em [http://evomics.org/learning/phylogenetics/jmodeltest/](http://evomics.org/learning/phylogenetics/jmodeltest/), ***apenas para fins didáticos***. <span style="color:red">**A reprodução para qualquer outro fim não é permitida e nem consentida pelo professor do curso e pelo BioME.**</span>

### Passos

Faça o download da versão [2.1.10](https://drive.google.com/drive/u/0/folders/0ByrkKOPtF_n_OUs3d0dNcnJPYXM) do jModelTest. O programa é uma aplicação java e pode ser executado de formas: linha de comando e GUI (*Graphical User Interface*). O programa depende da instalação de um JDK (*Java Development Kit*), seja ele o oficial da [Oracle](https://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html) ou o [OpenJDK](https://openjdk.java.net). Os passos de instalação do JDK dependem do sistema operacional e portanto não serão detalhados aqui neste tutorial.

> *Não confundir o JDK com o JRE (Java Runtime Environment), o qual já é normalmente instalado nos computadores.*

- Utilizaremos o mesmo arquivo utilizado anteriormente: [vert-aligned.fasta](https://drive.google.com/uc?export=download&id=12-vfD16vil2cTmNM2VOMfuj48LGo9iT2).

- Vá ao diretório onde você salvou o aplicativo jModelTest e clique duas vezes no jModelTest.jar para abri-lo. Se você estiver usando o Ubuntu Linux, você pode ter que abrir um terminal, navegar até a pasta onde este arquivo está localizado e digitar o comando abaixo para abrir o programa:

```
$ java -jar jModelTest
```
- A janela abaixo irá aparecer:

![jmodeltest1](https://drive.google.com/uc?id=1n4wrA3n2OUeRWj8OhJTE-K1kZsEnUF9j)

- Clique em *File > Load DNA alignment* e abra o arquivo vert-aligned.fasta do conjunto de dados.
- Clique em *Analysis > Compute likelihood scores* para iniciar a análise.
- Será exibida uma caixa de diálogo que permite especificar uma série de configurações de probabilidade, incluindo o número de modelos a serem testados. As outras configurações são: frequências de base distintas (+F); proporção de sítios invariáveis (+I) e distribuição gama (+G) (variação na taxa ao longo dos sítios). Nesta caixa de diálogo deixe as opções como na figura abaixo. Elas serão discutidas durante o curso.

![jmodeltest2](https://drive.google.com/uc?id=1DNIz-P1pUrCLcrxmFvii1fJci_qI0YOO)

- Clique em ```Compute Likelihoods``` e espere (ou vá tomar um café, pois dependendo do *dataset* esta etapa irá demorar um pouco mais do que a executada no MEGA X). Para o alinhamento aqui utilizado e com estas opções, esta etapa irá demorar entre 1 e 4 min.

> *Algumas vezes, dependendo do sistema operacional, você terá de localizar novamente o executável do programa PhyML. Para isso, na janela principal, é só ir em Edit > Preferences e localizar novamente o executável correto para o seu sistema operacional.*

- Antes de prosseguir, verifique os dados que apareceram no console do jModelTest. Eles também serão discutidos em sala, mas são semelhantes aos encontrados no teste do modelo utilizando o MEGA X.
- Agora clique novamente no menu *Analysis*. Você verá que os cálculos AIC, BIC e DT estão agora disponíveis, enquanto os cálculos hLRT estão acinzentados (pois na etapa anterior optamos por ter topologias de árvores otimizadas).
- Agora clique em *Results > Show results table*. Uma janela irá aparecer mostrando as probabilidades calculadas para cada modelo.

![jmodeltest-table1](https://drive.google.com/uc?id=1D-NDW3rMqy_9TFVwLpqc08s39yY0gOwy)

- Clique agora no topo da coluna ```-LnL```. Isto irá ordenar os modelos de acordo com a verossimilhança. A tabela ficará então assim:

![jmodeltest-table2](https://drive.google.com/uc?id=1QkzhxR5sS8WJwsfOY0bTKAbCsijsFCwj)

- Nela podem ser evidenciados os esquemas de partição, o número de parâmetros incluídos, as frequências de base observadas e as taxas de transição e transversão. Note que as tabelas para os resultados AIC, AICc, BIC e DT ainda estão acinzentadas. Para isso, a tabela pode ser fechada, e partir do menu *Analysis* clique em *Do BIC calculations...* e em *Do DT calculations...*, confirmando cada caixa de diálogo que irá aparecer depois, como pode ser verificado na figura abaixo:

![BIC and DT calculations](https://drive.google.com/uc?id=1Ly0zoycGXVGezQ7Eac2YiVD_zpS7HsSx)

>*Certifique-se sempre de que as opções Calculate parameter importances e Do model averaging estão selecionada.*

- Feito isso, iremos em: *Analysis* > *Do AIC calculations...*. Na caixa posterior, marque a opção *Use AICc correction*, como indicado na figura abaixo:

![AICc correction](https://drive.google.com/uc?id=1uUADsFXUimHtZZ6w9nC0tFW_Ebvbhe-x)

>*Você poderá também fazer o cálculo Akaike sem a correção para fins de comparação. Basta não selecionar a opção acima.*

- Agora clique novamente em *Results > Show results table*. Uma janela irá aparecer mostrando as probabilidades calculadas para cada modelo, com os critérios de informação. Os modelos escolhidos para cada critério estarão marcados em vermelho.

> *Para não ter que repetir as análises (o que gasta tempo computacional), faça um screeshot da tabela com os resultados finais e salve todo o conteúdo do console a partir do menu Edit > Save console.* 

Pelos resultados obtidos, pode-se observar que os resultados apresentam convergência entre si, embora com algumas discrepâncias. O modelo GTR+G+I é o melhor para o critério de Akaike, mas não foi o melhor para o critério Bayesiano. Qual escolher, então? Vamos a discussão em sala, comparando os 2 programas.

## Usando o ProtTest

O programa [ProtTest](https://github.com/ddarriba/prottest3) ([Darriba et al. 2011](https://www.ncbi.nlm.nih.gov/pubmed/21335321)) é um programa muito similar ao jModelTest, no entanto específico para a escolha dos melhores modelos de sbustiuição para alinhamento de sequências proteícas.

O Prottest 3 pode ser obtido [AQUI](https://github.com/ddarriba/prottest3/releases) e executado da mesma forma que o jModelTest (é também uma aplicação em Java).

> *Lembrete: O MEGA X também possui a função de calcular o melhor modelo de substituição de aminoácidos. Para isso, basta iniciar as análises com um alinhamento de aminoácidos e na caixa de diálogo escolher a opção correta.*

Para demonstrar o funcionamento do ProtTest, iremos utilizar o alinhamento de aminoácidos [COX2_PF0016](https://drive.google.com/uc?export=download&id=1d1KpZNgn7atWSkc8_PQOh4zKJuu45rhY), um dos exemplos fornecidos com o próprio programa.

![ProtTest](https://drive.google.com/uc?id=1fZffIhyU_F3ksB7FLFN7CEWZiw2H4KEE)

- Clique em *File > Load alignment* e abra o arquivo [COX2_PF0016](https://drive.google.com/uc?export=download&id=1d1KpZNgn7atWSkc8_PQOh4zKJuu45rhY) baixado acima. Veja as informações que surgiram no console do aplicativo.
- Depois vá em *Analysis > Compute likelihood scores* para iniciar a análise. Será exibida uma caixa de diálogo que permite especificar o número e os modelos a serem testados além de uma série de outras configurações.
- Em *Starting Topology* escolha *Maximum likelihood tree* ou deixe o padrão (*Fixed BioNJ JTT).

![ProtTest](https://drive.google.com/uc?id=1fZffIhyU_F3ksB7FLFN7CEWZiw2H4KEE)

- Clique em *Compute* e espere os cálculos terminarem.

>*Agora sim você deverá ter um tempo de tomar café. O cálculo de verossimilhança para modelos de substituição de aminoácidos é consideralvemente mais intensivo, devido principalmente ao maior número possível de mudanças e o maior número de caracteres envolvidos (20 aminoácidos).*

- Após terminado, só clicar ir ao menu *Selection* e clicar em *Results*. A tabela de resultados irá aparecer.

![ProtTest 3 Results](https://drive.google.com/uc?id=1sxsIhnyHaNWQWMC3sGtVjJqUQPp9Nt4C)

Uma diferença notável entre o ProtTest e o jModelTest é o fato dos cálculos dos critérios de informação já estarem incluídos na tabela de resultados. Analise a tabela. Mais informações serão dadas em sala de aula.

### Comparando resultados

Compare os resultados obtidos para o alinhamento COX2_PF0016 tanto no ProtTest como no MEGA X. Para usar este alinhamento no MEGA, use [este arquivo](https://drive.google.com/uc?export=download&id=1UDI0QtUgUxnmTpvd3ulvWZ1Mz01M2sU1). Abaixo segue uma tabela com os resultados.

![MEGAX](https://drive.google.com/uc?id=1oVHLNFqlcMN2qnhRZJykXx0Eu1Rv2KfF)

## ModelTest-NG

Como falado anteriormente, o ModelTest-NG é uma nova versão melhorada e mais rápida do jModelTest, que serve tanto para sequências de DNA como de proteínas ([Darriba et al. 2019](https://academic.oup.com/mbe/article/37/1/291/5552155)). Sua performance para *datasets* maiores é muito melhor e seus cálculos são realizados de maneira muito mais otimizada. No entanto, sua instalação em sistemas Windows e MacOS ainda não é acessível, principalmente a iniciantes. Em Linux a instalação é relativamente rápida. Por este motivo, ela será apenas demonstrada rapidamente aqui. 

Para isso utilizaremos o mesmo arquivo utilizado anteriormente: [vert-aligned.fasta](https://drive.google.com/uc?export=download&id=12-vfD16vil2cTmNM2VOMfuj48LGo9iT2).

- Execute o ModelTest-NG:

![ModelTest-NG](https://drive.google.com/uc?id=1LnHJ7yq9Gw_32oD-FDgkjykcZxUl5CaU)

- Clique em ```Load MSA``` e escolha o arquivo acima. As características do alinhamento irão aparecer.
- Clique na aba ```Settings``` e você verá as opções do teste, de maneira semelhante aos programas anteriores.

![ModelTest-NG - Settings](https://drive.google.com/uc?id=15frRzX1yU1oELkI_az47-Bfpg6oO_6F9)

- Não esqueça de mudar a árvore inicial para uma de *Maximum likelihood*. Feito isso, você pode clicar em ```Run```.

>*Perceba como o ModelTest-NG é mais rápido.*

- Os resultados são praticamente os mesmos do jModelTest.

![ModelTest-NG Results](https://drive.google.com/uc?id=1N0n5ZXfrqGFUqvOuvUpClZdT1Un8cL23)

- Vamos agora clicar em Reset e repetir as etapas anteriores para o alinhamento [COX2_PF0016](https://drive.google.com/uc?export=download&id=1d1KpZNgn7atWSkc8_PQOh4zKJuu45rhY). Como este alinhamento é de sequências de aminoácidos, não esqueça de marcar na aba *Settings* a opção *Protein*, pois nos nossos testes o ModelTest-NG nem sempre identifica de forma correta o tipo de sequência. Segue abaixo uma prévia do resultado:

![ModelTest-NG protein](https://drive.google.com/uc?id=1-7tYNWASg4mjQJcMqTzFlpCe98QDa-01)

## Considerações Finais

***Qual critério eu uso para escolher o modelo de substituição?***

Essa não é uma pergunta trivial. Para inferências bayesianas o critério BIC tende a ser mais adequado. O AICc é mais adequado para *datasets* pequenos do que o AIC (sem correção), no entanto os dois tendem a convergir em *datasets* maiores, daí recomendamos sempre a utilização do AICc. O critério DT (*decision theory*) deve ser usado com cautela, como o próprio manual do jModelTest recomenda. Assim, nos resta o AICc e o BIC como os critérios mais confiáveis. Quando eles convergem (e isso acontece muitas vezes) o problema está resolvido. Mesmo sem convergência, você estará seguro se você fizer análises filogenéticas tanto com o modelo escolhido pela AICc, quanto com o escolhido pela BIC.

***O modelo escolhido não existe na ferramenta que vou utilizar***

Não é o fim do mundo. Existem muitos modelos, mas existem também muitas sobreposições entre eles. Daí a importância de se conhecer as características do alinhamento e as diferenças dos parâmetros entre os diferentes modelos. Muitas vezes os modelos selecionados por estas ferramentas possuem pequenas diferenças. Só buscar o modelo equivalente ou o mais próximo em termos de parâmetros. Neste ponto a execução do jModelTest apresenta uma outra grande vantagem: o console dá um resumo dos parâmetros avaliados em cada um dos modelos testados para você fazer uma escolha mais adequada. Mesmo assim, nada irá substituir o entendimento dos modelos e de seus parâmetros. Por isso que alguns filogeneticistas não consideram o teste do modelo uma etapa indispensável.

***Filogenia média de todos os modelos***

Esta é uma função que apenas o ModelTest e suas variantes possuem. Esta função calcula a filogenias médias dos modelos, que são árvores de consenso de todas as árvores basais otimizadas. No entanto, atualmente ele depende do pacote [PHYLIP](http://evolution.genetics.washington.edu/phylip.html) para esta função, e pode não funcionar se os nomes dos táxons tiverem mais do que 10 caracteres (quem usou o PHYLIP alguma vez sabe o quanto esta limitação é insuportável). 

Para obter isso, a partir do menu *Analysis*, clique em *Model-averaged Phylogeny*. Será aberta uma janela com as configurações, na qual você deixará todas no padrão e clicará em ```Run```. A saída listará algumas configurações, os modelos e a filogenia média destes modelos. É um ótimo guia, no entanto deve ser utilizada com muita cautela.





