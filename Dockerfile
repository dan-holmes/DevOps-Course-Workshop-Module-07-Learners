FROM --platform=linux/amd64 mcr.microsoft.com/dotnet/sdk:6.0

RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash -
RUN apt-get install -y nodejs

COPY . .

RUN dotnet build

WORKDIR /DotnetTemplate.Web
RUN npm install
RUN npm run build

ENTRYPOINT ["dotnet", "run", "--project", "/DotnetTemplate.Web/DotnetTemplate.Web.csproj"]