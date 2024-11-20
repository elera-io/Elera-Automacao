import re

def remove_horario(texto):
    # Regex para remover o horário no formato hh:mm AM/PM no final da string
    texto_limpo = re.sub(r'\d{1,2}:\d{2}\s?(AM|PM)\s*$', '', texto, flags=re.IGNORECASE)
    return texto_limpo
