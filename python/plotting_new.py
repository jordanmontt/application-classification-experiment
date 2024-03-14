
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import seaborn as sns
import numpy as np

# Overall frequencies

def plot_relative_frequencies_histogram(title, df_100, df_50, df_1, df_01):
    fig, axs = plt.subplots(ncols=4)
    a_title = "Lifetime frequencies for " + title
    fig.suptitle(a_title, fontsize=16)

    sns.histplot(df_100['relativeLifetime'] , stat="percent", bins=20, ax=axs[0]).set(xlabel='Execution time', title='Sampling 100%', ylim=(0, 100))
    sns.histplot(df_50['relativeLifetime'] , stat="percent", bins=20, ax=axs[1]).set(xlabel='Execution time', title='Sampling 50%', ylim=(0, 100))
    sns.histplot(df_1['relativeLifetime'] , stat="percent", bins=20, ax=axs[2]).set(xlabel='Execution time', title='Sampling 1%', ylim=(0, 100))
    sns.histplot(df_01['relativeLifetime'], stat="percent", bins=20, ax=axs[3]).set(xlabel='Execution time', title='Sampling 0.1%', ylim=(0, 100))

    plt.tight_layout()
    plt.show()

def plot_overall_frequency(a_df, axs):
    ax = sns.histplot(a_df['relativeLifetime'] , stat="percent", bins=20, ax=axs)
    ax.set(xlabel='Execution time', ylim=(0, 100), xlim=(-5, 105))

def plot_relative_frequencies_histogram_comparison(df_100, df_50, df_1, df_01, df_100_a, df_50_a, df_1_a, df_01_a):
    fig, axs = plt.subplots(ncols=4, nrows=2)
    a_title = "Overall lifetime frequencies comparison"
    fig.suptitle(a_title, fontsize=16)

    axs[0, 0].set_title("Sampling 100%")
    axs[0, 1].set_title("Sampling 50%")
    axs[0, 2].set_title("Sampling 1%")
    axs[0, 3].set_title("Sampling 0.1%")

    plot_overall_frequency(df_100, axs[0, 0])
    plot_overall_frequency(df_50, axs[0, 1])
    plot_overall_frequency(df_1, axs[0, 2])
    plot_overall_frequency(df_01, axs[0, 3])
    axs[0, 0].set_ylabel('Baseline profiler', fontsize=12)

    plot_overall_frequency(df_100_a, axs[1, 0])
    plot_overall_frequency(df_50_a, axs[1, 1])
    plot_overall_frequency(df_1_a, axs[1, 2])
    plot_overall_frequency(df_01_a, axs[1, 3])
    axs[1, 0].set_ylabel('Actionable profiler', fontsize=12)

    plt.tight_layout()
    plt.show()

### By class

def plot_lifetime_frequencies_by_class(df_100, df_50, df_1, df_01, top_allocated_classes, title, with_class_labels=True):
    ncols = 4
    fig, axs = plt.subplots(5, ncols, figsize=(9, 9))
    fig.suptitle(title, fontsize=16)
    axs[0, 0].set_title("Sampling 100%")
    axs[0, 1].set_title("Sampling 50%")
    axs[0, 2].set_title("Sampling 1%")
    axs[0, 3].set_title("Sampling 0.1%")

    # First class
    plot_for_top_allocated_class(df_100, top_allocated_classes[0], axs[0, 0], bins=2)
    plot_for_top_allocated_class(df_50, top_allocated_classes[0], axs[0, 1], bins= 3)
    plot_for_top_allocated_class(df_1, top_allocated_classes[0], axs[0, 2], bins=3)
    plot_for_top_allocated_class(df_01, top_allocated_classes[0], axs[0, 3], bins=1)
    if with_class_labels:
        axs[0, 0].set_ylabel(top_allocated_classes[0], fontsize=12)
    
    # Second class
    plot_for_top_allocated_class(df_100, top_allocated_classes[1], axs[1, 0], bins=2)
    plot_for_top_allocated_class(df_50, top_allocated_classes[1], axs[1, 1], bins=3)
    plot_for_top_allocated_class(df_1, top_allocated_classes[1], axs[1, 2], bins=5)
    plot_for_top_allocated_class(df_01, top_allocated_classes[1], axs[1, 3], bins=1)
    if with_class_labels:
        axs[1, 0].set_ylabel(top_allocated_classes[1], fontsize=12)

    # Third class
    plot_for_top_allocated_class(df_100, top_allocated_classes[2], axs[2, 0], bins=1)
    plot_for_top_allocated_class(df_50, top_allocated_classes[2], axs[2, 1], bins=1)
    plot_for_top_allocated_class(df_1, top_allocated_classes[2], axs[2, 2], bins=1)
    plot_for_top_allocated_class(df_01, top_allocated_classes[2], axs[2, 3], bins=1)
    if with_class_labels:
        axs[2, 0].set_ylabel(top_allocated_classes[2], fontsize=12)

    # Fourth class
    plot_for_top_allocated_class(df_100, top_allocated_classes[3], axs[3, 0], bins=4)
    plot_for_top_allocated_class(df_50, top_allocated_classes[3], axs[3, 1], bins=4)
    plot_for_top_allocated_class(df_1, top_allocated_classes[3], axs[3, 2])
    plot_for_top_allocated_class(df_01, top_allocated_classes[3], axs[3, 3])
    if with_class_labels:
        axs[3, 0].set_ylabel(top_allocated_classes[3], fontsize=12)

    # Fifth class
    plot_for_top_allocated_class(df_100, top_allocated_classes[4], axs[4, 0], bins=4)
    plot_for_top_allocated_class(df_50, top_allocated_classes[4], axs[4, 1], bins=4)
    plot_for_top_allocated_class(df_1, top_allocated_classes[4], axs[4, 2], bins=4)
    plot_for_top_allocated_class(df_01, top_allocated_classes[4], axs[4, 3], bins=4)
    if with_class_labels:
        axs[4, 0].set_ylabel(top_allocated_classes[4], fontsize=12)

    plt.tight_layout()
    plt.show()

def plot_lifetime_frequencies_by_class_actionable(df_100, df_50, df_1, df_01, top_allocated_classes, title):
    ncols = 4
    fig, axs = plt.subplots(5, ncols, figsize=(9, 9))
    fig.suptitle(title, fontsize=16)
    axs[0, 0].set_title("Sampling 100%")
    axs[0, 1].set_title("Sampling 50%")
    axs[0, 2].set_title("Sampling 1%")
    axs[0, 3].set_title("Sampling 0.1%")

    for idx, top_allocated_class in enumerate(top_allocated_classes):
        plot_for_top_allocated_class(df_100, top_allocated_class, axs[idx, 0])
        plot_for_top_allocated_class(df_50, top_allocated_class, axs[idx, 1])
        plot_for_top_allocated_class(df_1, top_allocated_class, axs[idx, 2])
        plot_for_top_allocated_class(df_01, top_allocated_class, axs[idx, 3])

    plt.tight_layout()
    plt.show()

def plot_for_top_allocated_class(a_df, top_allocated_class, an_axs, bins=3):
    filtered_df = a_df.loc[ a_df['allocatedObjectClass'] == top_allocated_class ]

    #plt.subplot(5, 3, grid_position)
    ax = sns.histplot(filtered_df['relativeLifetime'] , stat="percent", bins=bins, ax=an_axs)
    ax.set(ylabel="", xlabel="", xlim=(-5, 105), ylim=(0, 100), xticks=[0, 50, 100])
