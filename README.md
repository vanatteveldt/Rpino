Calling Alpino from R
=====================

This package is a simple wrapper that calls Alpino (a Dutch dependency
parser; see <https://www.let.rug.nl/vannoord/alp>) from R as a system
call.

You need to either set the ALPINO\_HOME environment variable to point to
your Alpino installation, or specify it with the call.

Installation
============

Install rsyntax and Rpino from github:

    devtools::install_github("vanatteveldt/rsyntax")
    devtools::install_github("vanatteveldt/Rpino", force=T)

Calling Alpino:
===============

    tokens = Rpino::parse.Alpino(c("Jan houdt van taart", "Ik ook"))
    tokens

<table>
<thead>
<tr class="header">
<th align="left"></th>
<th align="left">sentence</th>
<th align="right">id</th>
<th align="left">lemma</th>
<th align="left">word</th>
<th align="left">start</th>
<th align="left">pos</th>
<th align="left">pos_spec</th>
<th align="left">type</th>
<th align="right">parent</th>
<th align="left">relation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">2</td>
<td align="left">1</td>
<td align="right">1</td>
<td align="left">Jan</td>
<td align="left">Jan</td>
<td align="left">0</td>
<td align="left">name</td>
<td align="left">name(PER)</td>
<td align="left">[rnum=sg]:proper_name(sg,PER)</td>
<td align="right">2</td>
<td align="left">su</td>
</tr>
<tr class="even">
<td align="left">3</td>
<td align="left">1</td>
<td align="right">2</td>
<td align="left">houd</td>
<td align="left">houdt</td>
<td align="left">1</td>
<td align="left">verb</td>
<td align="left">verb(pc_pp(van))</td>
<td align="left">[stype=declarative]:verb(hebben,sg3,pc_pp(van))</td>
<td align="right">NA</td>
<td align="left">hd</td>
</tr>
<tr class="odd">
<td align="left">4</td>
<td align="left">1</td>
<td align="right">3</td>
<td align="left">van</td>
<td align="left">van</td>
<td align="left">2</td>
<td align="left">prep</td>
<td align="left">prep</td>
<td align="left">[]:preposition(van,[af,uit,vandaan,[af,aan]])</td>
<td align="right">2</td>
<td align="left">pc</td>
</tr>
<tr class="even">
<td align="left">5</td>
<td align="left">1</td>
<td align="right">4</td>
<td align="left">taart</td>
<td align="left">taart</td>
<td align="left">3</td>
<td align="left">noun</td>
<td align="left">noun</td>
<td align="left">[rnum=sg]:noun(de,count,sg)</td>
<td align="right">3</td>
<td align="left">obj1</td>
</tr>
<tr class="odd">
<td align="left">7</td>
<td align="left">2</td>
<td align="right">5</td>
<td align="left">ik</td>
<td align="left">Ik</td>
<td align="left">0</td>
<td align="left">pron</td>
<td align="left">pron(nwh)</td>
<td align="left">[rnum=sg]:pronoun(nwh,fir,sg,de,nom,def)</td>
<td align="right">NA</td>
<td align="left">hd</td>
</tr>
<tr class="even">
<td align="left">8</td>
<td align="left">2</td>
<td align="right">6</td>
<td align="left">ook</td>
<td align="left">ook</td>
<td align="left">1</td>
<td align="left">adv</td>
<td align="left">adv(postnp)</td>
<td align="left">[]:postnp_adverb</td>
<td align="right">5</td>
<td align="left">mod</td>
</tr>
</tbody>
</table>
