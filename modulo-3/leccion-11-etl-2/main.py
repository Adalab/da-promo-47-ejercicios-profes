
# %%
import pandas as pd
import soporte as sp

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
