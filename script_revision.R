library(tidyverse)
library(stargazer)

# Modificación base de datos:

df_final <- read_csv("data/base_final_lista.csv")

df_final <- df_final |>
  mutate(pleb_2022_bin = ifelse(apruebo > rechazo, 1, 0 ) |> as.factor())

df_final <- df_final |> 
  mutate(pleb_2023_bin = ifelse(a_favor > en_contra, 1, 0) |> as.factor())

df_final <- df_final |> 
  mutate(
    tendencia = case_when(
      pacto %in% c("Chile Vamos", "Unidos Por La Dignidad") ~ "Derecha",
      pacto %in% c("Unidad Por El Apruebo", "Frente Amplio", "Chile Digno Verde Y Soberano", "Dignidad Ahora") ~ "Izquierda",
      pacto == "Independientes" ~ "Independiente",
      TRUE ~ "Otro"
    )
  )

# Conteo

df_final |> 
  count(pleb_2022_bin) # Muy poca variabilidad

df_final |> 
  count(pleb_2023_bin) 

# Crearemos las variables porcentaje

df_final <- df_final |> 
  rowwise() |> 
  mutate(pleb_2022_porc_apruebo = apruebo/(apruebo+rechazo),
         pleb_2023_porc_a_favor = a_favor/(a_favor+en_contra))

df_final <- df_final |> 
  rowwise() |> 
  mutate(ed_superior_porc = superior / poblacion_censada.y)

# Revisamos la distribución de nuestra VD

df_final |> 
  ggplot(aes(x = pleb_2022_porc_apruebo)) +
  geom_histogram()

df_final |> 
  ggplot(aes(x = pleb_2023_porc_a_favor)) +
  geom_histogram()

# Transformación de las variables

df_final |> 
  ggplot(aes(x = ed_superior_porc)) +
  geom_histogram()

df_final |> 
  ggplot(aes(x = exp(porcentaje_de_personas_en_situacion_de_pobreza_por_ingresos_2022))) +
  geom_histogram()


# Modelos regresión lineal múltiple

modelo_2022 <- lm(
  pleb_2022_porc_apruebo ~ 
    ed_superior_porc + tendencia + numero_de_personas_en_situacion_de_pobreza_por_ingresos + factor(grupo_edad_unido),
  data = df_final
)

summary(modelo_2022)

modelo_2023 <- lm(
  pleb_2023_porc_a_favor ~ 
    ed_superior_porc + tendencia + numero_de_personas_en_situacion_de_pobreza_por_ingresos + factor(grupo_edad_unido),
  data = df_final
)

summary(modelo_2023)

modelos <- list(modelo_2022, modelo_2023)

stargazer(modelos, type = "text")

# Regresión logit

modelo_2022_logit <- glm(
  pleb_2022_bin ~ 
    ed_superior_porc + tendencia + numero_de_personas_en_situacion_de_pobreza_por_ingresos + factor(grupo_edad_unido),
  data = df_final,
  family = binomial(link = "logit")
)

summary(modelo_2022_logit)

modelo_2023_logit <- glm(
  pleb_2023_bin ~ 
    ed_superior_porc + tendencia + numero_de_personas_en_situacion_de_pobreza_por_ingresos + factor(grupo_edad_unido),
  data = df_final,
  family = binomial(link = "logit")
)

summary(modelo_2023_logit)

modelos_logit <- list(modelo_2022_logit, modelo_2023_logit)

stargazer(modelos_logit, type = "text")

# Gráficos:

# Porcentaje apruebo y porcentaje de población con educación superior

ggplot(
  df_final, 
  aes(
    x = ed_superior_porc,
    y = pleb_2022_porc_apruebo
  )
) +
  geom_point(color = "#457b9d", size = 2, alpha = 0.7) +
  geom_smooth(method = "lm", 
              color = "#e63946") +
  geom_text(
    data = df_final %>% 
      filter(
        pleb_2022_porc_apruebo < 0.24  &
          ed_superior_porc > 0.5
      ),
    aes(label = comuna),
    size = 2.5,
    color = "black",
    check_overlap = TRUE,
    nudge_y = 0.01
  ) +
  scale_y_continuous(limits = c(0, 1), labels = scales::percent) +
  scale_x_continuous(labels = scales::percent) +
  labs(
    title = "Votación del Apruebo y educación superior por comuna",
    subtitle = "Relación entre apoyo al Apruebo y nivel educativo de la población comunal\n(Plebiscito Constitucional 2022)",
    x = "Porcentaje de población con educación superior (comunas)",
    y = "Porcentaje de votos para el Apruebo (votos válidos)",
    caption = "Fuente: Servicio Electoral de Chile (SERVEL), Resultados electorales históricos.\nInstituto Nacional de Estadísticas (INE), Resultados CENSO 2024.\nElaboración propia."
  ) +
  theme_minimal(base_family = "Roboto") +
  theme(
    plot.title = element_text(size = 13, face = "bold"),
    axis.title = element_text(size = 11)
  )

# Mapa RM

library(sf)

mapa_chile <- read_sf("data/geometrias/comunas.shp")

colnames(mapa_chile)

# Estandarizo la variable comuna

mapa_chile_limpia <- mapa_chile |> 
  mutate(Comuna = str_to_lower(Comuna),
         Comuna = stringi::stri_trans_general(Comuna, "latin-ascii")) |> 
  filter(codregion == 13)

df_final_limpia <- df_final |> 
  mutate(comuna = str_to_lower(comuna),
         comuna = stringi::stri_trans_general(comuna, "latin-ascii"))

# Veo que no haya problemas con las comunas de la RM
  
mapa_chile_limpia |> 
  anti_join(df_final_limpia, by = c("Comuna"="comuna")) |> 
  select(Comuna)

# Uno las bases de datos

mapa_chile_modelos <- mapa_chile_limpia |> 
  left_join(df_final_limpia, by = c("Comuna"="comuna"))

mapa_chile_modelos <- mapa_chile_modelos |> 
  filter(!is.na(Region))

str(mapa_chile_modelos)

mapa_chile_modelos |> 
  ggplot() +
  geom_sf(aes(fill = ed_superior_porc)) +
  scale_fill_gradient(name = "% Apruebo:",
                      low = "#fcb9b2", high = "#461220") +
  labs(
    title = "Educación superior",
    subtitle = "Porcentaje de personas con educación superior por comuna (Censo 2024).\nRegión Metropolitana.",
    caption = "Fuente: Servicio Electoral de Chile (SERVEL), Resultados electorales históricos.\nInstituto Nacional de Estadísticas (INE), Resultados CENSO 2024.\nElaboración propia."
  ) +
  theme_linedraw() +
  theme(legend.position = "bottom",
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.text.y = element_blank())


