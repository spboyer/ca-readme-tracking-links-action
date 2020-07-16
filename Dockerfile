FROM mcr.microsoft.com/dotnet/core/runtime:3.1-alpine

COPY src/ /

ENTRYPOINT [ "dotnet", "/readme-link-trends.dll" ]