#Imports
import Pkg
#Pkg.add("Gtk")
using Gtk

win = GtkWindow("EGinz", 400, 600)

#Global variables for the dilution
vtot = 50.
pgtovgratio = 50.
nicboostercons = 20.
nicdesiredcons = 3.
pgtovgratiobooster = 50.
aromacons = 5.
pgtovgratioaroma = 50.

pgvolvalue = 0.
vgvolvalue = 0.
boostersvolvalue = 0.
aromavolvalue = 0.

#Buttons to interact with global variables
vtotlabel = GtkLabel("Total Volume (ml)")
vtotvalue = GtkLabel("")
vtotdownbutton = GtkButton("-")
vtotupbutton = GtkButton("+")

pgtovgratiolabel = GtkLabel("PG to VG ratio (%)")
pgtovgratiovalue = GtkLabel("")
pgtovgratiodownbutton = GtkButton("-")
pgtovgratioupbutton = GtkButton("+")

nicdesiredconslabel = GtkLabel("Nicotine Concentration (mg/ml)")
nicdesiredconsvalue = GtkLabel("")
nicdesiredconsdownbutton = GtkButton("-")
nicdesiredconsupbutton = GtkButton("+")

boosterspgtovgratiolabel = GtkLabel("Boosters PG to VG ratio (%)")
boosterspgtovgratiovalue = GtkLabel("")
boosterspgtovgratiodownbutton = GtkButton("-")
boosterspgtovgratioupbutton = GtkButton("+")

boostersnicconslabel = GtkLabel("Boosters Nicotine (mg/ml)")
boostersnicconsvalue = GtkLabel("")
boostersnicconsdownbutton = GtkButton("-")
boostersnicconsupbutton = GtkButton("+")

aromapgtovgratiolabel = GtkLabel("Aroma PG to VG ratio (%)")
aromapgtovgratiovalue = GtkLabel("")
aromapgtovgratiodownbutton = GtkButton("-")
aromapgtovgratioupbutton = GtkButton("+")

aromaconcentrationlabel = GtkLabel("Aroma Concentration (%)")
aromaconcentrationvalue = GtkLabel("")
aromaconcentrationdownbutton = GtkButton("-")
aromaconcentrationupbutton = GtkButton("+")

debug = GtkLabel("")


#Buttons interraction
function vtotdown_clicked(w)
    if vtot>=5.
        global vtot-=5.
    end
end
signal_connect(vtotdown_clicked, vtotdownbutton, "clicked")

function vtotup_clicked(w)
    global vtot+=5.
end
signal_connect(vtotup_clicked, vtotupbutton, "clicked")

function pgtovgratiodown_clicked(w)
    if pgtovgratio>=5.
        global pgtovgratio-=5.
    end
end
signal_connect(pgtovgratiodown_clicked, pgtovgratiodownbutton, "clicked")

function pgtovgratioup_clicked(w)
    if pgtovgratio<=95.
        global pgtovgratio+=5.
    end
end
signal_connect(pgtovgratioup_clicked, pgtovgratioupbutton, "clicked")

function nicdesiredconsdown_clicked(w)
    if nicdesiredcons>=1.
        global nicdesiredcons-=1.
    end
end
signal_connect(nicdesiredconsdown_clicked, nicdesiredconsdownbutton, "clicked")

function nicdesiredconsup_clicked(w)
    global nicdesiredcons+=1.
end
signal_connect(nicdesiredconsup_clicked, nicdesiredconsupbutton, "clicked")

function boosterspgtovgratiodown_clicked(w)
    if pgtovgratiobooster>=5. 
        global pgtovgratiobooster-=5.
    end
end
signal_connect(boosterspgtovgratiodown_clicked, boosterspgtovgratiodownbutton, "clicked")

function boosterspgtovgratioup_clicked(w)
    if pgtovgratiobooster<=95. 
        global pgtovgratiobooster+=5.
    end
end
signal_connect(boosterspgtovgratioup_clicked, boosterspgtovgratioupbutton, "clicked")

function boostersnicconsdown_clicked(w)
    if nicboostercons>=1.
        global nicboostercons-=1.
    end
end
signal_connect(boostersnicconsdown_clicked, boostersnicconsdownbutton, "clicked")

function boostersnicconsup_clicked(w)
    global nicboostercons+=1.
end
signal_connect(boostersnicconsup_clicked, boostersnicconsupbutton, "clicked")

function aromapgtovgratiodown_clicked(w)
    if pgtovgratioaroma>=5.
        global pgtovgratioaroma-=5.
    end
end
signal_connect(aromapgtovgratiodown_clicked, aromapgtovgratiodownbutton, "clicked")

function aromapgtovgratioup_clicked(w)
    if pgtovgratioaroma<=95.
        global pgtovgratioaroma+=5.
    end
end
signal_connect(aromapgtovgratioup_clicked, aromapgtovgratioupbutton, "clicked")

function  aromaconcentrationdown_clicked(w)
    if aromacons>=1.
        global aromacons-=1.
    end
end
signal_connect(aromaconcentrationdown_clicked, aromaconcentrationdownbutton, "clicked")

function  aromaconcentrationup_clicked(w)
    if aromacons<=99.
        global aromacons+=1.
    end
end
signal_connect(aromaconcentrationup_clicked, aromaconcentrationupbutton, "clicked")

#Main page layout
maingrid = GtkGrid()

set_gtk_property!(maingrid, :column_homogeneous, true)
set_gtk_property!(maingrid, :column_spacing, 15)  
set_gtk_property!(maingrid, :row_spacing, 15)

maingrid[1:4, 1] = GtkLabel("What You Want")

maingrid[1, 2] = vtotlabel
maingrid[2, 2] = vtotvalue
maingrid[3, 2] = vtotdownbutton
maingrid[4, 2] = vtotupbutton

maingrid[1, 3] = pgtovgratiolabel
maingrid[2, 3] = pgtovgratiovalue
maingrid[3, 3] = pgtovgratiodownbutton
maingrid[4, 3] = pgtovgratioupbutton

maingrid[1, 4] = nicdesiredconslabel 
maingrid[2, 4] = nicdesiredconsvalue 
maingrid[3, 4] = nicdesiredconsdownbutton 
maingrid[4, 4] = nicdesiredconsupbutton

maingrid[1:4, 5] = GtkLabel("Booster Constraints")

maingrid[1, 6] = boosterspgtovgratiolabel
maingrid[2, 6] = boosterspgtovgratiovalue 
maingrid[3, 6] = boosterspgtovgratiodownbutton 
maingrid[4, 6] = boosterspgtovgratioupbutton

maingrid[1, 7] = boostersnicconslabel
maingrid[2, 7] = boostersnicconsvalue 
maingrid[3, 7] = boostersnicconsdownbutton 
maingrid[4, 7] = boostersnicconsupbutton

maingrid[1:4, 8] = GtkLabel("Aroma Constraints")

maingrid[1, 9] = aromapgtovgratiolabel
maingrid[2, 9] = aromapgtovgratiovalue 
maingrid[3, 9] = aromapgtovgratiodownbutton 
maingrid[4, 9] = aromapgtovgratioupbutton

maingrid[1, 10] = aromaconcentrationlabel
maingrid[2, 10] = aromaconcentrationvalue 
maingrid[3, 10] = aromaconcentrationdownbutton 
maingrid[4, 10] = aromaconcentrationupbutton

maingrid[1:4, 11] = GtkLabel("Final Recipe")

maingrid[1, 12] = GtkLabel("PG (ml)")
pgvollabel = GtkLabel("")
maingrid[2, 12] = pgvollabel

maingrid[3, 12] = GtkLabel("VG (ml)")
vgvollabel = GtkLabel("")
maingrid[4, 12] = vgvollabel

maingrid[1, 13] = GtkLabel("Boosters (ml)")
boostersvollabel = GtkLabel("")
maingrid[2, 13] = boostersvollabel

maingrid[3, 13] = GtkLabel("Aroma (ml)")
aromavollabel = GtkLabel("")
maingrid[4, 13] = aromavollabel

maingrid[1:4, 14] = GtkLabel("Debug")
maingrid[1:4, 15] = debug

#Update
function update!()
    global aromavolvalue = vtot*aromacons/100
    global boostersvolvalue = vtot*nicdesiredcons/nicboostercons
    alreadymadepgtovgratio = (aromavolvalue * pgtovgratioaroma + boostersvolvalue * pgtovgratiobooster) / (aromavolvalue + boostersvolvalue)
    pgvolvalue = (vtot * pgtovgratio - (aromavolvalue + boostersvolvalue) * alreadymadepgtovgratio)/100
    vgvolvalue = vtot - (aromavolvalue + boostersvolvalue) - pgvolvalue
    if (pgvolvalue<0 || vgvolvalue<0)
        GAccessor.text(debug,"Please enter valid values")
    else
        GAccessor.text(debug,"")
    end
    GAccessor.text(vtotvalue,string(round(vtot)))
    GAccessor.text(pgtovgratiovalue,string(round(pgtovgratio)))
    GAccessor.text(nicdesiredconsvalue,string(round(nicdesiredcons)))
    GAccessor.text(boostersnicconsvalue,string(round(nicboostercons)))
    GAccessor.text(boosterspgtovgratiovalue,string(round(pgtovgratiobooster)))
    GAccessor.text(aromapgtovgratiovalue,string(round(pgtovgratioaroma)))
    GAccessor.text(aromaconcentrationvalue,string(round(aromacons)))
    GAccessor.text(pgvollabel,string((pgvolvalue)))
    GAccessor.text(vgvollabel,string((vgvolvalue)))
    GAccessor.text(boostersvollabel,string((boostersvolvalue)))
    GAccessor.text(aromavollabel,string((aromavolvalue)))
end

push!(win, maingrid)

showall(win)


#Main Loop
while get_gtk_property(win, :visible, Bool)
    sleep(0.1)
    update!()
    continue
end

