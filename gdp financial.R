#1. For every financial year, which sector has performed well



statewise_gsdp %>% 
  group_by(year, sector) %>%
  summarise(total_gsdp = sum(gsdp, na.rm = T)) ->df
  
df %>% 
  group_by(year) %>%
  arrange(desc(total_gsdp) %>% 
  slice(1)          




#2. For every financial year, which sector has performed least
#3. For every financial year, which state has performed well
#4. For every financial year, which state has performed least
#5. Top 5 performing states in Manufacturing
#6. Top 5 performing states in Construction
#7. For financial year 2016-17, for every state get top performing sector
#8. For financial year 2016-17, for every state get top 5 performing sectors
#9. How many states are performing well in Manufacturing, (if Manufacturing is in top 3)
#10. What is the GROSS GSDP of Karnataka for all financial years



