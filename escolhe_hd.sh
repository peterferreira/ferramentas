####################################################
# Objetivo: Identificar qual HD está conectado e   #
# mudar o fstab para montar o HD conectado.        #
# Autor: Peter Ferreira <sup.tec04@softi.com.br>   #
# Data de criação: 22/05/2019                      #
# Última atualização: 22/05/2019                   #
####################################################

# Caso um dos HDs for formatado, substituido ou a for uma configuração nova,
# as duas linhas abaixo devem ser alteradas.
hda_uuid="7b470f99-9b2a-4105-965f-1626b6b2df0d"
hdb_uuid="86359ee9-e65e-4c7f-9bb0-b06431bffdf2"

# Identifica qual HD está conectado agora.
lsblk -o uuid > /tmp/uuid.tmp
egrep '$hda_uuid|$hdb_uuid'  /tmp/uuid.tmp > /tmp/uuid.txt

uuid="$(cat /tmp/uuid.txt)"

# Altera o fstab para montar o HD que estiver conectado na USB
# Se os dois estiverem conectados, o segundo prevelecerá.
# O fstab.hd1 ou 2 copiados nas linhas abaixo, devem ser copiados
# do fstab original, e alterados o UUID usado para montar a unidade
# de backup, se forem usados mais de 2 discos, basta duplicar os IFs
# e subistituir o hd1, 2 para 3, 4, ....
if [ "$uuid" = "$hda_uuid" ]
then
        cp /etc/fstab.hd1 /etc/fstab
fi
if [ "$uuid" = "$hdb_uuid" ]
then
        cp /etc/fstab.hd2 /etc/fstab
fi

# Limpa a bagunça.
rm /tmp/uuid.tmp /tmp/uuid.txt

# Fim da Festa

