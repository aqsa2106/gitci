# Menggunakan base image yang ringan untuk Node.js
FROM node:18-alpine

# Menambahkan paket tambahan yang diperlukan
RUN apk add --no-cache python3 make g++

# Mengatur direktori kerja di dalam container
WORKDIR /app

# Menyalin file package.json dan package-lock.json untuk instalasi dependensi
COPY package*.json ./

# Menginstal dependensi aplikasi (mode produksi untuk menghemat ukuran)
RUN npm install --production

# Menyalin seluruh file proyek ke dalam container
COPY . .

# Membangun aplikasi Nuxt.js untuk mode statis
RUN npm run generate

# Mengatur direktori output sebagai root server statis
RUN npm install -g serve && mv ./dist /app/output

# Ekspos port untuk aplikasi
EXPOSE 3000

# Menjalankan aplikasi menggunakan "serve"
CMD ["serve", "-s", "output", "-l", "3000"]
