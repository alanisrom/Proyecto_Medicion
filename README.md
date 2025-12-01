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

Gráfico 1: Escolaridad promedio de mujeres en plebiscito 2022 resultado Apruebo 

Descripción:
Presenta una tendencia positica, en la cual las comunas con mayor porcentaje de escolaridad femenina tienden a mostrar un mayor porcentaje de votos por el apruebo. Además se hay  una dispersión moderada, por lo que la escolaridad influye, pero no explica el resultado.
En relación a los outliers, existe una alta escolaridad promedio femeninaa, pero se presenta un bajo apoyo al apruebo.

Gráfico 2:  Escolaridad promedio de hombres en plebiscito 2022 resultado Apruebo 

Descripción:

Presenta una tendencia positica, en la cual las comunas con mayor porcentaje de escolaridad masculina tienden a mostrar un mayor porcentaje de votos por el apruebo. 
En relación a los outliers, el efecto del nivel educacional sobre el voto se desvanece o invierte.

Gráfico 3: Escolaridad promedio de mujeres en plebiscito 2023 resultado A favor

Descripción:
Presenta una relación negativa, la cual muestra que el apoyo a favor disminuye conforme aumenta la escolaridad promedio de las mujeres.
En relación a los outliers, hay altos niveles de escolaridad promedio pero muy bajo apoyo a favor.

Gráfico 4: Escolaridad promedio de hombres en plebiscito 2023 resultado a favor

Descripción: 
Presenta una relación negativa, la cual muestra que el apoyo a favor disminuye conforme aumenta la escolaridad promedio de los hombres.
En relación a los outliers, refuerzan la tendencia negativa, a diferencia de lo ocurrido en 2022, donde tendían a invertirla para el Apruebo.



