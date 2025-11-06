#### Proyecto Medición

### Análisis del Nivel Educacional y Resultados Electorales en los Plebiscitos Constitucionales 2022-2023 (Chile)

## Introducción

El proyecto busca analizar la relación entre el nivel educacional promedio de las comunas chilenas y los resultados electorales obtenidos en los plebiscitos constitucionales de salida de 2022 y 2023, ambos realizados bajo voto obligatorio.

El objetivo es observar cómo factores socioeducativos influyen en la orientación del voto en procesos políticos de alta relevancia.

# Pregunta de investigación

¿Cómo se relaciona el nivel educacional de las comunas en Chile con el resultado positivo de los Plebiscitos de Salida de los procesos constituyentes 2022 y 202?

# Marco Teórico
El proyecto analiza cómo las variables socioeconómicas, especialmente la educación, influyen en el comportamiento electoral en Chile.
Investigaciones clásicas ya destacaban que la educación es uno de los principales factores que explican la participación política. En América Latina, también se ha observado que el lugar de residencia y el nivel de ingresos afectan el voto: las zonas urbanas suelen participar menos, y dentro de ellas, los sectores más acomodados votan más que los de menores ingresos.

En Chile, la reforma electoral de 2012 marcó un fuerte descenso en la participación, con un promedio cercano al 48% en elecciones presidenciales posteriores. Esta caída acentuó el sesgo de clase en el voto, especialmente en distritos urbanos.

Los plebiscitos constitucionales de 2022 y 2023, ambos con voto obligatorio, ofrecen una oportunidad para observar cambios en este comportamiento. Estos procesos movilizaron a nuevos votantes —particularmente personas con menor nivel educacional—, permitiendo comparar cómo un electorado similar reaccionó de manera distinta en dos eventos consecutivos.

## Bases de datos y variables

<img width="933" height="523" alt="image" src="https://github.com/user-attachments/assets/03050688-9d3e-4948-8acf-fb60412c9818" />

<img width="935" height="523" alt="image" src="https://github.com/user-attachments/assets/89a987b4-8165-4a6b-8f20-be26ac6ffa64" />

<img width="931" height="524" alt="image" src="https://github.com/user-attachments/assets/844bd823-d138-484d-a724-aaa36d39e08f" />

## Plan de Análisis

Se realizarán dos modelos para cada proceso constituyente, usando modelos de regresión logística:

Para el Plebiscito 2022:

logit(Pleb_2022(Y=1))=β0​+β1​(educación)+β2​(sexo)+β3​(edad)+β4​(tendencia)+β5(zona)+β

Para el Plebiscito 2023:

logit(Pleb_2023(Y=1))=β0​+β1​(educación)+β2​(sexo)+β3​(edad)+β4​(tendencia)+β5(zona)+β

Así buscamos saber como el nivel educacional en promedio tiene algún efecto significativo en la posibilidad de que una comuna haya votado "Apruebo" en el 2022 o "A Favor" en el 2023
