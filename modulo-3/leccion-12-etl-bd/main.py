
# %%
import pandas as pd
from src import soporte as sp
from src import soporte_bd as sp_bd
from src import queries_bd as queries


# %%
df_clientes = pd.read_csv('./files/clientes.csv')
df_ventas = pd.read_csv('./files/ventas.csv')
# %%
## Exploracion de datos
sp.explore_data(df_clientes)
sp.explore_data(df_ventas)

# %%
## Transformacion de los datos
sp.clean_data(df_clientes)
sp.clean_data(df_ventas)
# %%


# %%
## Crear la base de datos
sp_bd.crear_db()



# %%
## Crear las tablas
sp_bd.ejecutar_query(queries.crear_bd)

# %%
## para la crear la tabla de clientes
sp_bd.ejecutar_query(queries.crear_tabla_clientes)

# %%
## para la crear la tabla de ventas
sp_bd.ejecutar_query(queries.crear_tabla_ventas)

# %%
## convertir el df en una lista de tuplas
list_clientes = list(set(zip(df_clientes["first_name"], df_clientes["last_name"], df_clientes["email"], df_clientes["gender"], df_clientes["City"], df_clientes["Country"], df_clientes["Address"])))

## convertir valores en float

# %%
## insertar los datos en la tabla de clientes
sp_bd.insertar_valores(queries.query_insertar_clientes, list_clientes)

# %%
