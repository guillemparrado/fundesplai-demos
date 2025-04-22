# Utilitza una imatge base oficial de Python
FROM python:3.13-slim

# Install netcat (netcat-openbsd)
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

# Estableix el directori de treball dins del contenidor
WORKDIR /app

# Copia els fitxers necessaris al contenidor
COPY app /app

# Instal·la les dependències del projecte
RUN pip install --no-cache-dir .

# Defineix la comanda per defecte per executar el client
CMD ["python", "client.py"]