# -*- coding:UTF-8 -*-
#!/usr/bin/python3
import random, string

def gerador(tamanho=8, caracteres=string.ascii_letters + string.digits):
	return ''.join(random.choice(caracteres) for _ in range(tamanho))

usuarios = open('lista.txt')


for usuario in usuarios:
    print(usuario, gerador(), '\n')

