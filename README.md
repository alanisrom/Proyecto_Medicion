#### Proyecto Medición

### Análisis del Nivel Educacional y Resultados Electorales en los Plebiscitos Constitucionales 2022-2023 (Chile)

# Introducción

El proyecto busca analizar la relación entre el nivel educacional promedio de las comunas chilenas y los resultados electorales obtenidos en los plebiscitos constitucionales de salida de 2022 y 2023, ambos realizados bajo voto obligatorio.

El objetivo es observar cómo factores socioeducativos influyen en la orientación del voto en procesos políticos de alta relevancia.

# Pregunta de investigación

¿Cómo se relaciona el nivel educacional de las comunas en Chile con el resultado positivo de los Plebiscitos de Salida de los procesos constituyentes 2022 y 2023?

# Marco Teórico
El proyecto analiza cómo las variables socioeconómicas, especialmente la educación, influyen en el comportamiento electoral en Chile.
Investigaciones clásicas ya destacaban que la educación es uno de los principales factores que explican la participación política. En América Latina, también se ha observado que el lugar de residencia y el nivel de ingresos afectan el voto: las zonas urbanas suelen participar menos, y dentro de ellas, los sectores más acomodados votan más que los de menores ingresos.

En Chile, la reforma electoral de 2012 marcó un fuerte descenso en la participación, con un promedio cercano al 48% en elecciones presidenciales posteriores. Esta caída acentuó el sesgo de clase en el voto, especialmente en distritos urbanos.

Los plebiscitos constitucionales de 2022 y 2023, ambos con voto obligatorio, ofrecen una oportunidad para observar cambios en este comportamiento. Estos procesos movilizaron a nuevos votantes —particularmente personas con menor nivel educacional—, permitiendo comparar cómo un electorado similar reaccionó de manera distinta en dos eventos consecutivos.

## Bases de datos y variables

Bases de datos que utilizamos:
1. Resultados-Plebiscito-Constitucional-2022.xlsx: Base de datos del Servel que nos envió la profe --> Variables que tomamos: comuna, opcion y votos_tricel (cantidad de votos x opción)
2. 2023_PlebiscitoConstitucional_DatosPlebiscito.xlsx: Base de datos del Servel que nos envió la profe --> Variables que tomamos: comuna, opcion y votos_tricel (cantidad de votos x opción)
3. P7_Educacion_2.xlsx: Base de datos de CASEN --> Variable que obtuvimos: Niveles de educación x comuna
4. P7_Educacion_4.xlsx: Base de datos de CASEN --> Variable que obtuvimos: Niveles de educación x comuna y sexo
5. D1_Poblacion-censada-por-sexo-y-edad-en-grupos-quinquenales.xlsx: Base de datos del CENSO 2024 --> Variable que obtuvimos: Grupos de edad unidos --> categorizamos en 20-34, 35-49, 50-64. 65-79 y 80+, cada una con N° (1, 2, 3, 4, 5)
6. datos_alcalde.xlsx: Base de datos del SERVEL del 2022 --> Variable que obtuvimos: Tendencia política de la comuna (a partir de la coalición del alcalde)
7. Estimaciones_Tasa_Pobreza_Ingresos_Comunas_2022.xlsx: Base de datos de INE --> Variable que obtuvimos: nivel de pobreza x comuna.

Sacamos la variable de "Zona" porque habían categorías con muy pocos casos, haciendo que la estimación sea inestable.

Tampoco consideramos en el análisis a la Antártica porque no tenían datos de muchas de nuestras variables. 

El trabajo con las bases de datos se nos dio de forma muy fácil, solo que al ser tantas, tuvimos que hacer muchas modificaciones para que estén todas iguales. Por ejemplo, tuvimos que cambiarle el nombre de las comunas a casi todas las bases de datos para que conincidieran. También, hubieron bases de datos donde, al momento de limpiarlas, se unificaron variables.  

## Resultados
![escolaridad_hombre_apruebo2022](https://github.com/user-attachments/assets/c4a6197f-bfee-424b-8aa7-ffdfa27f5507)
![escolaridad_mujeres_apruebo2022](https://github.com/user-attachments/assets/6586955a-2392-4835-bbfa-698a74427459)
![escolaridad_hombre_afavor2023](https://github.com/user-attachments/assets/80cb67a8-757c-471e-b6f5-600ee5c9688d)
![escolaridad_mujeres_afavor2023](https://github.com/user-attachments/assets/5bf371c6-311d-4e08-b15f-e85b09d7038e)
![pobreza_apruebo2022](https://github.com/user-attachments/assets/ac80dd18-9254-43b4-b48c-c6ec90eb5a7a)
![pobreza_afavor2023](https://github.com/user-attachments/assets/89062bd9-5a97-494b-84f7-dad1835b3b01)

Realizamos 2 modelos de regresión:

Para el Plebiscito 2022:

logit(Pleb_2022(Y=1))=β0​+β1​(escolaridad_mujeres)+β2​(escolaridad_hombres)+β3​(tendencia)+β4​(nivel_pobreza)+β5(grupo_edad)+β

Para el Plebiscito 2023:

logit(Pleb_2023(Y=1))=β0​+β1​(escolaridad_mujeres)+β2​(escolaridad_hombres)+β3​(tendencia)+β4​(nivel_pobreza)+β5(grupo_edad)+β

| Variable                    | Efecto en 2022          | Significancia 2022 | Efecto en 2023          | Significancia 2023      | Interpretación comparada                                                                         |
| --------------------------- | ----------------------- | ------------------ | ----------------------- | ----------------------- | ------------------------------------------------------------------------------------------------ |
| **Escolaridad hombres 18+** | Negativo                | No significativo   | Negativo                | Marginal (p ≈ 0.07)     | En 2023 comienza a mostrar efecto: más escolaridad masculina → menor apoyo al texto.             |
| **Escolaridad mujeres 18+** | Positivo                | No significativo   | Positivo                | *Significativo*         | En 2023 influye claramente: mayor escolaridad femenina → mayor apoyo al texto.                   |
| **Tendencia Independiente** | Positivo                | No significativo   | **Negativo**            | **Significativo**       | Cambia de sentido: en 2023 las comunas con independientes tienden a votar *en contra* del texto. |
| **Tendencia Izquierda**     | Positivo                | No significativo   | **Negativo**            | *Significativo*         | Cambia de sentido: en 2023 incluso la izquierda muestra tendencia a rechazo.                     |
| **Pobreza (personas)**      | Positivo (muy pequeño)  | No significativo   | **Positivo fuerte**     | ***Muy significativo*** | En 2023: comunas más pobres apoyan más el texto en promedio.                                     |
| **Edad (promedio / grupo)** | Negativo                | No significativo   | **Positivo**            | **Significativo**       | En 2023: comunas con mayores grupos etarios → más apoyo al texto.                                |
| **Intercepto**              | Negativo, significativo | —                  | Negativo, significativo | —                       | El voto por aprobar es bajo en promedio, aun controlando por variables.                          |

En resumen: 
En el Plebiscito de 2022, ninguna variable socioeconómica ni política tiene efectos significativos en la probabilidad de aprobar por comunas. Pero, en 2023 hay variables que s+i influyen en el A Favor, como mayor escolaridad femenina, menor escolaridad masculina, mayor pobreza comunal, mayor edad promedio y la tendencia política (independientes e izquierda) afectan significativamente el resultado. El cambio de signo en las variables muestran un cambio en el comportamiento electoral. 

# Disclaimers:
1. La gran mayoría de los códigos de R los sacamos de las mismas clases. El uso de inteligencia artificial fue para ayudarnos a detectar errores en el código, ayuda a interpretar los resultados y para aspectos específicos de cada uno de los codigos.
2. Recomendaciones para futuras investigaciones: hacer los gráficos exploratorias antes de las regresiones (básicamente tuvimos suerte). 
