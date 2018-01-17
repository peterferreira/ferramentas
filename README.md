# ferramentas
Ferramentas de uso geral no trabalho como analista de suporte linux / General tools to easy my linux sysadm job.


**Xen Server**

*autoligar.sh*: Script para ativar e desativar o auto start das VMs selecionadas


Modo de usar: ./autoligar.sh NomeDaVM True para ativar
          ou: sh autoligar.sh NomeDaVM True
            : ./autoligar.sh NomeDaVM False para desativar
          ou: sh autoligar.sh NomeDaVM False
          

*bkpvms*: Script para gerar Snapshots a quente das VMs, exportar para nova VM, e compactar, após isso, apagar a VM e a Snapshot

Modo de usar: Editar o script para indicar o local de montagem do dispositivo de backup, colocar o script em algum local, sugiro: /usr/local/bin/ e adicioná-lo no crontab com data e hora de acordo com necessidade.


**Criar Senha**

*criarsenha.py*: Script para gerar senhas

Modo de usar: 
              Editar o arquivo lista.txt e alterar os nomes dos usuários
              logo após, executar: ./criarsenha.py ou python criarsenha.py
              sera criado um arquivo senhas_geradas.txt com a lista de senhas, além de apresentá-las na tela


*lista.txt*: Arquivo em texto plano, onde devem estar os nomes dos usuários para geração de senha.

           : Se preferir deixar os usuários de 01 a 10, ou ainda acrescentar mais, tudo bem.
           
           

**Testar velocidade de internet no console/terminal (tela preta)**


*testavelocidade.sh*: Script simples para executar, ou caso ainda no tenha, baixar e executar o script de teste de velocidade

Modo de usar: ./testavelocidade.sh

          ou: sh testavelocidade.sh
