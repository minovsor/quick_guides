
# filter dataframe keeping order (alternative to .isin)
target_column = codigo
target_values = [c1,c2]
df_selected = df.iloc[pd.Index(df[target_column]).get_indexer(target_values)]
