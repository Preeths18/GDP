library(tidyverse)
library(janitor)
library(stringr)


dir()

dir(path = "GDP Data" )

"GDP Data/NAD-Andhra_Pradesh-GSva_cur_2016-17.csv" %>%
  read_csv() -> ap_df 

"NAD-Andra Pradesh-GSVA_cur_2016-17.csv" %>% 
  str_split("-") %>% 
  unlist() -> state_name_vector

state_name_vector[2] -> st_name

ap_df %>%  
  slice(-c(7,11,27:33)) %>%
  pivot_longer(-c(1,2), names_to = "year", values_to = "gsdp") %>%
  clean_names()  %>%
  select(-1) %>% 
  mutate(state = "Andra Pradesh")

view()

# Get data of nad files exclude gsdp

dir(path = "GDP Data",
    patter="NAD") -> state_files




# step 1

for (i in state_files) {
  print(paste0("File name: ", i))
}


# step 2
tempdf <- tibble()
for (i in state_files) {
  print(paste0("File name: ",i))
  
  i %>% 
    str_split("-") %>% 
    unlist() -> state_name_vector
  
  state_name_vector[2] -> st_name
  
  print(paste0("State name: ", st_name))
  
  paste0("GDP Data/", i) %>% 
    read_csv() -> st_df1
  
  st_df1 %>% 
    slice(-c(7, 11, 27:33)) %>% 
    pivot_longer(-c(1, 2), names_to = "year", values_to = "gsdp") %>% 
    clean_names() %>% 
    select(-1) %>% 
    mutate(state = st_name) -> state_df
  print(state_df)
  
  tempdf <- tibble()
  
  bind_rows(tempdf,state_df) -> tempdf
  
  
}

# step 3


tempdf -> final_statewise_gsdp

# step4

final_statewise_gsdp %>% 
  write_csv("final_statewise_gsdp.csv")










  

