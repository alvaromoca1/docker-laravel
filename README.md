# Laravel Docker Development Environment

Este es un entorno de desarrollo para Laravel utilizando Docker. Incluye PHP-FPM, Nginx, MySQL y Node.js.

## Requisitos Previos

- Docker
- Docker Compose
- Git
- Make (opcional, pero recomendado)

## Instalación

1. Clona el repositorio:
```bash
git clone <repository-url>
cd <project-folder>
```

2. Copia los archivos de configuración:
```bash
cp .env.example .env
```

3. Construye los contenedores:
```bash
docker-compose build
docker-compose up -d
```

4. Crea un nuevo proyecto Laravel dentro del contenedor:
```bash
# Accede al contenedor
docker-compose exec app sh

# Dentro del contenedor, crea un nuevo proyecto Laravel
composer create-project laravel/laravel .

# Instala dependencias
composer install
npm install
```

5. Configura los permisos:
```bash
chmod -R 777 storage bootstrap/cache
```

## Estructura del Proyecto
```
.
├── docker/
│   └── Dockerfile
├── nginx/
│   └── conf.d/
│       └── app.conf
├── makefiles/
│   └── local.mk
├── docker-compose.yml
├── Makefile
└── README.md
```

## Uso

### Comandos Docker Compose
```bash
# Levantar contenedores
docker-compose up -d

# Detener contenedores
docker-compose down

# Acceder al contenedor
docker-compose exec app sh
```

### Comandos Make
```bash
# Levantar el proyecto
make up

# Detener el proyecto
make down

# Acceder al shell
make shell
```

## Servicios

- **PHP** (http://localhost:81)
- **MySQL** (puerto 3306)
- **Nginx**
- **Node**

## Variables de Entorno

Configura las siguientes variables en tu archivo `.env`:

```env
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=your_password
```

## Solución de Problemas

Si encuentras el error "artisan: not found", asegúrate de:

1. Estar dentro del contenedor:
```bash
docker-compose exec app sh
```

2. Estar en el directorio correcto:
```bash
cd /var/www
```

3. Verificar que el archivo existe:
```bash
ls -la artisan
```

## Comandos Útiles

### Dentro del Contenedor
```bash
# Migraciones
php artisan migrate

# Cache
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# Crear controlador
php artisan make:controller UserController
```

### NPM
```bash
# Instalar dependencias
docker-compose exec node npm install

# Compilar assets
docker-compose exec node npm run dev

# Watch
docker-compose exec node npm run watch
```

## Licencia

[MIT](https://opensource.org/licenses/MIT)