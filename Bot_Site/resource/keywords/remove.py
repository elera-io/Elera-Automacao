import re

def remove_numbers(texto):
    textoWithoutNumbers = re.sub('[0-9]', '', texto)
    return textoWithoutNumbers