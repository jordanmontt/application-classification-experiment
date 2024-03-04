
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import seaborn as sns
import numpy as np


def plot_relative_frequencies_histogram(title, df_100, df_50, df_1):
    fig, axs = plt.subplots(ncols=3)
    a_title = "Lifetime frequencies for " + title
    fig.suptitle(a_title, fontsize=16)

    sns.histplot(df_100['relativeLifetime'] , stat="percent", bins=20, ax=axs[0]).set(xlabel='Execution time', title='100% sampling', ylim=(0, 100))
    sns.histplot(df_50['relativeLifetime'] , stat="percent", bins=20, ax=axs[1]).set(xlabel='Execution time', title='50% sampling', ylim=(0, 100))
    plot = sns.histplot(df_1['relativeLifetime'] , stat="percent", bins=20, ax=axs[2]).set(xlabel='Execution time', title='1% sampling', ylim=(0, 100))

    plt.tight_layout()
    plt.show()


### By class 

def plot_lifetime_frequencies_by_class(top_allocated_classes, df_100, df_50, df_1):
    ncols = 3
    fig, axs = plt.subplots(5, ncols, figsize=(5, 7))
    axs[0, 0].set_title("Sampling 100%")
    axs[0, 1].set_title("Sampling 50%")
    axs[0, 2].set_title("Sampling 1%")

    for idx, top_allocated_class in enumerate(top_allocated_classes):
        plot_for_top_allocated_class(df_100, top_allocated_class, axs[idx, 0], (1 + ncols * idx))
        plot_for_top_allocated_class(df_50, top_allocated_class, axs[idx, 1], (2 + ncols * idx))
        plot_for_top_allocated_class(df_1, top_allocated_class, axs[idx, 2], (3 + ncols * idx))
        axs[idx, 0].set_ylabel(top_allocated_class, fontsize=12)

    plt.tight_layout()
    plt.show()

def plot_for_top_allocated_class(a_df, top_allocated_class, an_axs, grid_position):
    filtered_df = a_df.loc[ a_df['allocatedObjectClass'] == top_allocated_class ]

    plt.subplot(5, 3, grid_position)
    ax = sns.histplot(filtered_df['relativeLifetime'] , stat="percent", bins=6)
    ax.set(ylabel="", xlabel="") # ylim=(0, 100)