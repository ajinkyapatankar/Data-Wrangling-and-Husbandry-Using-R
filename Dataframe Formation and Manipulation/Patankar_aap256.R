---
title: "Patankar_aap256"
author: "Ajinkya Patankar"
date: "2/4/2020"
output: html_document
---
```{Setting up opf R environment, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

```{r question 3 (c) Plot the number of male and female babies named "Taylor" *by year*}
library(babynames)
library(magrittr)
library(dplyr)
library(ggplot2)

taylor <- babynames%>%
  group_by(name,sex,year)%>%
  summarize(total=sum(n))%>%
  arrange(year)

taylor_table <-  filter(taylor,name=="Taylor")
#View(final)
```

## Including Plots

```{r plot for question 3, echo=FALSE}
ggplot(taylor_table,aes(year, total, color=sex))+
  geom_line()+
  ggtitle("Frequency of the name TAYLOR year wise")
```

***

## R Markdown

```{r question 4 (1) Is a 18 year old (as in 2020) named "Quinn" more likely to be a boy or a girl? }

quinn_18 <- babynames%>%
  group_by(name,sex,year)%>%
  summarize(total=sum(n))%>%
  arrange(year)

quinn_18_table <-  filter(quinn_18,name=="Quinn")
#View(final)
```

Answer Q4 Part 1: if there is an 18 year old named “Quinn”, he/she would have to be born in 2020-18= 2002. From the plot, we can conclude that Quinn would most likely be a BOY.

## Including Plots

```{r final, echo=FALSE}

ggplot(quinn_18_table,aes(year, total, color=sex))+
  geom_line()+
  ggtitle("Frequency of the name QUINN year wise")
```


## R Markdown

```{r question 4 (2) Is a 4 year old (as of 2020) named "Quinn" more likely to be a boy or a girl? }

library(magrittr)
library(dplyr)
library(ggplot2)
quinn_4 <- babynames%>%
  group_by(name,sex,year)%>%
  summarize(total=sum(n))%>%
  arrange(year)

quinn_18 <-  filter(quinn_18,name=="Quinn")
#View(final)
```

Answer Q4 Part 2, if there is an 4 year old named “Quinn”, he/she would have to been born in 2020-4= 2016. From the plot, we can conclude that Quinn would most likely be a GIRL.
***

## Including Plots

```{r final, echo=FALSE}
ggplot(quinn_18,aes(year, total, color=sex))+
  geom_line()+
  ggtitle("Frequency of the name QUINN year wise")
```

## R Markdown

```{r question 4 (4) What is your best guess as to how old (as of 2020) a woman named "Susan" is?}

library(magrittr)
library(dplyr)
library(ggplot2)
susan <- babynames%>%
  group_by(name,sex,year)%>%
  summarize(total=sum(n))%>%
  arrange(desc(total))
susan_table <- filter(susan,name=="Susan",sex=="F")

head(susan_table)
```

## Including Plots

```{r final,echo=FALSE}
ggplot(susan_table,aes(year, total))+
  geom_point()+
  ggtitle("Occurrences of the name SUSAN year wise")
```

Since, from the above data as well as the plot, we see that the majority of the birth years for a girl named SUSAN were in 1955, and aslo the plot points in that direction, we can safely conclude that the girl named SUSAN is 65 years (1955-present).

***