import pandas as pd

df = pd.DataFrame ()
df['Nombre'] = ['Juan', 'Pedro', 'Maria', 'Jose', 'Luis']
df['Edad'] = [20, 25, 30, 35, 40]
df['Pais'] = ['Mexico', 'Colombia', 'Argentina', 'Chile', 'Peru']
df['Pais'].astype('category') #para convertir a categorias
df['nacimiento'] = ['4/4/1990', '5/5/1995', '6/6/2000', '7/7/2005', '8/8/2010'] 
df['nacimiento'] = pd.to_datetime(df['nacimiento'])
df['nacimiento'].head()
df['fyear'] = df['nacimiento'].dt.year
df['fmonth'] = df['nacimiento'].dt.month
df['fday'] = df['nacimiento'].dt.day
# print(df['nacimiento'].head())
# print (df)

print(pd.to_datetime('today').year - df['fyear'])

#para cambiar el index y poner en orden por fecha

df=df.reset_index().set_index('nacimiento').sort_index() 
print(df)




