# Menggunakan base image Node.js versi 21 dengan Alpine Linux
FROM node:21-alpine

# Menentukan direktori kerja dalam container pada /app
WORKDIR /app

# Menyalin seluruh source code ke dalam direktori kerja di container
COPY . .

# Menginstal dependencies aplikasi
RUN npm install

# Mengekspos port yang digunakan aplikasi pada port 3001
EXPOSE 3001

# Menjalankan server saat container diluncurkan
CMD ["npm", "start"]
