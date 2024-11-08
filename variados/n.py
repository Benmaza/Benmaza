data = [50,50,47,97,49,3,53,42,26,74,82,62,37,15,70,27,36,35,48,52,63,64]
print(data)

import numpy as np

grades = np.array(data)
print(grades)

print (type(data),'x 2:', data * 2)
print('---')
print (type(grades),'x 2:', grades * 2)

print (grades.shape)
print(grades[0])
print(grades.mean())

study_hours = [10.0,11.5,9.0,16.0,9.25,1.0,11.5,9.0,8.5,14.5,15.5,
               13.75,9.0,8.0,15.5,8.0,9.0,6.0,10.0,12.0,12.5,12.0]
student_data = np.array([study_hours, grades])
print (student_data)
print(student_data.shape)
#muestra el primer elemento de las dos columnas
print(student_data[0][0])
avg_study = student_data[0].mean()
avg_grade = student_data[1].mean()
print('Average study hours: {:.2f}\nAverage grade: {:.2f}'.format(avg_study, avg_grade))

import pandas as pd

df_students = pd.DataFrame({'Name': ['Dan', 'Joann', 'Pedro', 'Rosie', 'Ethan', 'Vicky', 'Frederic', 'Jimmie', 
                                     'Rhonda', 'Giovanni', 'Francesca', 'Rajab', 'Naiyana', 'Kian', 'Jenny',
                                     'Jakeem','Helena','Ismat','Anila','Skye','Daniel','Aisha'],
                            'StudyHours':student_data[0],
                            'Grade':student_data[1]})

print (df_students) 
print (df_students.loc[5])
print (df_students.loc[0:5])
print (df_students.iloc[0:5])
print (df_students.iloc[0,[1,2]])
print (df_students.loc[0,'Grade'])
print (df_students.loc[df_students['Name']=='Aisha'])
print (df_students.query('Name=="Aisha"'))
df_students[df_students.Name == 'Aisha']
import wget
wget https://raw.githubusercontent.com/MicrosoftDocs/mslearn-introduction-to-machine-learning/main/Data/ml-basics/grades.csv
df_students = pd.read_csv('grades.csv',delimiter=',',header='infer')
df_students.head()