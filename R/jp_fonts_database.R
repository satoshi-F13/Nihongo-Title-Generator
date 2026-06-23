# =========================================================
# Japanese Google Fonts Database
# Columns: font, purpose, impression
# =========================================================

jp_fonts <- c(
  "Noto Sans JP",
  "Noto Serif JP",
  "M PLUS 1p",
  "M PLUS Rounded 1c",
  "M PLUS 2",
  "Kosugi",
  "Kosugi Maru",
  "Sawarabi Gothic",
  "Sawarabi Mincho",
  "Shippori Mincho",
  "Shippori Mincho B1",
  "Zen Kaku Gothic New",
  "Zen Kaku Gothic Antique",
  "Zen Old Mincho",
  "Zen Maru Gothic",
  "Yuji Syuku",
  "Yuji Boku",
  "Yuji Mai",
  "Hina Mincho",
  "Dela Gothic One",
  "Kaisei Decol",
  "Kaisei Opti",
  "Kaisei HarunoUmi",
  "Kaisei Tokumin",
  "Klee One",
  "RocknRoll One",
  "Stick",
  "Yusei Magic",
  "New Tegomin",
  "Reggae One",
  "Rampart One",
  "Train One",
  "Hachi Maru Pop",
  "Mochiy Pop One",
  "Mochiy Pop P One",
  "DotGothic16",
  "Potta One"
)

purpose <- c(
  "Web page, UI of App, Slides, Headline of poster", # Noto Sans JP
  "Formal documents, books, articles, certificates", # Noto Serif JP
  "UI design, signage, mobile apps, web body text", # M PLUS 1p
  "App icons, children's content, casual branding, signage", # M PLUS Rounded 1c
  "Web articles, long-form reading, UI, branding", # M PLUS 2
  "Signage, captions, retro UI, instructional text", # Kosugi
  "Casual signage, kids' content, app UI, packaging", # Kosugi Maru
  "Web body text, UI labels, simple documents", # Sawarabi Gothic
  "Web body text needing a traditional feel, blogs, articles", # Sawarabi Mincho
  "Book covers, literary titles, branding, packaging", # Shippori Mincho
  "Packaging, branding wanting warmth with tradition, greeting cards", # Shippori Mincho B1
  "Corporate branding, headlines, UI, signage", # Zen Kaku Gothic New
  "Editorial headlines, branding, posters", # Zen Kaku Gothic Antique
  "Literary titles, book design, traditional branding", # Zen Old Mincho
  "Branding, kids' content, casual UI, packaging", # Zen Maru Gothic
  "Traditional design, packaging, logos, titles with Japanese aesthetic", # Yuji Syuku
  "Logos, posters, artistic and traditional designs", # Yuji Boku
  "Titles, artistic branding, traditional aesthetic designs", # Yuji Mai
  "Captions, small-size text, cute traditional designs", # Hina Mincho
  "Posters, headlines, logos, impactful titles", # Dela Gothic One
  "Educational materials, branding, friendly headlines", # Kaisei Decol
  "Textbooks, formal documents, body text in print", # Kaisei Opti
  "Editorial design, books, gentle branding", # Kaisei HarunoUmi
  "Formal headlines, traditional documents, dignified branding", # Kaisei Tokumin
  "Personal notes, casual branding, greeting cards", # Klee One
  "Posters, music branding, pop-culture titles", # RocknRoll One
  "Minimalist branding, modern UI, fashion titles", # Stick
  "Kids' content, casual branding, social media graphics", # Yusei Magic
  "Textbooks, traditional formal text, academic materials", # New Tegomin
  "Posters, packaging, comic and pop titles", # Reggae One
  "Game titles, posters, dramatic headlines", # Rampart One
  "Signage-style branding, retro transit-themed designs", # Train One
  "Kids' content, cute branding, social media graphics", # Hachi Maru Pop
  "Cute branding, packaging, kids' content", # Mochiy Pop One
  "Cute branding with tighter spacing, packaging, captions", # Mochiy Pop P One
  "Retro game UI, digital signage, tech branding", # DotGothic16
  "Comic titles, kids' branding, playful posters" # Potta One
)

impression <- c(
  "Simple, modern, logical, and casual", # Noto Sans JP
  "Formal, elegant, trustworthy, and traditional", # Noto Serif JP
  "Clean, neutral, friendly, and modern", # M PLUS 1p
  "Soft, friendly, approachable, and cute", # M PLUS Rounded 1c
  "Refined, neutral, modern, and highly readable", # M PLUS 2
  "Plain, geometric, clear, and functional", # Kosugi
  "Friendly, rounded, soft, and casual", # Kosugi Maru
  "Plain, neutral, simple, and clean", # Sawarabi Gothic
  "Calm, traditional, simple, and readable", # Sawarabi Mincho
  "Elegant, literary, traditional, and refined", # Shippori Mincho
  "Warm, soft, elegant, and nostalgic", # Shippori Mincho B1
  "Modern, clean, neutral, and sophisticated", # Zen Kaku Gothic New
  "Warm, humanist, modern, and approachable", # Zen Kaku Gothic Antique
  "Classic, dignified, traditional, and elegant", # Zen Old Mincho
  "Soft, friendly, rounded, and warm", # Zen Maru Gothic
  "Calligraphic, artistic, traditional, and elegant", # Yuji Syuku
  "Bold, artistic, traditional, and powerful", # Yuji Boku
  "Elegant, flowing, artistic, and graceful", # Yuji Mai
  "Cute, delicate, traditional, and petite", # Hina Mincho
  "Bold, powerful, modern, and energetic", # Dela Gothic One
  "Friendly, classic, approachable, and warm", # Kaisei Decol
  "Clear, formal, neat, and academic", # Kaisei Opti
  "Gentle, harmonious, elegant, and calm", # Kaisei HarunoUmi
  "Sturdy, traditional, dignified, and formal", # Kaisei Tokumin
  "Handwritten, warm, casual, and friendly", # Klee One
  "Edgy, bold, modern, and energetic", # RocknRoll One
  "Minimal, sleek, modern, and stylish", # Stick
  "Playful, casual, friendly, and pop", # Yusei Magic
  "Academic, classic, plain, and formal", # New Tegomin
  "Fun, retro, bold, and playful", # Reggae One
  "Dramatic, bold, futuristic, and powerful", # Rampart One
  "Retro, geometric, nostalgic, and distinctive", # Train One
  "Cute, playful, childlike, and pop", # Hachi Maru Pop
  "Soft, cute, bouncy, and pop", # Mochiy Pop One
  "Cute, soft, pop, and playful", # Mochiy Pop P One
  "Retro, digital, geometric, and nostalgic", # DotGothic16
  "Bold, comic, playful, and fun" # Potta One
)

# Category follows Google Fonts' own 5-value taxonomy:
# "Serif", "Sans Serif", "Display", "Handwriting", "Monospace"
# This is the field worth binding filter checkboxes/dropdowns to in an app,
# since purpose/impression are free text and category is a fixed small set.
category <- c(
  "Sans Serif", # Noto Sans JP
  "Serif", # Noto Serif JP
  "Sans Serif", # M PLUS 1p
  "Sans Serif", # M PLUS Rounded 1c
  "Sans Serif", # M PLUS 2
  "Sans Serif", # Kosugi
  "Sans Serif", # Kosugi Maru
  "Sans Serif", # Sawarabi Gothic
  "Serif", # Sawarabi Mincho
  "Serif", # Shippori Mincho
  "Serif", # Shippori Mincho B1
  "Sans Serif", # Zen Kaku Gothic New
  "Sans Serif", # Zen Kaku Gothic Antique
  "Serif", # Zen Old Mincho
  "Sans Serif", # Zen Maru Gothic
  "Serif", # Yuji Syuku
  "Serif", # Yuji Boku
  "Serif", # Yuji Mai
  "Serif", # Hina Mincho
  "Display", # Dela Gothic One
  "Serif", # Kaisei Decol
  "Serif", # Kaisei Opti
  "Serif", # Kaisei HarunoUmi
  "Serif", # Kaisei Tokumin
  "Handwriting", # Klee One
  "Sans Serif", # RocknRoll One
  "Sans Serif", # Stick
  "Handwriting", # Yusei Magic
  "Serif", # New Tegomin
  "Display", # Reggae One
  "Display", # Rampart One
  "Display", # Train One
  "Handwriting", # Hachi Maru Pop
  "Display", # Mochiy Pop One
  "Display", # Mochiy Pop P One
  "Sans Serif", # DotGothic16
  "Display" # Potta One
)

# Italian translations of purpose and impression
purpose_it <- c(
  "Pagine web, UI di app, presentazioni, titoli di poster", # Noto Sans JP
  "Documenti formali, libri, articoli, certificati", # Noto Serif JP
  "Design di interfacce, segnaletica, app mobili, testo per il web", # M PLUS 1p
  "Icone di app, contenuti per bambini, branding informale, segnaletica", # M PLUS Rounded 1c
  "Articoli web, testi lunghi, interfacce, branding", # M PLUS 2
  "Segnaletica, didascalie, interfacce in stile retro, testi istruttivi", # Kosugi
  "Segnaletica informale, contenuti per bambini, interfacce di app, packaging", # Kosugi Maru
  "Testo per il web, etichette di interfaccia, documenti semplici", # Sawarabi Gothic
  "Testo per il web con un tono tradizionale, blog, articoli", # Sawarabi Mincho
  "Copertine di libri, titoli letterari, branding, packaging", # Shippori Mincho
  "Packaging, branding che unisce calore e tradizione, biglietti di auguri", # Shippori Mincho B1
  "Branding aziendale, titoli, interfacce, segnaletica", # Zen Kaku Gothic New
  "Titoli editoriali, branding, poster", # Zen Kaku Gothic Antique
  "Titoli letterari, progettazione di libri, branding tradizionale", # Zen Old Mincho
  "Branding, contenuti per bambini, interfacce informali, packaging", # Zen Maru Gothic
  "Design tradizionale, packaging, loghi, titoli con estetica giapponese", # Yuji Syuku
  "Loghi, poster, design artistici e tradizionali", # Yuji Boku
  "Titoli, branding artistico, design con estetica tradizionale", # Yuji Mai
  "Didascalie, testi di piccole dimensioni, design tradizionali e graziosi", # Hina Mincho
  "Poster, titoli, loghi, titoli d'impatto", # Dela Gothic One
  "Materiali didattici, branding, titoli amichevoli", # Kaisei Decol
  "Libri di testo, documenti formali, testo per la stampa", # Kaisei Opti
  "Design editoriale, libri, branding delicato", # Kaisei HarunoUmi
  "Titoli formali, documenti tradizionali, branding dignitoso", # Kaisei Tokumin
  "Appunti personali, branding informale, biglietti di auguri", # Klee One
  "Poster, branding musicale, titoli pop", # RocknRoll One
  "Branding minimalista, interfacce moderne, titoli di moda", # Stick
  "Contenuti per bambini, branding informale, grafiche per social media", # Yusei Magic
  "Libri di testo, testi formali tradizionali, materiali accademici", # New Tegomin
  "Poster, packaging, titoli fumettistici e pop", # Reggae One
  "Titoli di videogiochi, poster, titoli drammatici", # Rampart One
  "Branding in stile segnaletico, design a tema retro sui trasporti", # Train One
  "Contenuti per bambini, branding carino, grafiche per social media", # Hachi Maru Pop
  "Branding carino, packaging, contenuti per bambini", # Mochiy Pop One
  "Branding carino con spaziatura piu compatta, packaging, didascalie", # Mochiy Pop P One
  "Interfacce di videogiochi retro, segnaletica digitale, branding tecnologico", # DotGothic16
  "Titoli fumettistici, branding per bambini, poster giocosi" # Potta One
)

impression_it <- c(
  "Semplice, moderno, logico e informale", # Noto Sans JP
  "Formale, elegante, affidabile e tradizionale", # Noto Serif JP
  "Pulito, neutro, amichevole e moderno", # M PLUS 1p
  "Morbido, amichevole, accogliente e carino", # M PLUS Rounded 1c
  "Raffinato, neutro, moderno e molto leggibile", # M PLUS 2
  "Semplice, geometrico, chiaro e funzionale", # Kosugi
  "Amichevole, arrotondato, morbido e informale", # Kosugi Maru
  "Semplice, neutro, essenziale e pulito", # Sawarabi Gothic
  "Calmo, tradizionale, semplice e leggibile", # Sawarabi Mincho
  "Elegante, letterario, tradizionale e raffinato", # Shippori Mincho
  "Caldo, morbido, elegante e nostalgico", # Shippori Mincho B1
  "Moderno, pulito, neutro e sofisticato", # Zen Kaku Gothic New
  "Caldo, umanista, moderno e accogliente", # Zen Kaku Gothic Antique
  "Classico, dignitoso, tradizionale ed elegante", # Zen Old Mincho
  "Morbido, amichevole, arrotondato e caldo", # Zen Maru Gothic
  "Calligrafico, artistico, tradizionale ed elegante", # Yuji Syuku
  "Audace, artistico, tradizionale e potente", # Yuji Boku
  "Elegante, fluido, artistico e aggraziato", # Yuji Mai
  "Carino, delicato, tradizionale e minuto", # Hina Mincho
  "Audace, potente, moderno ed energico", # Dela Gothic One
  "Amichevole, classico, accogliente e caldo", # Kaisei Decol
  "Chiaro, formale, ordinato e accademico", # Kaisei Opti
  "Delicato, armonioso, elegante e calmo", # Kaisei HarunoUmi
  "Solido, tradizionale, dignitoso e formale", # Kaisei Tokumin
  "Scritto a mano, caldo, informale e amichevole", # Klee One
  "Grintoso, audace, moderno ed energico", # RocknRoll One
  "Minimale, slanciato, moderno e di tendenza", # Stick
  "Giocoso, informale, amichevole e pop", # Yusei Magic
  "Accademico, classico, semplice e formale", # New Tegomin
  "Divertente, retro, audace e giocoso", # Reggae One
  "Drammatico, audace, futuristico e potente", # Rampart One
  "Retro, geometrico, nostalgico e distintivo", # Train One
  "Carino, giocoso, infantile e pop", # Hachi Maru Pop
  "Morbido, carino, vivace e pop", # Mochiy Pop One
  "Carino, morbido, pop e giocoso", # Mochiy Pop P One
  "Retro, digitale, geometrico e nostalgico", # DotGothic16
  "Audace, fumettistico, giocoso e divertente" # Potta One
)

jp_fonts_db <- data.frame(
  font = jp_fonts,
  category = category,
  purpose = purpose,
  impression = impression,
  purpose_it = purpose_it,
  impression_it = impression_it,
  stringsAsFactors = FALSE
)

# Quick checks
# nrow(jp_fonts_db)   # should be 37
# View(jp_fonts_db)   # opens in RStudio data viewer

# Optional: export to CSV
write.csv(
  jp_fonts_db,
  "data/jp_fonts_database.csv",
  row.names = FALSE,
  fileEncoding = "UTF-8"
)
