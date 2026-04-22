# Effective Mobile — DevOps Test Task

## Струкутура проекта

```
.
├── README.md
├── backend
│   ├── Dockerfile
│   ├── go.mod
│   └── main.go
├── docker-compose.yml
├── init-env.sh
└── nginx
    └── nginx.conf
```

---

## Как запустить проект

1. Создаем `.env` фаил (только при первом запуске):

```bash
./init-env.sh
```

2. Собираем и запускаем контейнеры:

```bash
docker compose up --build
```

---

## Как проверить результат

В другом окне терминала:

```bash
curl http://localhost
```

Ожидаемый результат:

```
Hello from Effective Mobile!
```

---

## Архитектура проекта 

Проект состоит из двух контейнеров:

- **nginx** — reverse proxy, доступен с хоста на порту 80
- **backend (Go)** — HTTP сервер, доступен только внутри Docker-сети

### Схема взаимодействия

```
Client (curl/browser)
        ↓
     nginx :80
        ↓
  backend :8080 (internal docker network)
```

- Backend не публикует порты наружу, то есть напрямую приложение не доступно
- Доступ предоставляетя только в выделенной Docker-сети
- Nginx проксирует все запросы по пути `/` backend сервису

---

## Использованные технологии 

- Docker
- Docker Compose
- Nginx (official image)
- Go (net/http)
- Alpine Linux (minimal images)