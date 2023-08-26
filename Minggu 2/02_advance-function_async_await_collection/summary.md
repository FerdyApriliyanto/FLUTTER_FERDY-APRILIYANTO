#summary

1. Fungsi dalam dart memiliki berbagai jenis yaitu anonymous function yang tidak memiliki nama serta berfungsi sebagai data dan arrow function yang penulisannya lebih singkat dengan ciri tanda => yang melambangkan fungsi returnnya.

2. Async dalam dart biasa diletakkan pada sebuah function untuk menandakan bahwa proses function tersebut isinya berjalan secara asynchronus. Async berarti proses yang dijalankan tidak harus berurut ketika proses tersebut memakan waktu dan dapat dilanjutkan ke proses lain sambil menunggu proses async selesai. Sedangkan await berarti menandakan untuk menunggu proses async hingga selesai baru dilanjutkan ke proses berikutnya.

3. Tipe data future dan collection (list, map)
- Tipe data future merupakan data yang dapat ditunggu/data yang akan datang dan membawa nilai return dari fungsi async yang biasa memakan waktu lama seperti melakukan request ke server API ataupun library.

-Tipe data collection terdiri dari list dan map. List merupakan tipe data yang menampung banyak data(multiple value) secara berbaris yang disebut elemen dan tiap elemen memiliki index sebagai sarana untuk mengakses data secara satu per satu. Sedangkan map merupakan tipe data multiple value juga tapi menyimpan data secara key-value yang berguna seperti index pada list, dan cara pengaksesannya pun melalui nama key yang mewakili masing-masing data.