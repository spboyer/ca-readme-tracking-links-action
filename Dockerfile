FROM mcr.microsoft.com/dotnet/core/runtime:3.0-alpine

COPY src/ /

ENTRYPOINT [ "dotnet", "/readme-link-trends.dll" ]