# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm install 
COPY . . 
RUN npm run build

# New container
# Run phase
FROM nginx
# Copy from build phase to nginx dir
COPY --from=builder /app/build /usr/share/nginx/html
# Default command => nginx start so doesn't need command to manually start nginx