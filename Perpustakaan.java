// Superclass: Buku
class Buku {
    protected String judul;
    protected String penulis;

    // Constructor dan encapsulasi
    public Buku(String judul, String penulis) {
        this.judul = judul;
        this.penulis = penulis;
    }

    // Method untuk menampilkan info buku
    public void tampilInfo() {
        System.out.println("Judul: " + judul + ", Penulis: " + penulis);
    }
}

// Subclass 1: BukuFiksi
class BukuFiksi extends Buku {
    protected String genre;

    public BukuFiksi(String judul, String penulis, String genre) {
        super(judul, penulis); // memanggil konstruktor dari superclass
        this.genre = genre;
    }

    @Override
    public void tampilInfo() {
        super.tampilInfo();
        System.out.println("Genre: " + genre);
    }
}

// Subclass 2 (turunan kedua): BukuFiksiSejarah
class BukuFiksiSejarah extends BukuFiksi {
    private String latarWaktu;

    public BukuFiksiSejarah(String judul, String penulis, String genre, String latarWaktu) {
        super(judul, penulis, genre);
        this.latarWaktu = latarWaktu;
    }

    @Override
    public void tampilInfo() {
        super.tampilInfo();
        System.out.println("Latar Waktu: " + latarWaktu);
    }
}

// Main class: Perpustakaan
public class Perpustakaan {
    public static void main(String[] args) {
        // Membuat array of object untuk menyimpan koleksi buku
        Buku[] koleksi = new Buku[3];

        // Membuat object dari berbagai class
        koleksi[0] = new Buku("Belajar Java", "Pak Budi");
        koleksi[1] = new BukuFiksi("Legenda Naga", "Bu Sari", "Fantasi");
        koleksi[2] = new BukuFiksiSejarah("Perang Diponegoro", "Pak Hasan", "Sejarah", "Abad 19");

        // Menampilkan informasi semua buku
        for (Buku b : koleksi) {
            b.tampilInfo();
            System.out.println("-----");
        }
    }
}
