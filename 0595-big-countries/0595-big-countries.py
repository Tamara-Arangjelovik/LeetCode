import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:

    big_countries_df = world[(world['area'] >= 3000000) | (world['population'] >= 25000000)]


    result_df = big_countries_df[['name', 'population', 'area']]

    return result_df
    