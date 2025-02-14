import pandas as pd


def explore_data(df):
    print("Explorando el dataset")
    print(df.head())
    print(df.info())
    print(df.describe())
    print(df.columns) 


def clean_data (df):
    print("Limpiando el dataset")
    print(df.isnull().sum())
    print(df.dropna())
    print(df.drop_duplicates())
    print(df.drop_duplicates().shape)