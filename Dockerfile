# Menggunakan base image Node.js versi 21 dengan Alpine Linux
FROM node:21-alpine

# Menentukan direktori kerja dalam container pada /app
WORKDIR /app

# Menyalin seluruh source code ke dalam direktori kerja di container
COPY . .

# Menginstal dependencies aplikasi
RUN npm install

# Mengekspos port yang digunakan aplikasi ke port 3000
EXPOSE 3000

# Menjalankan server saat container diluncurkan
CMD ["npm", "start"]
