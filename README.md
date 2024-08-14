# BancoBase
API REST BancoBaseNet .NET8
# Patrón de diseño
Repository, utilizado para separar la aplicación de su almacenamiento de datos en una capa independiente de datos que funciona como mediador.
## Uso de Dapper como microORM.
## Minimal Api con patrón de diseño inversión de control (IoC).
## Base de datos SQL Server

### El archivo dockerfile de la api se encuentra dentro del proyecto BancoBase.WebAPI, se agrega soporte para docker-compose, para poder iniciar el proyecto de manera correcta es necesario dar de alta la base de datos, dentro de la instancia de SQL Server que se encuentra en el contenedor, el script se encuentra en la ruta BancoBase.DataBase.DataBaseScript.

 - servidor: .,1414
 - usuario: sa
 - pass: "< YourStrong@Passw0rd >" (sin espacios)
