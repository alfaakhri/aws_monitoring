# AWS Monitoring

Aplkasi ini digunakan untuk melakukan penyandian ME 45 dan ME 48 secara otomatis, dimana sekarang proses penyandian masih dilakukan secara manual. Yaitu observer pertama harus melakukan pengamatan cuaca di taman alat dan menulis hasilnya dicatatan, kemudian observer masuk ke ruangan untuk menginputkan data2 satu persatu pada PC dan dilakukan penyandian sesuai aturan dengn menggunakan bantuan tabel2 pada aplikasi excel, kemudian setelah disandi hasil penyandian dikirimkan pusat bmkg dengan menggunaka CMSS sebagai jaringan komunikasinya. Oleh karena itu dengan aplikasi ini diharapkan data pengamatan dapat otomatis masuk dan otomatis dilakukan penyandian, dan dapat langsung dikirimkan ke CMSS, sehingga dapat mengefesiensikan waktu pengamatan yang harus dilakukan setiap 1 jam sekali.

Fitur yang telah dikembangkan adalah sebagai berikut :
- Display realtime pengukuran yang berasal dari AWS
- Menu ME 48 dan ME 48 melakukan proses penyandian, terdapat tombol sandi untuk melakuakn penyandian dan tombol kirim untuk melakukan pengiriman sandi ke riwayat dan CMSS (belum dibikin)
- Menu riwayat = melihat hasil penyandian yang sudah dilakukan
- Menu profil = berisi detail pengguna
