# Pernyataan Penggunaan AI (AI Usage)

## Strategi Penggunaan AI (Socratic Prompting)
Dalam penyelesaian Tugas Modul 02 ini, saya menggunakan AI (ChatGPT) bertindak murni sebagai **Tutor Senior / Mentor Konseptual**, bukan sebagai *code generator*. 
Berikut adalah linknya: https://chatgpt.com/share/6aae7b3d-e85c-83ec-88c0-3584d0c491a7

Aturan main yang saya tetapkan kepada AI di awal sesi adalah:
*"Jangan pernah memberikan saya full code jadi. Berikan saya penjelasan konsep, alur logika, atau cuplikan kode (snippet) spesifik hanya untuk bagian yang saya tanyakan. Saya yang akan merakit kodenya sendiri agar saya paham."*

## Area Pembahasan dengan AI
1. **Desain Model Data:** Berdiskusi tentang pemisahan logika `Model` dan `UI`, serta merancang struktur *static method* untuk `RoomSession`. (Saya yang menyusun sendiri 8 data dummy domain Studio & Multimedia).
2. **Manajemen Constraint (RenderFlex Overflow):** Berkonsultasi mengenai aturan *Constraints go down* dan menemukan widget `Expanded` sebagai solusi pencegahan *overflow* pada teks panjang di dalam `Row`.
3. **Logika Responsive Layout:** Meminta kerangka logika `if-else` pada `LayoutBuilder` berdasarkan `constraints.maxWidth` (bukan `MediaQuery`), yang kemudian saya isi mandiri dengan `ListView` dan `GridView`.
4. **State Management (StatefulWidget):** Berdiskusi mengenai pemisahan antara "data mentah" dengan "data hasil filter" menggunakan *ChoiceChip*, serta cara mempertahankan state pada fitur lokal `showModalBottomSheet` dengan `StatefulBuilder`.

## Log Percakapan (Prompt Utama yang Digunakan)
Berikut adalah contoh *prompt* yang saya gunakan selama proses pengerjaan untuk memancing pemahaman konsep:

> **Prompt 1 (Model Data):** "Bagaimana format penulisan class model di Dart yang bersih untuk menampung properti string? Tolong beri kerangkanya saja, saya akan mengetik 8 data dummy-nya."
>
> **Prompt 2 (Overflow):** "Berdasarkan aturan 'Constraints go down', widget apa yang tepat untuk membungkus teks panjang di dalam Row agar tidak RenderFlex overflow dan menjadi ellipsis? Selain itu, bagaimana susunan Stack dan Positioned untuk meletakkan badge status di pojok kanan atas?"
> 
> **Prompt 3 (LayoutBuilder):** "Bagaimana kerangka dasar logika if-else di dalam LayoutBuilder untuk menentukan 3 breakpoint (Compact <600, Medium <840, Expanded >=840)? Tolong logikanya saja, saya yang akan merakit GridView-nya."
>
> **Prompt 4 (State Management):** "Bagaimana alur logika pemanggilan setState pada ChoiceChip agar list data bisa langsung tersaring? Sertakan juga contoh ringkas cara memicu showModalBottomSheet."