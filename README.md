## Format der Kfz-Zähldaten

```
MQ_[Knotennummer]_FV[Nummer]_[Richtung] ([eine andere interne Nummer])
```

Siehe den Lichtsignalplan für Standorte und Nummern.
Knotennummer entspricht Kreuzung (z.B. 01080 für Neutor)
FV heißt Fahrverkehr, entspricht einer "Straßenseite"
Richtung: G / L / R für Geradeaus-, Links-, oder Rechtsabbieger-spur
gesamtes Verkehrsaufkommen für eine Fahrrichtung ist dann die Summe von G / L / R

Notizen / Ideen:

- Daten sind nicht "kontrolliert" -> es kann gut sein, dass manche Zählschleifen nicht funktionieren oder manche Zählschleifen vertauscht sind. 
- Gibt es mehr Verkehr auf dem Albersloher Weg wegen Autobahnanschluss Hiltrup?
- Radverkehr verhält sich sehr ähnlich zum Kfz-Verkehr (vom Muster her)
- Münster ist Kfz-verkehrsmäßig am Limit, 3-4 % mehr Autos und es gibt Stau (z.B. bei schlechtem Wetter)
- Radverkehrsplanung ist Schönwetterplanung

## Rechtliches:

### Quelltext

Copyright © 2017 Thorben Jensen, Thomas Kluth

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have [received a copy of the GNU General Public License
along with this program](COPYING). If not, see <http://www.gnu.org/licenses/>.

Dieses Programm ist Freie Software: Sie können es unter den Bedingungen
der GNU General Public License, wie von der Free Software Foundation,
Version 3 der Lizenz oder (nach Ihrer Wahl) jeder neueren
veröffentlichten Version, weiterverbreiten und/oder modifizieren.

Dieses Programm wird in der Hoffnung, dass es nützlich sein wird, aber
OHNE JEDE GEWÄHRLEISTUNG, bereitgestellt; sogar ohne die implizite
Gewährleistung der MARKTFÄHIGKEIT oder EIGNUNG FÜR EINEN BESTIMMTEN ZWECK.
Siehe die GNU General Public License für weitere Details.

Sie sollten [eine Kopie der GNU General Public License zusammen mit diesem
Programm erhalten haben](COPYING). Wenn nicht, siehe <http://www.gnu.org/licenses/>.

### Daten

Datenquelle: Stadt Münster
[Datenlizenz Deutschland – Namensnennung – Version 2.0](http://www.govdata.de/dl-de/by-2-0) (oder [diese pdf-Datei](doc/Stadt_MS_OpenData_Datenlizenz_Deutschland.pdf))
