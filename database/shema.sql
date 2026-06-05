CREATE TABLE Korisnik (
    IDKorisnik INTEGER PRIMARY KEY,
    KorisnickoIme TEXT NOT NULL,
    LozinkaHash TEXT NOT NULL,
    Uloga TEXT NOT NULL
);

CREATE TABLE Klijent (
    IDKlijent INTEGER PRIMARY KEY,
    Ime TEXT NOT NULL,
    Prezime TEXT NOT NULL,
    Telefon TEXT,
    Email TEXT
);

CREATE TABLE Uredaj (
    IDUredaj INTEGER PRIMARY KEY,
    IDKlijent INTEGER NOT NULL,
    Naziv TEXT NOT NULL,
    SerijskiBroj TEXT,
    Opis TEXT,
    FOREIGN KEY (IDKlijent) REFERENCES Klijent(IDKlijent)
);

CREATE TABLE ServisniZahtjev (
    IDZahtjev INTEGER PRIMARY KEY,
    IDKlijent INTEGER NOT NULL,
    IDUredaj INTEGER NOT NULL,
    DatumZaprimanja TEXT NOT NULL,
    OpisKvara TEXT NOT NULL,
    Status TEXT NOT NULL,
    Cijena REAL DEFAULT 0,
    FOREIGN KEY (IDKlijent) REFERENCES Klijent(IDKlijent),
    FOREIGN KEY (IDUredaj) REFERENCES Uredaj(IDUredaj)
);

CREATE TABLE LogAktivnosti (
    IDLog INTEGER PRIMARY KEY,
    IDKorisnik INTEGER,
    Vrijeme TEXT NOT NULL,
    Akcija TEXT NOT NULL,
    FOREIGN KEY (IDKorisnik) REFERENCES Korisnik(IDKorisnik)
);