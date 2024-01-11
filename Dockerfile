FROM node:20.11.0-alpine3.19
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
FROM nginx:stable-alpine
COPY --from=0 /app/build /usr/share/nginx/html
