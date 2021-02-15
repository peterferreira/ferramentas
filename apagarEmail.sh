#!/usr/bin/expect

# você pode modificar o tempo limite se o scrpit falhar
set timeout 1

# variáveis de conexão
set ip "pop.gmail.com"
set socket "995"
set user "user.name"
set pass "password"

# definimos o endereço que queremos remover e-mails daqui. Escape caracteres regex especiais, como pontos.
set target_address "mail\.example@gmail\.com"

# lançamos o subprocesso com o qual queremos interagir
spawn openssl s_client -connect $ip:$socket -quiet

# se a conexão correu bem, tentamos fazer o login
expect -re ".OK.*" {send "user $user\r"}
expect -re ".OK.*" {send "pass $pass\r"}

# se o login correu bem, tentamos contar as mensagens no servidor
# você obterá a seguinte saída :
# +OK NB_MSG TOTAL_SIZE
expect -re ".OK.*" {send "stat\r"}

# se o comando stat correu bem ...
expect -re ".OK.*" {
        # extraímos o número de e-mail da saída do comando stat
        set mail_count [lindex [split [lindex [split $expect_out(buffer) \n] 1] " "] 1]

        # nós iteramos em cada e-mail ...
        for {set i 1} {$i <= $mail_count} {incr i 1} {
            # recuperamos o cabeçalho do e-mail
            send "top $i 0\r"

            # se o cabeçalho contém "To: $target_address" (or "To: <$target_address>" or "To: Contact Name <$target_address>" ...)
            # para filtrar de acordo com o remetente, altere o regex para "\nFrom: ..."
            expect -re "\nTo: \[^\n\]*$target_address" {
                    #we delete the email
                    send "dele $i\r"
            }
        }
}
expect default
