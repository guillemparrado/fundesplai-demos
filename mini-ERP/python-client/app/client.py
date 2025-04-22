import requests
import os

BACKEND_URL = os.getenv("BACKEND_URL", "http://localhost:8080/api")
PRODUCTS_ENDPOINT = BACKEND_URL + "/products"

# Crear producte
product = {"name": "Producte 1", "stock": 100}
r = requests.post(PRODUCTS_ENDPOINT, json=product)
print("Producte creat:", r.json())

# Llistar productes
r = requests.get(PRODUCTS_ENDPOINT)
print("Productes:", r.json())

# Actualitzar producte
product_id = r.json()[0]['id']
update = {"name": "Producte 1 actualitzat", "stock": 80}
r = requests.put(f"{PRODUCTS_ENDPOINT}/{product_id}", json=update)
print("Producte actualitzat:", r.json())

# Esborrar producte
r = requests.delete(f"{PRODUCTS_ENDPOINT}/{product_id}")
print("Producte esborrat, status:", r.status_code)