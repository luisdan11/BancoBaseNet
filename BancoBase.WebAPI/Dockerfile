#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["BancoBase.WebAPI/BancoBase.WebAPI.csproj", "BancoBase.WebAPI/"]
COPY ["BancoBase.DTOs/BancoBase.DTOs.csproj", "BancoBase.DTOs/"]
COPY ["BancoBase.Entities/BancoBase.Entities.csproj", "BancoBase.Entities/"]
COPY ["BancoBase.Repository/BancoBase.Repository.csproj", "BancoBase.Repository/"]
RUN dotnet restore "./BancoBase.WebAPI/BancoBase.WebAPI.csproj"
COPY . .
WORKDIR "/src/BancoBase.WebAPI"
RUN dotnet build "./BancoBase.WebAPI.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./BancoBase.WebAPI.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BancoBase.WebAPI.dll"]