#FROM mcr.microsoft.com/dotnet/core/runtime:3.1-buster-slim AS base
#WORKDIR /app

#FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
#WORKDIR /src
#COPY ["app/readme-link-trends.csproj", ""]
#RUN dotnet restore "./readme-link-trends.csproj"
#COPY app/ .
#WORKDIR "/src/."
#RUN dotnet build "readme-link-trends.csproj" -c Release -o /app/build

#FROM build AS publish
#RUN dotnet publish "readme-link-trends.csproj" -c Release -o /app/publish

#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "readme-link-trends.dll"]

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

COPY ["app/readme-link-trends.csproj", ""]
COPY app/ .

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

