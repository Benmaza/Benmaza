import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

df_train = open("train.csv", "r")
df_train = pd.read_csv(df_train)
print(df_train.head(5))

print(df_train.shape)





