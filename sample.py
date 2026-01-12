import pandas as pd

path = 'data/raw/release/state=MARYLAND/county_name=BALTIMORE%20CITY/part-0.parquet'

df = pd.read_parquet(path)
print(df.head())
print(df.info())
print(df.shape)
print(df[["party", "party_detailed"]].drop_duplicates().sort_values("party"))