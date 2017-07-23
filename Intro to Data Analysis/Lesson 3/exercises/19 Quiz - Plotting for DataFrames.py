import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

values = np.array([1, 3, 2, 4, 1, 6, 4])
example_df = pd.DataFrame({
                          'value': values,
                          'even': values % 2 == 0,
                          'above_three': values > 3
                          }, index=['a', 'b', 'c', 'd', 'e', 'f', 'g'])

# Change False to True for this block of code to see what it does

# groupby() without as_index
if False:
    first_even = example_df.groupby('even').first()
    print first_even
    print first_even['even'] # Causes an error. 'even' is no longer a column in the DataFrame

# groupby() with as_index=False
if False:
    first_even = example_df.groupby('even', as_index=False).first()
    print first_even
    print first_even['even'] # Now 'even' is still a column in the DataFrame

filename = '/datasets/ud170/subway/nyc_subway_weather.csv'
subway_df = pd.read_csv(filename)

## Make a plot of your choice here showing something interesting about the subway data.
## Matplotlib documentation here: http://matplotlib.org/api/pyplot_api.html
## Once you've got something you're happy with, share it on the forums!

# get latitude and longitude of each station
subway_df_station_location = subway_df.groupby('station').first()[['latitude', 'longitude']]

# get total entries per station
subway_df_station_entries = subway_df.groupby('station').sum()['ENTRIESn_hourly']

# create a new DataFrame with only the information we want
subway_df_station_new = pd.concat([subway_df_station_location, subway_df_station_entries], axis=1)

# rename 'ENTRIESn_hourly' to 'entries'
subway_df_station_new.rename(columns={'ENTRIESn_hourly':'entries'}, inplace=True)

# graph scatterplot
plt.scatter(subway_df_station_new['latitude'], subway_df_station_new['longitude'],
            s = subway_df_station_new['entries']/subway_df_station_new['entries'].std())
plt.show()
