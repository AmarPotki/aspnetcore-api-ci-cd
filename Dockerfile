#base 
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
ENV ASPNETCORE_URLS http://+:5000
WORKDIR /app
EXPOSE 5000
EXPOSE 5001

# build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /generator

# restore
COPY ./api/api.csproj ./api/
COPY ./Api.Tests/Api.Tests.csproj ./Api.tests/
RUN dotnet restore ./api/api.csproj

# copy src
COPY . .

# test
 RUN dotnet test Api.Tests/Api.Tests.csproj
# publish
FROM build as publish
RUN dotnet publish api/api.csproj -o /app/publish

# runtime  stage
FROM base as final
COPY --from=publish /app/publish .
ENTRYPOINT [ "dotnet","api.dll" ]

