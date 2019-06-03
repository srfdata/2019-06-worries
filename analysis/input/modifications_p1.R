

library(stringr)
library(plyr)


# Basic data files (already loaded)
#   a_details = affairs details
#   c_details = councillor details



# merge to obtain party variable
a_details1 <- merge(a_details, c_details, by.x="a_author_name", by.y="c_name", all.x=T)

# skip needless variables
a_details1$a_date2 <- NULL
a_details1$a_language <- NULL
a_details1$a_state <- NULL
a_details1$time_stamp <- NULL


# skip cases before introduction of indexing values
a_details2 <- subset(a_details1, a_date1>="2000-10-18T00:00:00Z")

# create year variable (= first four characters of date)
a_details2$year <- substr(a_details2$a_date1, start = 1, stop = 4)


# only keep numerical characters and semicolon in indexing variable
a_details2$a_indexing2 <- gsub("[^0-9\\;]", "", a_details2$a_indexing, perl = TRUE)


# a few corrections to indexing
a_details2$a_indexing2[a_details2$a_id=="20023548"] <- "09"
a_details2$a_indexing2[a_details2$a_id=="20043475"] <- "2811"
a_details2$a_indexing2[a_details2$a_id=="20093294"] <- "15;32"
a_details2$a_indexing2[a_details2$a_id=="20113553"] <- "66"
a_details2$a_indexing2[a_details2$a_id=="20115409"] <- "24"
a_details2$a_indexing2[a_details2$a_id=="20143404"] <- "12;24"
a_details2$a_indexing2[a_details2$a_id=="20143531"] <- "09"
a_details2$a_indexing2[a_details2$a_id=="20145023"] <- "04"



# new variable to indicate popular initiatives
library("stringr")
a_details2$initiative <- 0
a_details2$initiative[a_details2$a_type=="Geschäft des Bundesrates" & str_detect(a_details2$a_title, ". Volksinitiative")==TRUE] <- 1


# new variable to indicate all cases to include
a_details2$included <- 0
a_details2$included[is.na(a_details2$a_author_external) & is.na(a_details2$a_author_canton)] <- 1



# new variables for index
a_details2$issue_04 <- 0
a_details2$issue_04[a_details2$a_indexing2=="04" | str_detect(a_details2$a_indexing2, ";04$")==TRUE | str_detect(a_details2$a_indexing2, ";04;")==TRUE | str_detect(a_details2$a_indexing2, "^04;")==TRUE] <- 1

a_details2$issue_08 <- 0
a_details2$issue_08[a_details2$a_indexing2=="08" | str_detect(a_details2$a_indexing2, ";08$")==TRUE | str_detect(a_details2$a_indexing2, ";08;")==TRUE | str_detect(a_details2$a_indexing2, "^08;")==TRUE] <- 1

a_details2$issue_09 <- 0
a_details2$issue_09[a_details2$a_indexing2=="09" | str_detect(a_details2$a_indexing2, ";09$")==TRUE | str_detect(a_details2$a_indexing2, ";09;")==TRUE | str_detect(a_details2$a_indexing2, "^09;")==TRUE] <- 1

a_details2$issue_10 <- 0
a_details2$issue_10[a_details2$a_indexing2=="10" | str_detect(a_details2$a_indexing2, ";10$")==TRUE | str_detect(a_details2$a_indexing2, ";10;")==TRUE | str_detect(a_details2$a_indexing2, "^10;")==TRUE] <- 1

a_details2$issue_12 <- 0
a_details2$issue_12[a_details2$a_indexing2=="12" | str_detect(a_details2$a_indexing2, ";12$")==TRUE | str_detect(a_details2$a_indexing2, ";12;")==TRUE | str_detect(a_details2$a_indexing2, "^12;")==TRUE] <- 1

a_details2$issue_15 <- 0
a_details2$issue_15[a_details2$a_indexing2=="15" | str_detect(a_details2$a_indexing2, ";15$")==TRUE | str_detect(a_details2$a_indexing2, ";15;")==TRUE | str_detect(a_details2$a_indexing2, "^15;")==TRUE] <- 1

a_details2$issue_24 <- 0
a_details2$issue_24[a_details2$a_indexing2=="24" | str_detect(a_details2$a_indexing2, ";24$")==TRUE | str_detect(a_details2$a_indexing2, ";24;")==TRUE | str_detect(a_details2$a_indexing2, "^24;")==TRUE] <- 1

a_details2$issue_28 <- 0
a_details2$issue_28[a_details2$a_indexing2=="28" | str_detect(a_details2$a_indexing2, ";28$")==TRUE | str_detect(a_details2$a_indexing2, ";28;")==TRUE | str_detect(a_details2$a_indexing2, "^28;")==TRUE] <- 1

a_details2$issue_32 <- 0
a_details2$issue_32[a_details2$a_indexing2=="32" | str_detect(a_details2$a_indexing2, ";32$")==TRUE | str_detect(a_details2$a_indexing2, ";32;")==TRUE | str_detect(a_details2$a_indexing2, "^32;")==TRUE] <- 1

a_details2$issue_34 <- 0
a_details2$issue_34[a_details2$a_indexing2=="34" | str_detect(a_details2$a_indexing2, ";34$")==TRUE | str_detect(a_details2$a_indexing2, ";34;")==TRUE | str_detect(a_details2$a_indexing2, "^34;")==TRUE] <- 1

a_details2$issue_36 <- 0
a_details2$issue_36[a_details2$a_indexing2=="36" | str_detect(a_details2$a_indexing2, ";36$")==TRUE | str_detect(a_details2$a_indexing2, ";36;")==TRUE | str_detect(a_details2$a_indexing2, "^36;")==TRUE] <- 1

a_details2$issue_44 <- 0
a_details2$issue_44[a_details2$a_date1<"2012-11-26T00:00:00Z"] <- NA
a_details2$issue_44[a_details2$a_indexing2=="44" | str_detect(a_details2$a_indexing2, ";44$")==TRUE | str_detect(a_details2$a_indexing2, ";44;")==TRUE | str_detect(a_details2$a_indexing2, "^44;")==TRUE] <- 1

a_details2$issue_48 <- 0
a_details2$issue_48[a_details2$a_indexing2=="48" | str_detect(a_details2$a_indexing2, ";48$")==TRUE | str_detect(a_details2$a_indexing2, ";48;")==TRUE | str_detect(a_details2$a_indexing2, "^48;")==TRUE] <- 1

a_details2$issue_52 <- 0
a_details2$issue_52[a_details2$a_indexing2=="52" | str_detect(a_details2$a_indexing2, ";52$")==TRUE | str_detect(a_details2$a_indexing2, ";52;")==TRUE | str_detect(a_details2$a_indexing2, "^52;")==TRUE] <- 1

a_details2$issue_55 <- 0
a_details2$issue_55[a_details2$a_indexing2=="55" | str_detect(a_details2$a_indexing2, ";55$")==TRUE | str_detect(a_details2$a_indexing2, ";55;")==TRUE | str_detect(a_details2$a_indexing2, "^55;")==TRUE] <- 1

a_details2$issue_66 <- 0
a_details2$issue_66[a_details2$a_indexing2=="66" | str_detect(a_details2$a_indexing2, ";66$")==TRUE | str_detect(a_details2$a_indexing2, ";66;")==TRUE | str_detect(a_details2$a_indexing2, "^66;")==TRUE] <- 1

a_details2$issue_76 <- 0
a_details2$issue_76[a_details2$a_indexing2=="76" | str_detect(a_details2$a_indexing2, ";76$")==TRUE | str_detect(a_details2$a_indexing2, ";76;")==TRUE | str_detect(a_details2$a_indexing2, "^76;")==TRUE] <- 1


a_details2$issue_0421 <- 0
a_details2$issue_0421[a_details2$a_indexing2=="0421" | str_detect(a_details2$a_indexing2, ";0421$")==TRUE | str_detect(a_details2$a_indexing2, ";0421;")==TRUE | str_detect(a_details2$a_indexing2, "^0421;")==TRUE] <- 1

a_details2$issue_1211 <- 0
a_details2$issue_1211[a_details2$a_date1<"2012-11-26T00:00:00Z"] <- NA
a_details2$issue_1211[a_details2$a_indexing2=="1211" | str_detect(a_details2$a_indexing2, ";1211$")==TRUE | str_detect(a_details2$a_indexing2, ";1211;")==TRUE | str_detect(a_details2$a_indexing2, "^1211;")==TRUE] <- 1

a_details2$issue_1216 <- 0
a_details2$issue_1216[a_details2$a_date1<"2012-11-26T00:00:00Z"] <- NA
a_details2$issue_1216[a_details2$a_indexing2=="1216" | str_detect(a_details2$a_indexing2, ";1216$")==TRUE | str_detect(a_details2$a_indexing2, ";1216;")==TRUE | str_detect(a_details2$a_indexing2, "^1216;")==TRUE] <- 1

a_details2$issue_1221 <- 0
a_details2$issue_1221[a_details2$a_date1<"2012-11-26T00:00:00Z"] <- NA
a_details2$issue_1221[a_details2$a_indexing2=="1221" | str_detect(a_details2$a_indexing2, ";1221$")==TRUE | str_detect(a_details2$a_indexing2, ";1221;")==TRUE | str_detect(a_details2$a_indexing2, "^1221;")==TRUE] <- 1

a_details2$issue_1231 <- 0
a_details2$issue_1231[a_details2$a_date1<"2012-11-26T00:00:00Z"] <- NA
a_details2$issue_1231[a_details2$a_indexing2=="1231" | str_detect(a_details2$a_indexing2, ";1231$")==TRUE | str_detect(a_details2$a_indexing2, ";1231;")==TRUE | str_detect(a_details2$a_indexing2, "^1231;")==TRUE] <- 1

a_details2$issue_1236 <- 0
a_details2$issue_1236[a_details2$a_date1<"2012-11-26T00:00:00Z"] <- NA
a_details2$issue_1236[a_details2$a_indexing2=="1236" | str_detect(a_details2$a_indexing2, ";1236$")==TRUE | str_detect(a_details2$a_indexing2, ";1236;")==TRUE | str_detect(a_details2$a_indexing2, "^1236;")==TRUE] <- 1

a_details2$issue_2446 <- 0
a_details2$issue_2446[a_details2$a_date1<"2012-11-26T00:00:00Z"] <- NA
a_details2$issue_2446[a_details2$a_indexing2=="2446" | str_detect(a_details2$a_indexing2, ";2446$")==TRUE | str_detect(a_details2$a_indexing2, ";2446;")==TRUE | str_detect(a_details2$a_indexing2, "^2446;")==TRUE] <- 1

a_details2$issue_2811 <- 0
a_details2$issue_2811[a_details2$a_indexing2=="2811" | str_detect(a_details2$a_indexing2, ";2811$")==TRUE | str_detect(a_details2$a_indexing2, ";2811;")==TRUE | str_detect(a_details2$a_indexing2, "^2811;")==TRUE] <- 1

a_details2$issue_2831 <- 0
a_details2$issue_2831[a_details2$a_indexing2=="2831" | str_detect(a_details2$a_indexing2, ";2831$")==TRUE | str_detect(a_details2$a_indexing2, ";2831;")==TRUE | str_detect(a_details2$a_indexing2, "^2831;")==TRUE] <- 1

a_details2$issue_2836 <- 0
a_details2$issue_2836[a_details2$a_date1<"2012-11-26T00:00:00Z"] <- NA
a_details2$issue_2836[a_details2$a_indexing2=="2836" | str_detect(a_details2$a_indexing2, ";2836$")==TRUE | str_detect(a_details2$a_indexing2, ";2836;")==TRUE | str_detect(a_details2$a_indexing2, "^2836;")==TRUE] <- 1

a_details2$issue_2841 <- 0
a_details2$issue_2841[a_details2$a_indexing2=="2841" | str_detect(a_details2$a_indexing2, ";2841$")==TRUE | str_detect(a_details2$a_indexing2, ";2841;")==TRUE | str_detect(a_details2$a_indexing2, "^2841;")==TRUE] <- 1

a_details2$issue_2846 <- 0
a_details2$issue_2846[a_details2$a_indexing2=="2846" | str_detect(a_details2$a_indexing2, ";2846$")==TRUE | str_detect(a_details2$a_indexing2, ";2846;")==TRUE | str_detect(a_details2$a_indexing2, "^2846;")==TRUE] <- 1


# redefine rarely used "76" code as "08" and delete issue_76
a_details2$issue_08[a_details2$issue_76=="1"] <- 1
a_details2$issue_76 <- NULL


# delete cases without indexing
a_details2 <- subset(a_details2, rowSums(a_details2[colnames(a_details2)[grepl("issue_",colnames(a_details2))]], na.rm=T) > 0)


# sample code to combine issues (here e.g. issues 52 & 66)
#a_details2$issue_52_66 <- a_details2$issue_52
#a_details2$issue_52_66[a_details2$issue_66=="1"] <- 1


# aggregate per year, council, etc.

library(plyr)
a_details3_1 <- ddply(a_details2, .(included, year, a_council, initiative), summarise, 
                      N    = length(included),
                      issue_08 = sum(issue_08),
                      #issue_76 = sum(issue_76),
                      issue_09 = sum(issue_09),
                      issue_10 = sum(issue_10),
                      issue_15 = sum(issue_15),
                      issue_44 = sum(issue_44, na.rm=T),     
                      issue_55 = sum(issue_55),
                      issue_24 = sum(issue_24),
                      issue_2446 = sum(issue_2446, na.rm=T),
                      issue_28 = sum(issue_28),
                      issue_2811 = sum(issue_2811),
                      issue_2836 = sum(issue_2836, na.rm=T),
                      issue_2841 = sum(issue_2841),
                      issue_2846 = sum(issue_2846),
                      issue_2831 = sum(issue_2831),
                      issue_32 = sum(issue_32),
                      issue_36 = sum(issue_36),
                      issue_34 = sum(issue_34),
                      issue_48 = sum(issue_48),
                      issue_52 = sum(issue_52),
                      issue_66 = sum(issue_66),
                      issue_04 = sum(issue_04),
                      issue_0421 = sum(issue_0421),
                      issue_12 = sum(issue_12),
                      issue_1211 = sum(issue_1211, na.rm=T),
                      issue_1216 = sum(issue_1216, na.rm=T),
                      issue_1221 = sum(issue_1221, na.rm=T),
                      issue_1231 = sum(issue_1231, na.rm=T),
                      issue_1236 = sum(issue_1236, na.rm=T),
                      .progress = "text")


a_details4_1 <- subset(a_details3_1, included==1 & (a_council!="Vereinigte Bundesversammlung" | is.na(a_council)))

a_details4_1$a_council[is.na(a_details4_1$a_council) & a_details4_1$initiative==0] <- "Bundesrat"
a_details4_1$a_council[is.na(a_details4_1$a_council) & a_details4_1$initiative==1] <- "Volksinitiative"

a_details4_1$included <- NULL
a_details4_1$initiative <- NULL





# aggregate per party group

library(plyr)
a_details3_2 <- ddply(a_details2, .(included, year, a_author_fraction), summarise, 
                      N    = length(included),
                      issue_08 = sum(issue_08),
                      #issue_76 = sum(issue_76),
                      issue_09 = sum(issue_09),
                      issue_10 = sum(issue_10),
                      issue_15 = sum(issue_15),
                      issue_44 = sum(issue_44, na.rm=T),
                      issue_55 = sum(issue_55),
                      issue_24 = sum(issue_24),
                      issue_2446 = sum(issue_2446, na.rm=T),
                      issue_28 = sum(issue_28),
                      issue_2811 = sum(issue_2811),
                      issue_2836 = sum(issue_2836, na.rm=T),
                      issue_2841 = sum(issue_2841),
                      issue_2846 = sum(issue_2846),
                      issue_2831 = sum(issue_2831),
                      issue_32 = sum(issue_32),
                      issue_36 = sum(issue_36),
                      issue_34 = sum(issue_34),
                      issue_48 = sum(issue_48),
                      issue_52 = sum(issue_52),
                      issue_66 = sum(issue_66),
                      issue_04 = sum(issue_04),
                      issue_0421 = sum(issue_0421),
                      issue_12 = sum(issue_12),
                      issue_1211 = sum(issue_1211, na.rm=T),
                      issue_1216 = sum(issue_1216, na.rm=T),
                      issue_1221 = sum(issue_1221, na.rm=T),
                      issue_1231 = sum(issue_1231, na.rm=T),
                      issue_1236 = sum(issue_1236, na.rm=T),
                      .progress = "text")


a_details4_2 <- subset(a_details3_2, included==1 & !is.na(a_author_fraction))

a_details4_2$included <- NULL




# Calculate percentages

a_details5_1 <- transform( a_details4_1,
                           issue_08 = 100 * issue_08 / N,
                           #issue_76 = 100 * issue_76 / N,
                           issue_09 = 100 * issue_09 / N,
                           issue_10 = 100 * issue_10 / N,
                           issue_15 = 100 * issue_15 / N,
                           issue_44 = 100 * issue_44 / N,
                           issue_55 = 100 * issue_55 / N,
                           issue_24 = 100 * issue_24 / N,
                           issue_2446 = 100 * issue_2446 / N,
                           issue_28 = 100 * issue_28 / N,
                           issue_2811 = 100 * issue_2811 / N,
                           issue_2836 = 100 * issue_2836 / N,
                           issue_2841 = 100 * issue_2841 / N,
                           issue_2846 = 100 * issue_2846 / N,
                           issue_2831 = 100 * issue_2831 / N,
                           issue_32 = 100 * issue_32 / N,
                           issue_36 = 100 * issue_36 / N,
                           issue_34 = 100 * issue_34 / N,
                           issue_48 = 100 * issue_48 / N,
                           issue_52 = 100 * issue_52 / N,
                           issue_66 = 100 * issue_66 / N,
                           issue_04 = 100 * issue_04 / N,
                           issue_0421 = 100 * issue_0421 / N,
                           issue_12 = 100 * issue_12 / N,
                           issue_1211 = 100 * issue_1211 / N,
                           issue_1216 = 100 * issue_1216 / N,
                           issue_1221 = 100 * issue_1221 / N,
                           issue_1231 = 100 * issue_1231 / N,
                           issue_1236 = 100 * issue_1236 / N )


a_details5_2 <- transform( a_details4_2,
                           issue_08 = 100 * issue_08 / N,
                           #issue_76 = 100 * issue_76 / N,
                           issue_09 = 100 * issue_09 / N,
                           issue_10 = 100 * issue_10 / N,
                           issue_15 = 100 * issue_15 / N,
                           issue_44 = 100 * issue_44 / N,
                           issue_55 = 100 * issue_55 / N,
                           issue_24 = 100 * issue_24 / N,
                           issue_2446 = 100 * issue_2446 / N,
                           issue_28 = 100 * issue_28 / N,
                           issue_2811 = 100 * issue_2811 / N,
                           issue_2836 = 100 * issue_2836 / N,
                           issue_2841 = 100 * issue_2841 / N,
                           issue_2846 = 100 * issue_2846 / N,
                           issue_2831 = 100 * issue_2831 / N,
                           issue_32 = 100 * issue_32 / N,
                           issue_36 = 100 * issue_36 / N,
                           issue_34 = 100 * issue_34 / N,
                           issue_48 = 100 * issue_48 / N,
                           issue_52 = 100 * issue_52 / N,
                           issue_66 = 100 * issue_66 / N,
                           issue_04 = 100 * issue_04 / N,
                           issue_0421 = 100 * issue_0421 / N,
                           issue_12 = 100 * issue_12 / N,
                           issue_1211 = 100 * issue_1211 / N,
                           issue_1216 = 100 * issue_1216 / N,
                           issue_1221 = 100 * issue_1221 / N,
                           issue_1231 = 100 * issue_1231 / N,
                           issue_1236 = 100 * issue_1236 / N )


# NA until 2011 for new indices
a_details5_1$issue_44[a_details5_1$year<"2012"] <- NA
a_details5_1$issue_2446[a_details5_1$year<"2012"] <- NA
a_details5_1$issue_2836[a_details5_1$year<"2012"] <- NA
a_details5_1$issue_1211[a_details5_1$year<"2012"] <- NA
a_details5_1$issue_1216[a_details5_1$year<"2012"] <- NA
a_details5_1$issue_1221[a_details5_1$year<"2012"] <- NA
a_details5_1$issue_1231[a_details5_1$year<"2012"] <- NA
a_details5_1$issue_1236[a_details5_1$year<"2012"] <- NA


a_details5_2$issue_44[a_details5_2$year<"2012"] <- NA
a_details5_2$issue_2446[a_details5_2$year<"2012"] <- NA
a_details5_2$issue_2836[a_details5_2$year<"2012"] <- NA
a_details5_2$issue_1211[a_details5_2$year<"2012"] <- NA
a_details5_2$issue_1216[a_details5_2$year<"2012"] <- NA
a_details5_2$issue_1221[a_details5_2$year<"2012"] <- NA
a_details5_2$issue_1231[a_details5_2$year<"2012"] <- NA
a_details5_2$issue_1236[a_details5_2$year<"2012"] <- NA




# rename columns
library(plyr)
Themen_Parlament_1_Räte <- rename(a_details5_1, c("issue_08"="Internationale_Politik", "issue_09"="Sicherheitspolitik", "issue_10"="Europapolitik",
                                                  "issue_15"="Wirtschaft", "issue_44"="Beschäftigung_Arbeit", "issue_55"="Landwirtschaft", "issue_24"="Finanzwesen", "issue_2446"="Steuer", "issue_28"="Soziale_Fragen", "issue_2811"="Migration", "issue_2836"="Sozialer_Schutz",
                                                  "issue_2841"="Gesundheit", "issue_2846"="Raumplanung_Wohnungswesen", "issue_2831"="Kultur", "issue_32"="Bildung", "issue_36"="Wissenschaft_Forschung", "issue_34"="Medien_Kommunikation",
                                                  "issue_48"="Verkehr", "issue_52"="Umwelt", "issue_66"="Energie", "issue_04"="Staatspolitik", "issue_0421"="Parlament", "issue_12"="Recht_allgemein", "issue_1211"="Zivilrecht", "issue_1216"="Strafrecht",
                                                  "issue_1221"="Gerichtswesen", "issue_1231"="Internationales_Recht", "issue_1236"="Menschenrechte"))


library(plyr)
Themen_Parlament_2_Fraktionen <- rename(a_details5_2, c("issue_08"="Internationale_Politik", "issue_09"="Sicherheitspolitik", "issue_10"="Europapolitik",
                                                        "issue_15"="Wirtschaft", "issue_44"="Beschäftigung_Arbeit", "issue_55"="Landwirtschaft", "issue_24"="Finanzwesen", "issue_2446"="Steuer", "issue_28"="Soziale_Fragen", "issue_2811"="Migration", "issue_2836"="Sozialer_Schutz",
                                                        "issue_2841"="Gesundheit", "issue_2846"="Raumplanung_Wohnungswesen", "issue_2831"="Kultur", "issue_32"="Bildung", "issue_36"="Wissenschaft_Forschung", "issue_34"="Medien_Kommunikation",
                                                        "issue_48"="Verkehr", "issue_52"="Umwelt", "issue_66"="Energie", "issue_04"="Staatspolitik", "issue_0421"="Parlament", "issue_12"="Recht_allgemein", "issue_1211"="Zivilrecht", "issue_1216"="Strafrecht",
                                                        "issue_1221"="Gerichtswesen", "issue_1231"="Internationales_Recht", "issue_1236"="Menschenrechte"))



# Export

save(Themen_Parlament_1_Räte, Themen_Parlament_2_Fraktionen, file="Themen_Parlament.Rda")

write.csv(Themen_Parlament_1_Räte, file="Themen_Parlament_1_Räte.csv")
write.csv(Themen_Parlament_2_Fraktionen, file="Themen_Parlament_2_Fraktionen.csv")

