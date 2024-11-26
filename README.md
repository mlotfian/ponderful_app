## A Decision Support Tool For Guiding Decision Makers With Their Pond Management Actions

This tool is designed to assist decision-makers in understanding the benefits of ponds for biodiversity and climate change adaptation/mitigation, helping them to understand the benefits of increasing the presence of ponds in their regions.
Developed as part of the EU Horizon 2020 project, [PONDERFUL](https://ponderful.eu/), (2020-2024) the tool explores the role of ponds and pond landscapes (pondscapes) as Nature-Based Solutions (NBS) for adressing societal challenges linked to climate changes. It enables decision-makers to evaluate selected NBS strategies (pond creation and water quality management), assessing their impacts on a set of Nature's Contributions to People (NCP) indicators (aquatic biodiversity (amphibians, plants, macroinvertebrates), emissions of GHG, water quantity, water quality). Additionally, the tool allows for scenario analysis, evaluating outcomes under different climate change and land use projections for 2050.


## Django App with Docker

This tool is developed as a Django web application containerized with Docker for easier setup and deployment.

## Key Features

- Django framework for web development
- Docker and Docker Compose for containerization
- Database support (PostgreSQL/PostGIS)

## Main folders structure

    ```plaintext
     /
     ├── ponderful_app/          # Django project
     ├── ponderful_mcda/         # Django app
     ├── Dockerfile              # Docker configuration
     ├── docker-compose.yml      # Docker Compose file
     ├── .env.example            # Example environment variables
     └── ...


## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/mlotfian/ponderful_app.git
   cd ponderful_app

2. Create a .env file in the project root with the following variables:(you can use the .env.example as template)

   ```bash
   POSTGRES_DBNAME=
   POSTGRES_USER=
   POSTGRES_PASSWORD=
   DATABASE=
   POSTGRES_PORT=
   DB_HOST_PORT=
   POSTGRES_HOST=
   BASE_URL=
   SECRET_KEY =
   DEBUG =

3. Build and start the application:
   
   ```bash
   docker-compose up --build
   
4. Migrate the database:
   
   ```bash
   docker-compose exec web python manage.py migrate
