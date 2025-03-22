# Use the official .NET SDK image to build and publish the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Set the working directory
WORKDIR /app

# Copy the project files
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application files
COPY . ./

# Build the application
RUN dotnet publish -c Release -o /publish

# Use a smaller runtime image for production
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Set the working directory
WORKDIR /app

# Copy the published application
COPY --from=build /publish .

# Expose port 80
EXPOSE 80

# Start the application
ENTRYPOINT ["dotnet", "HierarchyGeneratorApi.dll"]