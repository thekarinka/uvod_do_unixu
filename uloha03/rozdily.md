# 1. skript
- pipe způsobí, že se pro cat a while vytvoří samostatné procesy, poté co se dokončí proces while zmizí i proměnná procesu nazvaná počet a tudíž není zobrazena správná hodnota

# 2. skript
- opravená verze 1, zde je proměnná počet použita v rámci procesu (včetně jejího vypsání)

——————————————————————————————————————————————————————————————

# 3. a 4. skript
- 3. skript je podobný jako 4. skript, 3. je narozdíl od 4. funkční, 4. nefunguje z důvodu toho, že se příkaz pro while vždy začne zpracovávat od začátku (při každém cyklu se tedy přečte první řádek a cyklus nikdy nekončí), tomu je ve 3. skriptu zabráněno přesunutím přesměrování vstupu na vhodné místo

# Závěr
- funkční je 2. a 3. skript
