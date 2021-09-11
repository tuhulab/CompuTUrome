# analyze 
library(dplyr)
library(ggplot2)

accounting_2021 <- 
  readr::read_csv("/Users/tuhu/Downloads/datafile_2021.csv") %>% 
  mutate(Year = "2021(Jan-Mar)")

accounting_2020 <- 
  readr::read_csv("/Users/tuhu/Downloads/datafile_2020.csv") %>% 
  mutate(Year = "2020")

user_data_2020 <- 
  accounting_2020 %>% 
  group_by(User) %>% 
  summarise(CPU_Hours = sum(CPUTime/3600)) %>% arrange(-CPU_Hours) %>% 
  mutate(tuhu=ifelse(User == "tuhu", TRUE, FALSE))
user_data_2021 <- 
  accounting_2021 %>% 
  group_by(User) %>% 
  summarise(CPU_Hours = sum(CPUTime/3600)) %>% arrange(-CPU_Hours) %>% 
  mutate(tuhu=ifelse(User == "tuhu", TRUE, FALSE))


user_data <-
  accounting_2020 %>% 
  bind_rows(accounting_2021) %>% 
  group_by(User, Year) %>% 
  summarise(CPU_Hours = sum(CPUTime/3600)) %>% arrange(-CPU_Hours) %>% 
  mutate(User_year = paste(User, Year, sep = "_")) %>% 
  filter(!is.na(CPU_Hours)) %>% ungroup() %>% 
  mutate(tuhu=ifelse(User == "tuhu", TRUE, FALSE),
         User_year=forcats::fct_reorder(User_year, desc(CPU_Hours)))

user_data %>% 
  ggplot(aes(User_year, log10(CPU_Hours))) + 
  geom_point(aes(color = tuhu, size = tuhu * 5), stat = "identity", show.legend = FALSE) + 
  scale_color_manual(values = c("black", "blue")) + xlab("User") + ylab("log10 CPU hours") +
  theme_classic() + 
  theme(axis.text.x=element_blank(),
        axis.ticks.x = element_blank()) +
  ggtitle("User CPU hours on Computerome (tuhu highlighted in blue)") + facet_grid(~Year)

user_data_2020 %>% 
  ggplot(aes(reorder(User, - CPU_Hours), log10(CPU_Hours))) + 
  geom_point(aes(color = tuhu, size = tuhu * 5), stat = "identity") + 
  scale_color_manual(values = c("black", "blue")) + xlab("User") + ylab("log10 CPU hours") +
  theme_classic() + 
  theme(axis.text.x=element_blank(),
        axis.ticks.x = element_blank()) +
  ggtitle("My CPU hours in 2020")
user_data_2021 %>% 
  ggplot(aes(reorder(User, - CPU_Hours), log10(CPU_Hours))) + 
  geom_point(aes(color = tuhu, size = tuhu * 5), stat = "identity") + 
  scale_color_manual(values = c("black", "blue")) + xlab("User") + ylab("log10 CPU hours") +
  theme_classic() + 
  theme(axis.text.x=element_blank(),
        axis.ticks.x = element_blank()) +
  ggtitle("My CPU hours in 2021")

# + facet_grid(~Year)

user_2021

tuhu_2020 <- 
  accounting_2020 %>% filter(User == "tuhu") %>% 
  mutate(CPUTime = CPUTime /3600)

tuhu_2021 <- 
  accounting_2021 %>% filter(User == "tuhu") %>% 
  mutate(CPUTime = CPUTime / 3600 )
# tuhu %>% ggplot(aes(CPUTime, Duration)) + geom_point()
# accounting_2021 %>% ggplot(aes(CPUTime, Duration)) + geom_point()
tuhu$CPUTime %>% which.max()
