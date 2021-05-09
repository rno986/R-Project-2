library("readxl")
my_data <- read_excel("./Overdose.xlsx", sheet = "Number Drug OD Deaths")
final=t(my_data)
final1=data.frame(final[2:22,5:92])
write.csv(final1, "./final1.csv")
View(final1)
summary(final1)
names(final1)[names(final1) == "X1"] <- "Year"
names(final1)[names(final1) == "X2"] <- "Total_Deaths"
names(final1)[names(final1) == "X3"] <- "Total_Deaths_F"
names(final1)[names(final1) == "X4"] <- "Total_Deaths_M"
names(final1)[names(final1) == "X5"] <- "Opioids"
names(final1)[names(final1) == "X6"] <- "Opioids_F"
names(final1)[names(final1) == "X7"] <- "Opioids_M"
names(final1)[names(final1) == "X8"] <- "P_Opioids"
names(final1)[names(final1) == "X9"] <- "P_Opioids_F"
names(final1)[names(final1) == "X10"] <- "P_Opiods_M"
names(final1)[names(final1) == "X11"] <- "P_Opioids_AND"
names(final1)[names(final1) == "X12"] <- "P_Opioids_AND_F"
names(final1)[names(final1) == "X13"] <- "P_Opioids_AND_M"
names(final1)[names(final1) == "X14"] <- "P_Opioids_NO"
names(final1)[names(final1) == "X15"] <- "P_Opioids_NO_F"
names(final1)[names(final1) == "X16"] <- "P_Opioids_NO_M"
names(final1)[names(final1) == "X17"] <- "S_Opioids"
names(final1)[names(final1) == "X18"] <- "S_Opioids_F"
names(final1)[names(final1) == "X19"] <- "S_Opioids_M"
names(final1)[names(final1) == "X20"] <- "Heroin"
names(final1)[names(final1) == "X21"] <- "Heroin_F"
names(final1)[names(final1) == "X22"] <- "Heroin_M"
names(final1)[names(final1) == "X23"] <- "Heroin_AND"
names(final1)[names(final1) == "X24"] <- "Heroin_AND_F"
names(final1)[names(final1) == "X25"] <- "Heroin_AND_M"
names(final1)[names(final1) == "X26"] <- "Heroin_NO"
names(final1)[names(final1) == "X27"] <- "Heroin_NO_F"
names(final1)[names(final1) == "X28"] <- "Heroin_NO_M"
names(final1)[names(final1) == "X29"] <- "Cocaine"
names(final1)[names(final1) == "X30"] <- "Cocaine_F"
names(final1)[names(final1) == "X31"] <- "Cocaine_M"
names(final1)[names(final1) == "X32"] <- "Cocaine_AND_O"
names(final1)[names(final1) == "X33"] <- "Cocaine_AND_O_F"
names(final1)[names(final1) == "X34"] <- "Cocaine_AND_O_M"
names(final1)[names(final1) == "X35"] <- "Cocaine_NO_O"
names(final1)[names(final1) == "X36"] <- "Cocaine_NO_O_F"
names(final1)[names(final1) == "X37"] <- "Cocaine_NO_O_M"
names(final1)[names(final1) == "X38"] <- "Cocaine_AND_SO"
names(final1)[names(final1) == "X39"] <- "Cocaine_AND_SO_F"
names(final1)[names(final1) == "X40"] <- "Cocaine_AND_SO_M"
names(final1)[names(final1) == "X41"] <- "Cocaine_NO_SO"
names(final1)[names(final1) == "X42"] <- "Cocaine_NO_SO_F"
names(final1)[names(final1) == "X43"] <- "Cocaine_NO_SO_M"
names(final1)[names(final1) == "X44"] <- "Psych"
names(final1)[names(final1) == "X45"] <- "Psych_F"
names(final1)[names(final1) == "X46"] <- "Psych_M"
names(final1)[names(final1) == "X47"] <- "Psych_AND_O"
names(final1)[names(final1) == "X48"] <- "Psych_AND_O_F"
names(final1)[names(final1) == "X49"] <- "Psych_AND_O_M"
names(final1)[names(final1) == "X50"] <- "Psych_NO_O"
names(final1)[names(final1) == "X51"] <- "Psych_NO_O_F"
names(final1)[names(final1) == "X52"] <- "Psych_NO_O_M"
names(final1)[names(final1) == "X53"] <- "Psych_AND_SO"
names(final1)[names(final1) == "X54"] <- "Psych_AND_SO_F"
names(final1)[names(final1) == "X55"] <- "Psych_AND_SO_M"
names(final1)[names(final1) == "X56"] <- "Psych_NO_SO"
names(final1)[names(final1) == "X57"] <- "Psych_NO_SO_F"
names(final1)[names(final1) == "X58"] <- "Psych_NO_SO_M"
names(final1)[names(final1) == "X59"] <- "Benz"
names(final1)[names(final1) == "X60"] <- "Benz_F"
names(final1)[names(final1) == "X61"] <- "Benz_M"
names(final1)[names(final1) == "X62"] <- "Benz_AND_O"
names(final1)[names(final1) == "X63"] <- "Benz_AND_O_F"
names(final1)[names(final1) == "X64"] <- "Benz_AND_O_M"
names(final1)[names(final1) == "X65"] <- "Benz_NO_O"
names(final1)[names(final1) == "X66"] <- "Benz_NO_O_F"
names(final1)[names(final1) == "X67"] <- "Benz_NO_O_M"
names(final1)[names(final1) == "X68"] <- "Benz_AND_SO"
names(final1)[names(final1) == "X69"] <- "Benz_AND_SO_F"
names(final1)[names(final1) == "X70"] <- "Benz_AND_SO_M"
names(final1)[names(final1) == "X71"] <- "Benz_NO_SO"
names(final1)[names(final1) == "X72"] <- "Benz_NO_SO_F"
names(final1)[names(final1) == "X73"] <- "Benz_NO_SO_M"
names(final1)[names(final1) == "X74"] <- "Anti"
names(final1)[names(final1) == "X75"] <- "Anti_F"
names(final1)[names(final1) == "X76"] <- "Anti_M"
names(final1)[names(final1) == "X77"] <- "Anti_AND_O"
names(final1)[names(final1) == "X78"] <- "Anti_AND_O_F"
names(final1)[names(final1) == "X79"] <- "Anti_AND_O_M"
names(final1)[names(final1) == "X80"] <- "Anti_NO_O"
names(final1)[names(final1) == "X81"] <- "Anti_NO_O_F"
names(final1)[names(final1) == "X82"] <- "Anti_NO_O_M"
names(final1)[names(final1) == "X83"] <- "Anti_AND_SO"
names(final1)[names(final1) == "X84"] <- "Anti_AND_SO_F"
names(final1)[names(final1) == "X85"] <- "Anti_AND_SO_M"
names(final1)[names(final1) == "X86"] <- "Anti_NO_SO"
names(final1)[names(final1) == "X87"] <- "Anti_NO_SO_F"
names(final1)[names(final1) == "X88"] <- "Anti_NO_SO_M"
View(final1)
final1$Year=as.factor(final1$Year)
summary(final1)
length(final1$Year)


new=final1 %>% select (c(2,6,9,18,21,30,45,60,75))
View(new)
write.csv(new, "./new.csv")
library(tidyverse)
read.csv(new, "./new.csv")%>%
  mutate(variable=row.names(.))%>%
  tidyr::gather("var","value",1:8)%>%
  ggplot(.,aes(x=variable,y=value)+
           geom_boxplot()+
           theme(axis.text.x = element_text(angle=35,hjust=1)))
  
m



#CLEANING DATA
library(leaflet)
library(htmlwidgets)

#MAP
Multiple.Cause.of.Death= read.delim("./Multiple.txt")
View(Multiple.Cause.of.Death)
Data=Multiple.Cause.of.Death
new=Data %>% select (-c(1,3,5))
myData= new[new$MCD...Drug.Alcohol.Induced.Code == "D",]


View(myData)




#Gender and State
gender= read.delim("./gender.txt")
View(gender)
new.2=gender %>% select (-c(1,3,5,9))
myData.2= new.2[new.2$MCD...Drug.Alcohol.Induced.Cause.Code != "D9",]
names(myData.2)[names(myData.2) == "MCD...Drug.Alcohol.Induced.Cause"] <- "Cause"
myData.2=na.omit(myData.2)
myData.2=myData.2 %>% group_by(Year)%>%
  complete(State, MCD...Drug.Alcohol.Induced.Cause.Code, fill = list(Deaths = 0))
View(myData.2)

write.csv(myData.2, "./myData2.csv")





library(plotly)
library(tidyr)
library(dplyr)

states=read.csv("./csvData.csv")
final_map=myData %>% select (-c(3,4))
map=final_map%>%
  inner_join(states,by.x=State,by.y=state)%>%
  select(Year,State,Code,Deaths,Crude.Rate)%>%
  mutate(hover = paste0(State, '\n', "Deaths:",Deaths))
write.csv(map, "./map.csv")

View(map)
# give state boundaries a white border
l <- list(color = toRGB("white"), width = 2)
# specify some map projection/options

fig <- plot_geo(map,
                locationmode = 'USA-states',
                frame=~Year)%>%
  add_trace(locations = ~Code,
  z = ~Deaths, 
  color = ~Deaths, 
  colors = 'Reds',
  zmin=0,
  zmax=max(map$Deaths),
  text= ~hover,
  hoverinfo='text'
)%>%
layout(geo=list(scope='usa'))
fig





