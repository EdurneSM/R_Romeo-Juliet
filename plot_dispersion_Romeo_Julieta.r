# Cargo el documento con la obra
text.v = scan("romeo_and_juliet.txt", what = "character", sep = "\n")

# Aíslo los metadatos
start.v = which(text.v=="THE PROLOGUE")
end.v = which(text.v==" [_Exeunt_]")
start.metadata.v = text.v[1:start.v-1]
end.metadata.v = text.v[(end.v+1):length(text.v)]
metadata.v = c(start.metadata.v,end.metadata.v)

# Creo una variable con la obra
play.lines.v = text.v[start.v:end.v]
play.v = paste(play.lines.v, collapse=" ")
play.v

# Separo las palabras del documento
raj.words.l = strsplit(play.v, "\\W")
raj.words.v = unlist(raj.words.l)
not.blanks.v = which(raj.words.v!="")
raj.words.v = raj.words.v[not.blanks.v]
length(raj.words.v)

# Posiciones en las que se menciona a Romeo
romeo.v = which(raj.words.v=="Romeo")
romeo.v
# Posiciones en las que se menciona a Julieta
juliet.v = which(raj.words.v=="Juliet")
juliet.v

# Doy el valor NA a todas las posiciones del texto
w.count1.v = rep(NA, length(raj.words.v))
w.count2.v = rep(NA,length(raj.words.v))
# Doy el valor 1 a Romeo
w.count1.v[romeo.v]=1
# Doy el valor 2 a Juliet
w.count2.v[juliet.v]=2

# Creación de los gráficos de dispersión
# Elección de colores
colors()
cl = colors()
cl[grep("blue", cl)]
cl[grep("red", cl)]

plot(w.count1.v, col= "royalblue", xlab = "Línea de tiempo", ylab = "", type = "h", ylim=c(1,0), yaxt = "n")
par(new=TRUE)
plot(w.count2.v, col="red1" , xlab = "Línea de tiempo", ylab = "", type = "h", ylim=c(1,0), yaxt = "n")
title(main="Apariciones de Romeo y Julieta")
mtext("Julieta", side = 4, col="red1")
mtext("Romeo", side = 2, col="royalblue")