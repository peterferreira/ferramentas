# -*- coding:UTF-8 -*-
#!/usr/bin/python3
import random, string

def gerador(tamanho=8, caracteres=string.ascii_letters + string.digits):
	return ''.join(random.choice(caracteres) for _ in range(tamanho))

usuarios = open('lista.txt')

senhas = open('senhas_geradas.txt', 'w')

for usuario in usuarios:
    senha = gerador()
    print(usuario, senha, '\n')
    senhas.writelines(usuario[:-1] + ' - ' + senha + '\n')

senhas.close()
