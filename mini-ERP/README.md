# Mini-ERP

Aquest projecte és una aplicació demo d'un sistema ERP (Enterprise Resource Planning) minimalista. Inclou un backend desenvolupat en Java amb Spring Boot, un client en Python i una base de dades PostgreSQL. El projecte està pensat per ser executat en dos entorns diferents: desenvolupament i demostració.

## Característiques

- **Base de dades**: PostgreSQL amb un script d'inicialització que inclou una demo de disparador per actualitzar l'stock dels productes quan es crea o modifica una comanda.
- **Backend**: Desenvolupat en Java utilitzant Spring Boot i gestionat amb Maven.
- **Client**: Aplicació en Python que interactua amb el backend.
- **Contenidors**: Configuració de Docker Compose per gestionar els serveis en l'entorn de demostració.

## Estructura del projecte

- `db/`: Conté els scripts SQL per inicialitzar la base de dades.
- `java-backend/`: Codi font del backend desenvolupat en Java.
- `python-client/`: Codi font del client desenvolupat en Python.
- `docker-compose.yaml`: Configuració de Docker Compose per l'entorn de demostració.
- `Makefile` i `run.sh`: Scripts per facilitar l'execució del projecte.

## Requisits previs

### Entorn de desenvolupament
- Docker i Docker Compose instal·lats (només per a la base de dades).
- Maven instal·lat per compilar i executar el backend.
- Python 3 instal·lat per executar el client.

### Entorn de demostració
- Docker i Docker Compose instal·lats.

## Com executar el projecte

### Opció 1: Entorn de desenvolupament

1. Clona aquest repositori:
   ```bash
   git clone <URL_DEL_REPOSITORI>
   cd mini-ERP
   ```

2. Inicia només la base de dades amb Docker Compose:
   ```bash
    cd db/dev
   docker compose up -d
   ```

3. Compila i executa el backend:
   ```bash
   cd java-backend
   mvn clean install
   mvn spring-boot:run
   ```

4. Instal·la i executa el client Python:
    - Amb Makefile:
      ```bash
      cd python-client/dev
      make up
      ```
    - O amb l'script Bash:
      ```bash
      cd python-client/dev
      ./run.sh
      ```

### Opció 2: Entorn de demostració amb Docker Compose

1. Clona aquest repositori:
   ```bash
   git clone https://github.com/guillemparrado/fundesplai-demos.git
   cd mini-ERP
   ```

2. Executa el projecte complet:
   - Amb Makefile:
     ```bash
     make run
     ```
   - O amb l'script Bash:
     ```bash
     ./run.sh
     ```

   Aquest pas crea els contenidors del backend de Java i del client Python i arrenca i inicialitza la base de dades, el servidor Java i el client Python. El client Python espera que l'API estigui operativa, executa les peticions corresponents i imprimeix els resultats per consola. Un cop finalitzat aquest procés, l'usuari pot explorar l'API i la base de dades gràcies al port binding configurat.


3. Accedeix als serveis:
   - Backend: [http://localhost:8080](http://localhost:8080)
   - Base de dades: Port `5432` (usuari: `demoerp`, contrasenya: `demoerp`).
