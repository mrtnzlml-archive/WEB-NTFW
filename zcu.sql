-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Pondělí 01. října 2012, 15:47
-- Verze MySQL: 5.5.8
-- Verze PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `zcu`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazevKnihy` text NOT NULL,
  `popisKnihy` text NOT NULL,
  `cenaKnihy` int(11) NOT NULL,
  `md5obrazku` varchar(32) NOT NULL,
  `datumPridani` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Vypisuji data pro tabulku `books`
--

INSERT INTO `books` (`id`, `nazevKnihy`, `popisKnihy`, `cenaKnihy`, `md5obrazku`, `datumPridani`) VALUES
(13, 'Fifty Shades of Grey: Padesát odstínů šedi', 'Padesát odstínů šedé (Fifty Shades of Grey) je první díl erotické trilogie, kterou napsala E. L. James a zaujala tak čtenáře po celém světě. Studentka literatury Anastasia Steel má za úkol zpracovat rozhovor s úspěšným a bohatým podnikatelem Christianem Greyem (Grey = angl. šedý, odtud název knihy 50 odstínů šedé). Na domluvenou schůzku přijde muž, který Anastasii neuvěřitelně přitahuje. Je okouzlující, krásný, neuvěřitelně chytrý, svůdný a hrozivý. Nezkušená a nevinná dívka poprvé zažívá pocit, že nějakého muže chce. Z jedné strany ji odrazuje jeho záhadná rezervovaná osobnost a z druhé strany se mu strašně touží přiblížit. Starší a zkušený Christian není schopen odolat klidné kráse, důvtipu a nezávislému duchu mladé dívky. Ať chce nebo ne, musí si přiznat - touží po ní, chce ji...ale za svých vlastních podmínek. Anastasia je šokovaná i vzrušená Christianovými nezvyklými erotickými chutěmi. Váhá, ale není schopná mu odolat. Vášnivý živočišný vztah odkrývá jejich tajemství i temné sexuální touhy.', 339, '20de986db177c19f6639f5cf1cf3b846', '2012-09-30 16:44:24'),
(14, 'Horečka', 'Jediný prozaický text, který se zachoval v pozůstalosti básníka (1940-1965) považovaného za nejvýznamnějšího českého představitele "beat generation". Novela, která dodnes neztratila nic ze své jemné melancholie, jazzového rytmu a neobyčejně svěží živosti. Další vydání s černobílými fotografiemi Igora Malijevského vychází ve stejném formátu jako Hrabětovo Blues.', 140, '069ef6e3332ae9c90f66ec8f06510d79', '2012-09-30 16:46:14'),
(15, 'Má poslední vévodkyně', 'Američanka Cora Cashová se do Anglie vydává hledat budoucího manžela z donucení – její matka se totiž nehodlá spokojit s nikým menším než baronem nebo vévodou. Když se zamiluje do toho, u kterého by to čekala nejméně – Iva, devátého vévody z Warehamu –, a posléze přijme k matčině velké radosti jeho nabídku k sňatku, netuší, jak spletitou hru plnou intrik, lží a tajemství právě odstartovala. Brilantní románový debut z Anglie konce 19. století.', 269, '2ce3b1159c55648e3181c710cb48f0ae', '2012-09-30 16:48:06'),
(16, 'Temné dědictví', 'První ze tří příběhů o pozoruhodné čarodějnické rodině pana Rottentodda, majitele pohřebního ústavu. Rottentoddovi zdědí velký dům se zahradou, zahradníkem, komorníkem, miniteriérem Hannibalem a kuchařkou Karlou, který je plný pozoruhodných věcí. Jednou z nich je kniha se zlatou ořízkou a názvem MAGIA. Obsahuje 777 kouzelnických zaříkadel, jenže jak dvojčata zjistí, vůbec nefungují. Malá Polly musí chodit do lidské školy, kde si povšimne chlapce, kterého šikanují dva spolužáci. Spolu s dvojčaty mu pomůže a stávají se z nich kamarádi.', 179, '3b755e4b755f0b1956eef150ab8b4cd0', '2012-09-30 16:49:28'),
(17, 'Po boku', 'Kniha historika a novináře Petra Zídka popisuje osudy i soukromý život 33 manželek českých a československých premiérů od roku 1918 po naši současnost. Nabízí příběhy dam z doby prvorepublikové i období protektorátu, manželek komunistických předsedů vlády a nakonec i žen polistopadových premiérů, jejichž jména jsou ještě v živé paměti. Autor čerpal z dosud nezveřejněných archivních materiálů i osobních vzpomínek a rozhovorů a získal rovněž unikátní fotografický materiál. Ve zkrácené podobě kapitoly vyšly jako seriál v Magazínu Pátek Lidových novin.', 296, '41d429710dc338520e18966cfa947575', '2012-09-30 16:50:12'),
(18, 'Vladař', 'Vladař je nejvýznamnějším Machiavelliho dílem, které napsal již v roce 1513, ale vyšlo až po jeho smrti, roku 1532. Věnováno bylo rodu Medicejských (konkrétně „vznešenému Lorenzovi Medicejskému“). Autorovi šlo především o sjednocení Itálie, o jednotný stát, který by byl spravován moudrým vládcem, jenž by neměl váhat použít jakékoli prostředky, aby zajistil blaho země, a v zájmu této věci bylo Machiavellimu jedno, stane-li se tak formou republiky, nebo autokracie. Jako vzor vladaře Machiavellimu posloužil neúprosně vládychtivý Cesaro Borgia. Koncepce dvojí morálky – morálky soukromé a morálky moci – vedla k tomu, že byl Machiavelli označen za cynika, jde ale spíše o zlom v pojetí vládnutí: vládce už není služebníkem Božím, je služebníkem státu (termín, který prvně použil právě Machiavelli). Útlý spis o 26 kapitolách je klíčovým dílem, které obsahuje politické úvahy odhalující a popisující mechanismy fungování moci, a stal se základem děl dalších teoretiků moci. Přestože se Machiavelli věnuje hospodářské stránce vládnutí málo, jeho poučení, že dobrý vládce má zajistit, „aby se nikdo nebál zvelebovati majetek z obavy, že mu bude odňat, nebo si otevřít dílnu ze strachu před daněmi“, není zřejmě „vládci“ doceněno dodnes, patrně na rozdíl od myšlenky, že „lidé jsou tak prostomyslní a tolik se pachtí za tím, co právě potřebují, že kdo chce klamat, vždycky najde někoho, kdo se oklamat dá“. Celým dílem se pak vine základní myšlenka: totiž že by člověk měl spoléhat pouze na své síly.', 160, '8c01311692ca2340b25a1cab41119898', '2012-09-30 16:51:02'),
(19, 'Až na popel', 'Randall Haight má tajemství: jako teenager spolu s kamarádem zavraždil čtrnáctiletou dívku. Teď má možnost začít nový život. Žije v malém městě v Pastor Bay ve státě Maine. Nečekaně se objevuje někdo, kdo ví o jeho provinění. Trýzní Randalla anonymními vzkazy, vyhrožuje, že odhalí jeho kriminální minulost. Randall chce, aby mu soukromý detektiv Charlie Parker pomohl. V Pastor Bay ale shodou okolností zmizí čtrnáctiletá dívka. Také její rodina má tajemství, které se snaží úporně chránit. Charlie Parker se musí pokusit rozplést síť klamů a lží, do nichž je vtažena policie, FBI, člen gangu Tommy Morris i samotný Randall Haight.\r\nParkerův úkol se ukáže ještě složitější – Randall Haight totiž neříká pravdu…\r\nDalší titul z pera Johna Connollyho ze série detektivní románů se soukromým detektivem Charliem Parkerem patří mezi nejlepší americké díla ve způsobu, jak nakládá s druhým plánem. Děj se odehrává v jako obyvkle v Maine, v nehostinném', 224, '8c1ac540ddd85c583a829d5b848798f6', '2012-09-30 16:51:50'),
(20, 'Ruso a mizející tanečnice', 'Británie, rok 117 po Kristu. Vítejte v nejvzdálenějším koutě Římské říše. Pro armádního lékaře Gaia Petreia Rusa není tento zámořský post žádný med. Má velké dluhy, až moc chytrou otrokyni a ještě se musí potýkat se zpupným správcem nemocnice… nemluvě o sériovém vrahu, který je postrachem tanečnic z místního baru. Všichni čekají, že Ruso se ujme vyšetřování, ačkoli k významným pokrokům ve forenzním lékařství dojde až za mnoho set let. Usmějí se na něj bohové, než sám padne za oběť vrahovi? Kdyby se jen v Británii dalo najít dobré falernské víno, život by vypadal mnohem slibněji – a možná by se i místní přestali zabíjet…', 224, 'bc29bb1d4da208c0726e6b2637954868', '2012-09-30 16:52:33'),
(21, 'Cesta soucitného bojovníka', 'Ve své knize Dzigar Kongtrül Rinpočhe podává praktický komentář k významnému buddhistickému textu "Cesta bódhisattvy" od slavného indického učence Šántidévy. Rinpočhe zde velmi čtivě a poutavě hovoří o tématech, jakými jsou například rozvíjení soucitu a laskavosti vůči všem bytostem, píle a trpělivost na naší cestě meditace a kultivace vnitřní moudrosti, která je nezbytným předpokladem pro odstranění veškerého utrpení a dosažení stavu trvalého štěstí.', 206, '3de3d077b2fe0b24c4d0293610eed775', '2012-09-30 16:53:20'),
(22, 'Emauzský cyklus', 'V ambitu pražského benediktinského kláštera Na Slovanech zvaného též Emauzy se zachoval rozsáhlý cyklus nástěnných maleb z doby Karla IV. Tyto malby, ač značně poničené, jsou pozoruhodné jak svým rozsahem a vysokou uměleckou kvalitou, tak složitou ikonografií. Právě rozbor obsahu Emauzského cyklu je hlavním tématem této knihy. Díky nedávno nalezenému středověkému popisu emauzských maleb je dnes možné zrekonstruovat prvotní rozpětí cyklu a pochopit jeho ideový program. Zjistilo se totiž, že malby nebyly původně pouze v ambitu, ale i v přilehlé kapli, kde se dokonce nacházely ty nejdůležitější výjevy. Cyklus byl inspirován středověkými spisy, které pomocí textu a obrazu uváděly čtenáře do dějin spásy. Základním principem tu byl tzv. typologický způsob biblické exegeze, v němž byly k událostem z Nového zákona přiřazovány starozákonní předobrazy. Malby v ambitu měly své zvláštní poslání, které zřejmě úzce souviselo s výjimečným postavením slovanského kláštera v koncepci Nového Města pražského. Očividně byly také spojeny se slavností Kopí a hřebů Páně, kterou pravidelně doprovázelo velkolepé ukazování svatých ostatků, pořádané na nedalekém novoměstském rynku. Emauzské malby tak kromě jedinečné reprezentace malířského umění Čech druhé poloviny 14. století umožňují nahlédnout i do kulturního a duchovního ovzduší Prahy za vlády císaře Karla IV.', 585, '14ceabc51b9c3683dfa822cedb83104f', '2012-09-30 16:54:05'),
(23, 'Sex, drogy & cyb n roll', 'Není to tak daleká budoucnost. Rolling Stones možná ještě hrají, i když sešroubovaní ze spousty implantátů. Úžasné a skvěle prosperující město New Chrome je tvořeno osmi šestipodlažními levely, z nichž čtyři jsou nad zemí a čtyři pod zemí. Jedná se ovšem o dva úplně odlišné světy. Horní ovládá software, spodní drogy. Jerry Gibwill se shodou okolností pohybuje přesně na rozhraní těchto dvou tak protichůdných světů. A proto když dojde k jejich neodvratnému konfliktu, ocitá se nechtěně v centru dění. Ale není to konflikt mezi lidmi, nýbrž roztržka právě mezi softwarem a drogami. Když pak kolem Jerryho začínají umírat jeho přátelé, rozhodne se to řešit po svém. Pořídí si pistoli. A pak začne ten pravý kyberpunkový mazec...\r\nSamostatný román.', 268, '0504089837a64d8864f1818121d84f3c', '2012-09-30 16:54:46'),
(24, 'Dlouhý pochod', 'Dlouhý pochod - tak se jmenuje nová soutěž pro čím dál otrlejší a náročnější diváky i soutěžící. Sto mladých chlapců se dobrovolně rozhodlo postavit se na start a vydat se společně na Dlouhý pochod. Soutěž má prostá pravidla: nikdo se nesmí odchýlit z vytyčené trasy a nikdo se nesmí zastavit ani zpomalit chůzi pod určitou rychlost, jinak dostane napomenutí: tři napomenutí znamenají definitivní konec v soutěži. Nezáleží na tom, kdo jde nejrychleji nebo dojde nejdál, Dlouhý pochod přežije jen jeden z nich...', 246, '7aba00c865fd946e8a2cdcdc311d2224', '2012-09-30 16:55:23'),
(25, 'V nejvyšších sférách', 'Arthur Hailey, jeden z nejpopulárnějších autorů 60.–90. let (tehdy vyšly ve velkých nákladech romány Letiště, Hotel, Penězoměnci, Účinný lék, Konečná diagnóza, Večerní zprávy, Kola), v příběhu V nejvyšších sférách zachycuje prostředí vysoce postavených politiků, vlád, parlamentů a diplomatů v období vrcholící studené války a zdůrazňuje, že všechno v knize je fikce. Přesto čtenář ani na chvíli nezapochybuje, že dramatické události a konflikty mají svůj základ v realitě. Ba dokonce, že některé politické špinavosti i činy velkého morálního kreditu sice v čase i prostoru vzdálené jsou dodnes v mnohém aktuální a připomínají děje nám blízké. Hailey je znám tím, že vždy píše pouze o prostředí, s nímž se dokonale sžil. Kdo by tedy nechtěl poznat protichůdné zájmy v politice a prostředky, jež byly kdysi za studené války populární a nejsou ve svých důsledcích v praxi zapomenuty ani dnes?', 242, 'db21b1af5e04baa333aac057bf155d4e', '2012-09-30 16:56:09'),
(26, 'Úvod do moderní psychoanalýzy', 'Autor v publikaci představuje psychoanalýzu jako napínavou, stále se vyvíjející a hledající vědu o člověku.\r\nKniha se zabývá problematikou nevědomí, vývojem analýzy ve 20. století, vývojem, dynamikou a strukturou osobnosti, tématem učení, otázkou tělesna a tělesnosti v psychosomatice, vztahovostí, účinnými faktory v psychoterapii, prostor je věnován i skupinové psychoterapii a vztahu psychoanalýzy k politice a kulturně-společenskému dění. Představuje náčrt hlubinné psychologie osobnosti, jež zahrnuje jak zdraví, tak i abnormální vývoj. Autorův příspěvek spočívá zejména ve snaze o integraci hlubinného psychologického, behaviorálního i humanistického pojetí člověka na pozadí psychoanalytického výkladu a porozumění, ale i o integraci často kontroverzně koncipovaných psychoterapeutických představ coby hermeneutického výkladu potíží a problémů pacienta, či coby víceméně objektivních poruch a zábran v psychickém vývoji, ve zdravém psychickém fungování.', 224, 'e6083d0651f60e8622b1e5b9b1c6f014', '2012-09-30 16:57:04'),
(27, 'Modrá knížka pro školáky', 'Publikace Modrá knížka pro školáky je určena všem šikovným a zvídavým dětem, které rády řeší nejrůznější hádanky a úkoly, při nichž mohou zapojit své mozkové závity, a zároveň si občas s chutí procvičí kreslířské dovednosti a cit pro barvy s pěknou omalovánkou nebo obrázkem. ', 62, '6dab4555edff32986962c651387937bb', '2012-09-30 16:57:51'),
(28, 'Praga piccola', 'Historie jedné rodiny, jednoho města a jedné továrny z doby konce Rakouska-Uherska a ve slavném dvacetiletí Československé republiky tak, jak ji ve svých zápiscích zachytil libeňský rodák ing. Bertold Neuman a do románové podoby převedl Miloš Urban. -Praga Piccola uvádí čtenáře do prostředí jedné libeňské automobilové továrny na sklonku Rakouska-Uherska a pak ve dvacátých a třicátých letech první republiky. Dostáváme se do rodiny Rudolfa Neumana, poznáváme jeho ženu a dva syny, z nichž starší Rudi oplývá nadáním na všechno a může si vybrat, kým chce být, ale očekává se, že bude nástupcem svého otce, i když jeho to táhne do světa, zatímco na mladšího Bertolda zbylo talentu málo, ale o to víc chce v továrně získat neprotekční místo a vyrábět automobily. Právě Bertold je vypravěčem rodinné ságy. Bratři zpočátku netuší, proč se k nim přistěhoval vzdálený příbuzný Fridrich se svou dcerou Lilianou, a když vyjde nepříjemná pravda a z ní vyplývající povinnost najevo, Rudi se z ní šikovně vyvlékne a nechá se zastoupit mladším bratrem. Bertold si sestřenku vezme za ženu a pokusí se žít s ní smysluplný život, přestože jeho srdce je jinde. Jak pár stoupá na společenském žebříčku a z Libně proniká do lepších kruhů do Prahy, kde tráví volné neděle mezi filmovými herci a režiséry na Barrandovských terasách (příležitost prodat automobil hvězdě stříbrného plátna), zároveň se propadá do hluboké vztahové krize, kterou nezažehná ani narození dcery. Bertold se s rozchodem vyrovná po svém, ale s čím se vyrovnat nemůže, je přechod na armádní výrobu v době, kdy republice začne čím dál víc hrozit Německo. Jeho přání zůstat v Libni vezme za své, když mu židovští přátelé doporučí odejít před Hitlerem do Anglie a on je na poslední chvíli poslechne. Svůj oblíbený automobil, skromnou Pragu Piccolu, si bere s sebou, a spolu s ní tajemný náklad, který se mu podaří v bezpečí dostat až do Londýna. Odtamtud podniká kroky na záchranu své dcery a bývalé ženy, ale milovanou továrnu zachránit nedokáže.', 296, '516d91a9cf41ca63566cd7d064a641f4', '2012-09-30 16:58:41');

-- --------------------------------------------------------

--
-- Struktura tabulky `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `mena` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `options`
--

INSERT INTO `options` (`mena`) VALUES
('Kč');

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `login` varchar(50) NOT NULL,
  `mail` text NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `login`, `mail`, `password`, `role`) VALUES
(1, 'Martin', 'Zlámal', 'admin', 'mrtnzlml@gmail.com', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ecKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=a', 'admin'),
(2, 'Linus', 'Torvalds', 'member', 'linus@linus.com', 'bfc7fc84ba81cd4559cce0284264ce6d509826cce3b3d51317433fb2bec87e00f1ab26d50cc4fd9923fc26beb227fd0707af0708ed20c041b9e910701c1c75d2KJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=aKJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=a', 'member');
