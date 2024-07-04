# Evaluating Finalization-Based Object Lifetime Profiling

In this repository there are the files to execute the experiments for the Evaluating Finalization-Based Object Lifetime Profiling paper. We use [ReBench](https://rebench.readthedocs.io/en/latest/) to orchestate the execution. It has 5 applications to benchmark: [HoneyGinger](https://github.com/tomooda/HoneyGinger), [DataFrame](https://github.com/PolyMathOrg/DataFrame), [Re:Mobidyck](https://github.com/ReMobidyc/ReMobidyc), [Bloc](https://github.com/pharo-graphics/bloc), and [Moose](https://github.com/moosetechnology)

## How to install

To execute the experiments we will need to:

1. Generate the synthtic dataset be executing the file `datasets/synthetic/DatasetGenerator.py`
2. Then, you need to generate 1 image per benchmark, so you will need 5 Pharo 13 images. Each benchmark has a baseline, so for installing it just install the baseline. Attention: for the Moose benchmark you need to download a moose pre-built image. You can do it from [here](https://github.com/moosetechnology/Moose/actions).
4. Put the generated dataset in the image folder of the DataFrame benchmark (this step is only for the DataFrame).
3. Then, execute the ReBench scripts.

Pay attention, it is important to have one image per benchmark because the ReBench files are scripted like that. If you want, you can install several benchmarks on the same image (to not have 5 images), but you will need to change the ReBench scripts (super eacy to do so no worries).

About naming the images: check the ReBench files and name your images with the same name. You need to have the same name for the images as the ones that are on the ReBench files.

## About the ReBench files


There are 3 configuration ReBench files:

- `baseline-execution.conf` executes the baseline application. That means that it executes the applications without the profiler.
- `illimani-benchmark.conf` executes the experiments for the Illimani profiler with and without the pretenuring optimization.
- `actionable-profiler.conf` executes the actionable profiler experiments. We keep a reference to the allocated instances.

These 3 files use the same 5 images that you already installed.

## About the no pretenuring experiments
ATTENTION: You will see that for the NoPretenuring suites there are other images. Yes, This is because I do not want to have the no pretenuring code in the production code of Illimani. So, what you need to do is to copy the 5 files and modify manually the Ephemeron allocation to allocate the ephemerons with `new` and not `newTenured`.

## About Python

About the Python files: there are just files that I creating to plot the results, so they are not mandatory to understand nor to look.