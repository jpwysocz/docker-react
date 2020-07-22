FROM node:alpine as builder 

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#build folder will land in /app/build

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
#start will happen automatically because nginx base container has this already setup