# APP NAME

![un license](https://img.shields.io/github/license/RyosukeDTomita/port_sanctum)

## INDEX

- [ABOUT](#about)
- [ENVIRONMENT](#environment)
- [PREPARING](#preparing)
- [HOW TO USE](#how-to-use)

---

## ABOUT

Database containing port number and service name

---

## ENVIRONMENT

- mysql

---

## PREPARING

```shell
docker buildx bake
docker compose up
```

---

## HOW TO USE

```shell
mysql -u sigma -ppassword -h 127.0.0.1 -P 3307
```
---
