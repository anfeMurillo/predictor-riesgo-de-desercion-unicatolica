.. Modelos predictivos de desercion universitaria Unicatolica documentation master file, created by
   sphinx-quickstart on Sat Jul 26 19:39:59 2025.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Modelos Predictivos de Deserción
##########################################################

**Estado:** En producción

.. image:: _static/images/logo_unicatolica.png
   :alt: Logo del proyecto
   :align: center
   :width: 300px

1. Resumen del projecto y Problema de Negocio
=============================================

La universidad enfrenta actualmente una alta tasa de deserción estudiantil, particularmente en los programas académicos del área de ingenierías. Esta situación representa un desafío significativo tanto en términos de calidad educativa como de eficiencia institucional.

En respuesta a esta problemática, el presente proyecto tiene como objetivo principal el desarrollo de modelos predictivos que permitan identificar con anticipación a los estudiantes en riesgo de abandono. Estos modelos estarán orientados a su aplicación en el entorno académico de la universidad, con el fin de apoyar la toma de decisiones institucionales, fortalecer los mecanismos de acompañamiento y diseñar estrategias de intervención temprana basadas en evidencia.

A continuación, se presenta la Tabla 01, que detalla los datos oficiales de deserción del Sistema 
para la Prevención de la Deserción en las Instituciones de Educación Superior - SPADIES, para el 
periodo 2010 - 2022, tal como son reportados y consolidados por las instancias nacionales. Esta 
información es crucial para identificar patrones, determinar los periodos académicos de mayor 
riesgo y orientar las intervenciones preventivas y los programas de apoyo a los estudiantes.

Tabla de desercion del SPADIES
------------------------------

+--------+------------+
|   Año  |  Decersion |
+========+============+
| 2018   |    10.40 % |
+--------+------------+
| 2019   |    09.90 % |
+--------+------------+
| 2020   |    09.50 % |
+--------+------------+
| 2021   |    17.50 % |
+--------+------------+
| 2022   |    10.10 % |
+--------+------------+

.. note::
   Estos son los unicos datos publicos existentes del porcentaje de decersión en **general** de la FUNDACION UNIVERSITARIA CATOLICA LUMEN GENTIUM. Se espera añadir los mas actuales al momento que la universidad los proporcione.

Hipotesis
---------

La deserción estudiantil está significativamente asociada con una combinación de factores académicos, socioeconómicos, individuales e institucionales, siendo el bajo rendimiento académico y las condiciones socioeconómicas desfavorables los principales predictores del abandono, especialmente cuando se presentan conjuntamente.

Desde la perspectiva de ciencia de datos, esta hipótesis implica que variables como el promedio académico, los resultados en exámenes de ingreso, el nivel de ingresos del hogar, el nivel educativo de los padres, el tipo de apoyo institucional recibido y características personales del estudiante (como edad o estado civil) tendrán una relación estadísticamente significativa con la variable objetivo: la deserción (sí/no).

Se espera que los modelos predictivos (como regresiones logísticas, árboles de decisión o modelos basados en aprendizaje automático) muestren una mayor tasa de deserción en estudiantes que presentan múltiples condiciones de riesgo, lo cual confirmaría la hipótesis de interacción entre factores.

2. Objetivos y Alcance
======================

Objetivos
---------

**Objetivo de Negocio**
   
Detectar a tiempo a un o una posible desertora para tomar medidas a tiempo.

**Objetivo Tecnico**

Crear modelos entrenados que puedan ser ejecutados en una futura implementacion dentro de un programa con interface grafica. 

Entregable
----------

   1. Documentacion del proceso para la creacion del proyecto.
   2. Scripts de SQL para transformar la informacion y entregala a los modelos.
   3. Ejecutables de los modelos entrenados.

Alcance
-------

Dentro del alcance
~~~~~~~~~~~~~~~~~~

Este proyecto se enfocará exclusivamente en el análisis de la deserción estudiantil en los programas de ingeniería ofrecidos por la universidad, considerando datos académicos, socioeconómicos, individuales e institucionales disponibles en los sistemas de información institucional.

El alcance comprende las siguientes actividades:

Recolección, limpieza y transformación de datos relevantes sobre estudiantes activos y desertores.

Análisis exploratorio de datos para identificar patrones y relaciones significativas.

Selección y entrenamiento de modelos predictivos (como regresión logística, árboles de decisión, random forest, entre otros).

Evaluación del desempeño de los modelos mediante métricas como precisión, recall, F1-score y área bajo la curva (AUC-ROC).

Generación de visualizaciones y reportes interpretables para los responsables académicos.

Recomendaciones para la implementación de sistemas de alerta temprana que permitan intervenir de manera oportuna.


Fuera del alcance
~~~~~~~~~~~~~~~~~

El proyecto no contempla la implementación directa de las estrategias de intervención ni el análisis de programas académicos fuera o dentro del área de ingeniería.

3. Audiencia y Partes Interesadas
==============================

Audiencia principal
-------------------

   1. Científicos/as de Datos.
   2. Ingenieros/as de ML.
   3. Desarrolladores/as de Software.

Stakeholders Clave
-------------------

   1. Director/a de la facultad de ingenieria en sistemas.
   2. Decano/a de la facultad de ingenieria.
   3. Docente del semillero Ciencia de Datos y ML. 


.. toctree::
   :maxdepth: 2
   :caption: Contents:

4. Estructura del repositorio
==========================

📂 predictor-riesgo-desercion
------------------------------

Carpeta principal del proyecto creada apartir de mi template de Cookiecutter 🍪.

::

   cookiecutter https://github.com/anfeMurillo/data_science_template.git

.. note::
   Posterirmente tuvo algunas modificaciones para temas de documentacion.

📁 data
~~~~~~~~

Carpeta donde se almacenas los datos a ser utilizados.


📁 docs
^^^^^^^^

Carpeta donde se guardan los archivos de documentacion de la base de datos utilizada. 

En este proyecto se utilizo el servicio de `DBdocs.io <https://dbdocs.io/>`_ para documentar la base de datos.

Se debe utilizar un archivo con extencion **.dbml**, en mi caso genere un archivo **.sql** de los esquemas de las tablas y los transforme con la siguiente libreria.


📁 processed
^^^^^^^^^^^^^

Carpeta donde se guardan los archivos una vez procesados para su utilizacion.

.. note::
   Por cuestiones de privacidad no encontraras archivos que contengan datos de los estudiantes de esta universidad. 
   Pero puedes replicarlo creando un data set desde una base de dato con el formato esperado.


📁 raw
^^^^^^^

Carpeta donde se colocan los datos originales para ser procesados.

.. note::
   1. Se deben colocar los datos en una base de datos para posterioremente conectarse a ella, para la creacion de este proyecto se utilizo PostgreSQL.
   2. Importante no usar la base de datos que esta en produccion, recomiendo usar una copia.


📁 docs
^^^^^^^^

Carpeta generada con Sphinx para la creacion de esta documentacion.