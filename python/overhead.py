
def print_overheads(df, criterion, criterion_baseline, withBaseline=True, the_baseline_mean=0):

    # Profiler mean values
    df_01 = df[ (df['suite'] == criterion) & (df['inputSize'] == '1/1000') & (df['criterion'] == 'total') ]
    df_mean_01 = df_01['value'].mean()
    df_std_01 = df_01['value'].std()

    df_1_df = df[ (df['suite'] == criterion) & (df['inputSize'] == '1/100') & (df['criterion'] == 'total') ]
    df_mean_1 = df_1_df['value'].mean()
    df_std_1 = df_1_df['value'].std()

    df_50_df = df[ (df['suite'] == criterion) & (df['inputSize'] == '1/2') & (df['criterion'] == 'total') ]
    df_mean_50 = df_50_df['value'].mean()
    df_std_50 = df_50_df['value'].std()

    df_100_df = df[ (df['suite'] == criterion) & (df['inputSize'] == '1') & (df['criterion'] == 'total') ]
    df_mean_100 = df_100_df['value'].mean()
    df_std_100 = df_100_df['value'].std()

    # baseline
    if withBaseline:
        baseline_hg = df[ (df['suite'] == criterion_baseline) & (df['criterion'] == 'total') ]
        baseline_mean = baseline_hg['value'].mean()
    else:
        baseline_mean = the_baseline_mean

    # overhead using mean
    print()
    print('Overhead for 1/1000: ', str(df_mean_01 / baseline_mean), ' std: ', str(df_std_01 / baseline_mean))
    print('Overhead for 1/100: ', str(df_mean_1  / baseline_mean), ' std: ', str(df_std_1 / baseline_mean))
    print('Overhead for 1/2: ', str(df_mean_50  / baseline_mean), ' std: ', str(df_std_50 / baseline_mean))
    print('Overhead for 1: ',  str(df_mean_100  / baseline_mean), ' std: ', str(df_std_100 / baseline_mean))

    return baseline_mean
