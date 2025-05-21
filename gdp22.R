library(tidyverse)
library(janitor)

"final_statewise_gsdp.csv" %>% 
  read_csv() -> statewise_gsdp
  
statewise_gsdp %>% 
  pull(item) %>% 
  unique()  

  
"final_statewise_gsdp.csv" %>% 
  read_csv() %>% 
  rename("sector" = "item") -> statewise_gsdp

statewise_gsdp %>% 
  pull(sector) %>% 
  unique()  




