import json
import pandas as pd
from tabulate import tabulate


def get_top_allocated_classes(a_dataframe):
    # Returns a list with the classes that were allocated the most.
    # To be a top allocator the class has to have at least 1% of the total allocations
    counts = a_dataframe['allocatedObjectClass'].value_counts()
    percs = a_dataframe['allocatedObjectClass'].value_counts(normalize=True)
    # Get classes that were allocated and that represent at least 1% of the total allocations (calculating by number of allocations)
    counts_and_percs = pd.concat([counts, percs], axis=1, keys=['count', 'percentage'])
    top_allocated = counts_and_percs[ counts_and_percs['percentage'] >= 0.001 ]
    #convert to a list
    return top_allocated.axes[0].tolist()

def filter_by_top_allocated(a_df):
    top_allocated_classes = get_top_allocated_classes(a_df)
    
    dataframes = list()
    for i, object_class in enumerate(top_allocated_classes):
        dataframes.append(a_df[ a_df['allocatedObjectClass'] == object_class ])
    return top_allocated_classes, dataframes

# DATAFRAME

def load_df(base_path):
    csv_path = base_path + '.csv'
    metadata_path = base_path + '.json'

    a_df = pd.read_csv(csv_path)
    f = open(metadata_path)
    meta_data_of_df = json.load(f)
    f.close()

    meta_data_of_df['totalExecutionTime'] = meta_data_of_df['totalExecutionTime'] / 1000000 # to convert to seconds
    # Add relative survived gc cycles
    a_df['relativeSurvivedGCCycles'] = a_df['survivedFullGCs'].transform((lambda x : x / meta_data_of_df['totalFullGCs'] * 100 if x <= meta_data_of_df['totalFullGCs'] else 100) )
    # Add relative survived scavenges
    a_df['relativeSurvivedScavenges'] = a_df['survivedScavenges'].transform((lambda x : x / meta_data_of_df['totalScavenges'] * 100 if x <= meta_data_of_df['totalScavenges'] else 100) )
    # Add relative lifetime in seconds
    a_df['lifetime'] = (a_df['finalizationTimeInMicroSeconds'] - a_df['initializationTimeInMicroSeconds']) / 1000000 # to convert to seconds
    a_df['relativeLifetime'] = a_df['lifetime'].transform((lambda x : x / meta_data_of_df['totalExecutionTime'] * 100 if x <= meta_data_of_df['totalExecutionTime'] else 100) )

    return a_df, meta_data_of_df

def print_table_allocations_average_lifetimes(df_title, a_df, metadata_df):
    print(df_title.upper())
    print()

    top_allocated_classes, filtered_dfs = filter_by_top_allocated(a_df)
    total_instances = len(a_df.index)
    total_execution_time = metadata_df['totalExecutionTime']
    total_full_gcs = metadata_df['totalFullGCs']
    total_scavenges = metadata_df['totalScavenges']
    total_allocated_memory = a_df['sizeInBytes'].sum()

    print('Sampling rate:', str(metadata_df['sampligRate']))
    print('Total instances: ', str(total_instances))
    print('Total execution time:', str(total_execution_time))
    print('Total full GCs: ', str(total_full_gcs))
    print('Total scavenges: ', str(total_scavenges))
    print('Total allocated memory: ', str(total_allocated_memory / 1024 / 1024 / 1024), ' GiB') # in Bytes
    print('----------')

    my_list = []
    headers = ['Allocated object class', 'Instances', 'Avg lifetime', 'Avg GC cycles', 'Avg Scavenges', 'Allocated memory']
    for var_df in filtered_dfs:
        relative_instances = (len(var_df.index) / total_instances) * 100
        relative_full_gcs = var_df['relativeSurvivedGCCycles'].mean()
        relative_lifetime = var_df['relativeLifetime'].mean()
        relative_scavenges = var_df['relativeSurvivedScavenges'].mean()
        relative_allocated_memory = (var_df['sizeInBytes'].sum() / total_allocated_memory) * 100

        relative_instances = str(round(relative_instances, 2)) + '%'
        relative_lifetime = str(round(relative_lifetime, 2)) + '%'
        relative_full_gcs = str(round(relative_full_gcs, 2)) + '%'
        relative_scavenges = str(round(relative_scavenges, 2)) + '%'
        relative_allocated_memory = str(round(relative_allocated_memory, 2)) + '%'

        my_list.append([var_df.iloc[0]['allocatedObjectClass'], relative_instances, relative_lifetime, relative_full_gcs, relative_scavenges, relative_allocated_memory])
    
    print(tabulate(my_list, headers=headers))
    print()