# Stage 1: Build the application
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

# Stage 2: Serve the application with Nginx
FROM nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/dist /usr/share/nginx/html
