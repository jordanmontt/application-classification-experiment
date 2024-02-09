import json
import pandas as pd
import matplotlib.pyplot as plt
from tabulate import tabulate

# CONSTANTS
LIFETIME_X_LABEL = 'Lifetime in seconds'
FULL_GCS_X_LABEL = 'Lifetime in survived GC cycles'

#Functions

# HELPERS

def get_xlabel_for_criterion(criterion):
    if(criterion == 'survivedFullGC'):
        return FULL_GCS_X_LABEL
    else:
        return LIFETIME_X_LABEL

def get_top_allocated_classes(a_dataframe):
    # Returns a list with the classes that were allocated the most.
    # To be a top allocator the class has to have at least 1% of the total allocations
    counts = a_dataframe['allocatedObjectClass'].value_counts()
    percs = a_dataframe['allocatedObjectClass'].value_counts(normalize=True)
    # Get classes that were allocated and that represent at least 1% of the total allocations (calculating by number of allocations)
    counts_and_percs = pd.concat([counts, percs], axis=1, keys=['count', 'percentage'])
    top_allocated = counts_and_percs[ counts_and_percs['percentage'] >= 0.01 ]
    #convert to a list
    return top_allocated.axes[0].tolist()

def filter_by_top_allocated(a_df):
    top_allocated_classes = get_top_allocated_classes(a_df)
    
    dataframes = list()
    for i, object_class in enumerate(top_allocated_classes):
        dataframes.append(a_df[ a_df['allocatedObjectClass'] == object_class ])
    return top_allocated_classes, dataframes

# PLOTTING

def plot_densities_by_class(df, title, criterion, xlabel, logy=False):
    top_allocated_classes, dataframes = filter_by_top_allocated(df)

    fig, ax = plt.subplots(1,1)
    for a_df in dataframes:
        a_df[criterion].plot(kind='density', logy=logy)
    
    fig.suptitle(title)
    fig.supxlabel(xlabel)
    fig.legend(top_allocated_classes)
    return fig

def plot_accumulated_density(df, title, criterion, logy, xlabel):
    return df[criterion].plot(kind='density', logy=logy, title=title, xlabel=xlabel)

def plot_accumulated_density_by_lifetime(df, title, logy=False):
    if(logy):
        title = title , ' (logY)'
    return plot_accumulated_density(df, title, 'lifetime', logy, LIFETIME_X_LABEL)

def plot_accumulated_density_by_gcs(df, title, logy=False,):
    if(logy):
        title = title , ' (logY)'
    return plot_accumulated_density(df, title, 'survivedFullGC', logy, FULL_GCS_X_LABEL)

def plot_accumulated_density_comparison(df1, df2, criterion, logy=False):
    title = 'Object''s lifetime density'
    if(logy):
        title = title , ' (logY)'

    fig, ax = plt.subplots(1,1)
    df1[criterion].plot(kind='density', logy=logy)
    df2[criterion].plot(kind='density', logy=logy)
    fig.supxlabel(get_xlabel_for_criterion(criterion))
    fig.suptitle(title)
    fig.legend(['100% sampling', '1% sampling'])

# DATAFRAME

def load_df(df_path, metadata_path):
    # Load df
    a_df = pd.read_csv(df_path)
    # Load metadata
    f = open(metadata_path)
    meta_data_of_df = json.load(f)
    f.close()
    meta_data_of_df['totalExecutionTime'] = meta_data_of_df['totalExecutionTime'] / 1000000 # to convert to seconds
    # Add relative survived gc cycles
    a_df['relativeSurvivedGCCycles'] = a_df['survivedFullGC'].transform((lambda x : x / meta_data_of_df['totalFullGCs'] * 100 if x <= meta_data_of_df['totalFullGCs'] else 100) )
    # Add relative lifetime in seconds
    a_df['relativeLifetime'] = (a_df['finalizationTime'] - a_df['initializationTime']) / 1000000 # to convert to seconds
    a_df['relativeLifetime'] = a_df['relativeLifetime'].transform((lambda x : x / meta_data_of_df['totalExecutionTime'] * 100 if x <= meta_data_of_df['totalExecutionTime'] else 100) )

    return a_df, meta_data_of_df

def print_table_allocations_average_lifetimes(df_title, a_df, metadata_df):
    print(df_title.upper())
    print()

    top_allocated_classes, filtered_dfs = filter_by_top_allocated(a_df)
    total_instances = len(a_df.index)
    total_execution_time = metadata_df['totalExecutionTime']
    total_full_gcs = metadata_df['totalFullGCs']

    print('Sampling rate:', str(metadata_df['sampligRate']))
    print('Total instances: ', str(total_instances))
    print('Total execution time:', str(total_execution_time))
    print('Total full GCs: ', str(total_full_gcs))
    print('----------')

    my_list = []
    headers = ['Allocated object class', 'Instances', 'Avg lifetime', 'Avg GC cycles']
    for a_df in filtered_dfs:
        relative_instances = (len(a_df.index) / total_instances) * 100
        relative_full_gcs = (a_df['survivedFullGC'].mean() / total_full_gcs) * 100
        relative_lifetime = (a_df['lifetime'].mean() / total_execution_time) * 100

        relative_instances = str(round(relative_instances, 2)) + '%'
        relative_lifetime = str(round(relative_lifetime, 2)) + '%'
        relative_full_gcs = str(round(relative_full_gcs, 2)) + '%'

        my_list.append([a_df.iloc[0]['allocatedObjectClass'], relative_instances, relative_lifetime, relative_full_gcs])
    
    print(tabulate(my_list, headers=headers))
    print()