#!/bin/sh -l

cd /app

dotnet restore
dotnet build
dotnet run --project readme-link-trends