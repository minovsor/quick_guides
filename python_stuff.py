
# filter dataframe keeping order (alternative to .isin)
target_column = codigo
target_values = [c1,c2]
df_selected = df.iloc[pd.Index(df[target_column]).get_indexer(target_values)]

# oneline quicksort
quicks = lambda l: quicks([x for x in l[1:] if x <= l[0]]) + [l[0]] + quicks([x for x in l if x > l[0]]) if l else []
