import pandas as pd


pd.Series(range(20,30))
my_series = pd.Series(range(20,25), index=['Primer dato','Segundo dato','Tercer dato','Cuarto dato','Quinto dato'])

dict = {'a':20 ,'b':30,'c':90}
pd.Series(dict)

my_series.iloc[0:3]