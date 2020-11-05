
create database Farmhouse;

drop table if exists Animale;
create table Animale ( 
	CodAnimale int NOT NULL,
    Sesso char,
    Specie varchar(100),
    Famiglia varchar(100),
    Razza varchar(100),
    DataNascita Date,
    Altezza int,
    Peso int,
    CodLocale int,
    primary key (CodAnimale)
);

drop table if exists Nati;
create table Nati (
	CodAnimale int NOT NULL,
    Ora time,
    Data date,
    LivDeambulazione int,
    LivLucentezzaPelo int,
    TipoRespirazione char(100),
    CodRiproduzione int,
    primary key (CodAnimale)
);

drop table if exists Comprati;
create table Comprati (
	CodAnimale int NOT NULL,
    DataAcquisto date,
    DataArrivo date,
    Fornitore char(100),
    primary key (CodAnimale) 
);

drop table if exists Fornitore;
create table Fornitore (
	PartitaIVA char (11) NOT NULL,
    Nome char(100),
    Indirizzo char(100),
    RagioneSociale char(100),
    primary key (PartitaIVA)
);

drop table if exists Specie;
create table Specie(
	Nome char(100) NOT NULL,
    primary key (Nome)
);

drop table if exists Locale;
create table Locale (
	CodLocale int NOT NULL,
    CodAgriturismo int NOT NULL,
    NumStalla int,
    Pavimentazione char(100),
    Orientamento char(100),
    Lunghezza int,
    Larghezza int,
    Altezza int,
    Specie char(100),
    nAnimali int,
    primary key (CodLocale, CodAgriturismo)  
);

drop table if exists Stalla;
create table Stalla (
	CodAgriturismo int,
    Numero int,
    Dimensioni int,
    primary key (CodAgriturismo, Numero)
);

drop table if exists Agriturismo;
create table Agriturismo (
	CodAgriturismo int NOT NULL,
    Nome char(100),
    primary key (CodAgriturismo)
);

drop table if exists StatoLocale;
create table StatoLocale (
	CodLocale int NOT NULL,
    TimeStamp timestamp NOT NULL,
    LivSporicizia int,
    LivAzoto int,
    LivMetano int,
    RichiestaPulizia bool,
    Temperatura int,
    PercUmidita int,
    primary key (CodLocale, TimeStamp)
);

drop table if exists Dispositivi;
create table Dispositivi (
	CodLocale int NOT NULL,
    TipoCondizionatori char(100),
    TipoMangiatoie char(100),
    TipoAbbeveratoi char(100),
    TipoLuci char(100),
    primary key (CodLocale)
);

drop table if exists Illuminazione;
create table Illuminazione (
	Codice int NOT NULL,
    CodLocale int,
    primary key (Codice)
);

drop table if exists Condizionatore;
create table Condizionatore (
	Codice int NOT NULL,
    CodLocale int,
    primary key (Codice)
);

drop table if exists Mangiatoia;
create table Mangiatoia (
	Codice int NOT NULL,
    CodLocale int,
    Capienza int,
    primary key (Codice)
);

drop table if exists Abbeveratoio;
create table Abbeveratoio (
	Codice int NOT NULL,
    CodLocale int,
    Capienza int,
    primary key (Codice)
);

drop table if exists TipoArricchimento;
create table TipoArricchimento (
	CodAbbeveratoio int NOT NULL,
    TimeStamp timestamp NOT NULL,
    Vitamine char(100),
    SaliMinerali char(100),
    primary key (CodAbbeveratoio, TimeStamp)
);

drop table if exists StatoAbbeveratoio;
create table StatoAbbeveratoio (
	CodAbbeveratoio int NOT NULL,
    TimeStamp timestamp NOT NULL,
    AcquaResidua int,
    primary key (CodAbbeveratoio, TimeStamp)
);

drop table if exists StatoMangiatoia;
create table StatoMangiatoia (
	CodMangiatoia int NOT NULL,
    TimeStamp timestamp NOT NULL,
    ForaggioResiduo float,
    primary key (CodMangiatoia, TimeStamp)
);

drop table if exists Pasto;
create table Pasto (
	CodMangiatoia int NOT NULL,
    TimeStamp timestamp NOT NULL,
    Conservazione char(100),
    Quantita int,
    Frutta int,
    Piante int,
    Cereali int,
    Fibre int,
    Proteine int,
    Glucidi int,
    primary key (CodMangiatoia, TimeStamp)
);

drop table if exists TipoForaggio;
create table TipoForaggio (
	Fibre int NOT NULL,
    Proteine int NOT NULL,
    Glucidi int NOT NULL,
    Energia int,
    primary key (Fibre, Proteine, Glucidi)
);

drop table if exists Pascolo;
create table Pascolo (
	CodAnimale int NOT NULL,
    Data date NOT NULL,
    OrarioRientro time NOT NULL,
    OrarioInizio time,
    Zona int,
    primary key (CodAnimale, Data, OrarioRientro)
);

drop table if exists Localizzazione;
create table Localizzazione (
	CodAnimale int NOT NULL,
    TimeStamp timestamp NOT NULL,
    x int,
    y int,
    z int,
    primary key (CodAnimale, TimeStamp)
);

drop table if exists Zona;
create table Zona (
	Codice int NOT NULL,
    primary key (Codice)
);

drop table if exists Recinzioni;
create table Recinzioni (
	Numero int NOT NULL,
    Tipologia char(100),
    primary key (Numero)
);

drop table if exists Delimitazione;
create table Delimitazione (
	CodiceZona int NOT NULL,
    NumeroRecinzione int NOT NULL,
    primary key (CodiceZona, NumeroRecinzione)
);

drop table if exists GPS;
create table GPS (
	CodAnimale int NOT NULL, 
    TimeStamp TimeStamp NOT NULL,
    x int, 
    y int,
    z int,
    primary key (CodAnimale, TimeStamp)
);

drop table if exists SchedaMedica;
create table SchedaMedica (
	CodAnimale int NOT NULL,
    RispostaOculare int, 
    Emocromo int,
    SpessoreZoccolo int,
    Pancreas int,
    Fegato int,
    Cuore int,
    CodVisitaMisurazioni int,
    primary key (CodAnimale)
);

drop table if exists Visita;
create table Visita (
CodVisita int NOT NULL,
    Data date,
    MassaMagra int,
    MassaGrassa int,
    CodAnimale int NOT NULL,
    primary key (CodVisita)
);

drop table if exists Quarantena;
create table Quarantena (
	DataInizio date NOT NULL,
    CodVisita int NOT NULL,
    primary key (DataInizio, CodVisita)
);

drop table if exists RilevamentoDisturbiComportamentali;
create table RilevamentoDisturbiComportamentali(
	CodVisita int NOT NULL,
    Disturbo char(100) NOT NULL,
    primary key (CodVisita, Disturbo)
);

drop table if exists DisturboComportamentale;
create table DisturboComportamentale(
	Nome char(100),
    Entita char(100),
    primary key (Nome)
);

drop table if exists RilevamentoLesioni;
create table RilevamentoLesioni(
	CodVisita int NOT NULL,
    TipologiaLesione char(100) NOT NULL,
    primary key (CodVisita, TipologiaLesione)
);

drop table if exists Lesione;
create table Lesione (
	Tipologia char(100) NOT NULL,
    Entita char(100),
    ParteCorpo char(100),
    primary key (Tipologia)
);

drop table if exists Terapia;
create table Terapia(
	CodTerapia int NOT NULL,
    Patologia char(100),
    CodVisita int,
    CodVeterinaro int,
    DataInizio date,
    Durata int,
    EsitoVisitaControllo char(100),
    primary key (CodTerapia)
);

drop table if exists Assunzione;
create table Assunzione(
	CodTerapia int NOT NULL,
    Farmaco char(100) NOT NULL,
    GiorniDiPausa int,
    primary key (Codterapia, Farmaco)
);

drop table if exists Farmaco;
create table Farmaco(
	NomeCommerciale char(100) NOT NULL,
    DosaggioGiornaliero int,
    primary key (NomeCommerciale)
);

drop table if exists OrariSomministrazione;
create table OrariSomministrazione(
	Farmaco char(100) NOT NULL,
    Ora time NOT NULL,
    primary key (Farmaco, Ora)
);

drop table if exists Riproduzione;
create table Riproduzione(
	Codice int NOT NULL,
    Madre int,
    Padre int,
    Data date,
    Orario time,
    Esito char(100),
    CodVeterinario int,
    primary key (Codice)
);

drop table if exists SchedaDiGestazione;
create table SchedaDiGestazione(
	CodRiproduzione int NOT NULL,
    CodVeterinario int,
    primary key (CodRiproduzione)
);

drop table if exists StatoMadre;
create table StatoMadre(
	CodRiproduzione int NOT NULL,
    Data date,
    LivVigilanza int, 
    Deambulazione int,
    LucentezzaPelo int,
    Idratazione int,
    Respirazione int,
    primary key (CodRiproduzione)
);

drop table if exists VisitaGravidanza;
create table VisitaGravidanza(
	CodTerapiaG int NOT NULL,
    Data date NOT NULL,
    CodVeterinario int,
    Esito char(100),
    Stato char(100),
    DataProgrammata char(100),
    primary key (CodTerapiaG, Data) 
);

drop table if exists Esame;
create table Esame(
	Codice int NOT NULL,
    Nome char(100),
    Data date,
    Descrizione text,
    Macchinario char(100),
    DataVisitaGravidanza date,
    CodRiproduzione int,
    primary key (Codice)
);

drop table if exists TerapiaGravidanza;
create table TerapiaGravidanza(
	CodTerapiaG int NOT NULL,
    CodVeterinario int,
    Durata int,
    DataInizio date,
    DataVisitaGravidanza date,
    CodRiproduzione int,
    primary key (CodTerapiaG)
);

drop table if exists AssunzioneGravidanza;
create table AssunzioneGravidanza(
	CodTerapiaG int NOT NULL,
    Farmaco char(100),
    primary key (CodTerapiaG)
);

drop table if exists PrenotazioneEscursione;
create table PrenotazioneEscursione(
	CodPrenotazione int not null,
    CodEscursione int not null,
    primary key(CodPrenotazione, CodEscursione)
);

drop table if exists Mungitura;
create table Mungitura(
	CodAnimale int NOT NULL,
    TimeStamp timestamp,
    CodLocale int,
    CodMungitrice int,
    CodSilos int,
    QuantitaLatte int,
    SaliMinerali int,
    Glucidi int,
    Grassi int,
    Vitamine int,
    primary key (CodAnimale,TimeStamp)
);

drop table if exists Mungitrice;
create table Mungitrice(
	Codice int NOT NULL,
    Posizione char(100),
    Modello char(100),
    Marca char(100),
    primary key (Codice)
);

drop table if exists Silos;
create table Silos(
	CodSilos int NOT NULL,
    Capacita int,
    LivRiempimento int,
    Vitamine int,
    SaliMinerali int, 
    Glucidi int,
    Grassi int,
    primary key (CodSilos)
);

drop table if exists PrelievoLatte;
create table PrelievoLatte(
	CodSilos int NOT NULL,
    CodLotto int NOT NULL,
    primary key (CodSilos, CodLotto)
);

drop table if exists Lotto;
create table Lotto(
	CodLotto int NOT NULL,
    DataProduzione date,
    DataScadenza date,
    Durata int,
    Laboratorio char(100),
    primary key (CodLotto)
);

drop table if exists FasiLavorazione;
create table FasiLavorazione(
	CodProdotto int NOT NULL,
    nFase int NOT NULL,
    Durata int,
    Temperatura int,
    TempoDiRiposo int,
    primary key (CodProdotto, nFase)
);

drop table if exists Impiego;
create table Impiego(
	CodLotto int NOT NULL,
    CodDipendente int NOT NULL,
    primary key (CodLotto, CodDipendente)
);

drop table if exists Dipendente;
create table Dipendente(
	CodDipendente int NOT NULL,
    Nome char(100),
    Cognome char(100),
    primary key (CodDipendente)
);

drop table if exists Prodotto;
create table Prodotto(
	CodProdotto int NOT NULL,
    CodLotto int,
    Peso int,
    TipoFormaggio char(100),
    primary key (CodProdotto)
);

drop table if exists Formaggio;
create table Formaggio(
	Nome char(100) NOT NULL,
    LuogoOrigine char(100),
    Deperibilita int,
    Vitamine int,
    SaliMinerali int,
    Glucidi int,
    Grassi int,
    primary key (Nome)
);

drop table if exists FasiLavorazioneIdeale;
create table FasiLavorazioneIdeale(
	NomeFormaggio char(100) NOT NULL,
    nFase int NOT NULL,
    Durata int,
    Temperatura int,
    TempoDiRiposo int,
    primary key (NomeFormaggio, nFase)
);

drop table if exists ScaffalaturaMagazzino;
create table ScaffalaturaMagazzino(
	CodScaffalaturaM int NOT NULL,
    CodMagazzino int NOT NULL,
    CodProdotto int,
    primary key (CodScaffalaturaM, CodMagazzino)
);

drop table if exists ScaffalaturaCantina;
create table ScaffalaturaCantina(
	CodScaffalaturaC int NOT NULL,
    CodCantina int NOT NULL,
    CodProdotto int,
    primary key (CodScaffalaturaC, CodCantina)
);

drop table if exists Magazzino;
create table Magazzino(
	CodMagazzino int NOT NULL,
    primary key (CodMagazzino)
);

drop table if exists Cantina;
create table Cantina(
	CodCantina int NOT NULL,
    primary key (CodCantina)
);

drop table if exists Stagionature;
create table Stagionature(
	CodCantina int NOT NULL,
    CodScaffalaturaC int NOT NULL,
    DurataStagionatura int,
    DataInizio date,
    NomeFormaggio char(100),
    primary key (CodCantina, CodScaffalaturaC)
);

drop table if exists Utente;
create table Utente(
	CodDocumento char(100) NOT NULL,
    Nome char(100),
    Cognome char(100),
    Indirizzo char(100),
    CodCartaCredito char(100),
    CodPagamento int,
    primary key (CodDocumento)
);

drop table if exists Cliente;
create table Cliente(
	CodPagamento int NOT NULL,
    primary key (CodPagamento)
);

drop table if exists Prenotazione;
create table Prenotazione(
	CodPrenotazione int NOT NULL,
    CodPagamento int,
    DataArrivo date,
    DataPartenza date,
    Acconto int,
    primary key (CodPrenotazione)    
);

drop table if exists PrenotazioneServiziAggiuntivi;
create table PrenotazioneServiziAggiuntivi(
	CodPrenotazione int NOT NULL,
    NomeServizio char(100) NOT NULL,
    DataInizio date,
    DataFine date,
    primary key (CodPrenotazione, NomeServizio)
);

drop table if exists ServiziAggiuntivi;
create table ServiziAggiuntivi(
	NomeServizio char(100) NOT NULL,
    Costo int,
    primary key (NomeServizio)
);

drop table if exists PrenotazioneStanze;
create table PrenotazioneStanze(
	CodPrenotazione int NOT NULL,
    NumeroStanza int NOT NULL,
    primary key (CodPrenotazione, NumeroStanza)
);

drop table if exists Stanza;
create table Stanza(
	NumeroStanza int NOT NULL,
    Tipo char(100),
    nLettiSingoli int,
    nLettiMatrimonali int,
    Costo int,
    primary key (NumeroStanza)
);

drop table if exists Pagamento;
create table Pagamento(
	CodPrenotazione int NOT NULL,
    Data date,
    Ora time,
    ImportoPagato int,
    CodCarta int,
    primary key (CodPrenotazione)
);

drop table if exists Guida;
create table Guida(
	CodGuida int NOT NULL,
    Nome char(100),
    Cognome char(100),
    primary key (CodGuida)
);

drop table if exists Escursione;
create table Escursione(
	CodEscursione int NOT NULL,
    CodGuida int,
    OrarioInizio time,
    Data date,
    primary key (CodEscursione)
);

drop table if exists Itinerario;
create table Itinerario(
	CodEscursione int NOT NULL,
    Area int NOT NULL,
    DurataSosta int NOT NULL,
    primary key (CodEscursione, Area, DurataSosta)
);

drop table if exists PrenotazioneEscursione;
create table PrenotazioneEscursione(
	CodPrenotazione int not null,
    CodEscursione int not null,
    primary key(CodPrenotazione, CodEscursione)
);

drop table if exists RecensioniProdotti;
create table RecensioniProdotti(
	NomeUtente char(100) not null,
	CodProdotto int not null,
    Valutazione int,
	primary key (NomeUtente, CodProdotto)
);

drop table if exists RecensioniSoggiorno;
create table RecensioniSoggiorno(
	NomeUtente char(100) not null,
	CodPrenotazione int not null,
    Valutazione int,
	primary key (NomeUtente, CodPrenotazione)
);


