# Menggunakan image Node.js versi 14 berbasis Alpine Linux
FROM node:14-alpine

# Mengatur working directory ke /app di dalam container
WORKDIR /app

# Mengcopy semua source code ke working directory di container
COPY . .

# Mengatur mode aplikasi ke production dan mengarahkan ke item-db sebagai host database
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8000 untuk digunakan aplikasi
EXPOSE 8080

# Menjalankan project pada container
CMD ["npm", "start"]
