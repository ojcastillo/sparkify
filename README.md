# Sparkify Churn Prediction

> *This project was completed to satisfy the requirements of the [Data Scientist Nanodegree](https://www.udacity.com/course/data-scientist-nanodegree--nd025) and is meant to be educational in nature.*

**Link to blog posts: [Part 1](https://medium.com/@jcm.orlando/predicting-user-churn-with-pyspark-part-1-f13befbf04c3)**

Sparkify is a fictional service similar to [Spotify](https://en.wikipedia.org/wiki/Spotify). At a high level, users can come and play
songs from a large pool of artists either as a guest or as a logged-in user. They can also decide to pay for the service for more
benefits. They're also free to unsubscribe from the service at any time.

[Udacity's](https://www.udacity.com/) is graciously providing both a medium (128MB) and large (12GB) dataset with artificial user activity
events to play with. For example, a row might represent the action of a particular user playing a song from the artist "Metallica". We
want to use this dataset to try to predict if an user will churn in the near future (in this case, unsubscribe from the service).

Predicting churn is a challenging and common problem that data scientists and analysts regularly encounter in any customer-facing business. Additionally, the ability to efficiently manipulate large datasets with Spark is one of the highest-demand skills in the field of data.

This work shows how [pyspark](https://pypi.org/project/pyspark/) can be used to craft a machine learning model for predicting user churn.
The work also shows how the the medium sized dataset can be used just so the features needed can be crafted and to gain confidence in the
supervised learning model using a local machine, but results from running the training and evaluation pipeline on the large dataset using
[AWS EMR](https://aws.amazon.com/emr/) are shared as well.

### Results

A Supervised Machine Learning model was successfully crafted to predict user churn from the following features extracted:

- `number_sessions`: Total amount of sessions
- `seconds_since_genesis`: Total amount of seconds since first appearance
- `avg_actions_per_session`: Average amount of actions per session
- `avg_seconds_per_session`: Average amount seconds spent per session

The results from training and validating the model using the large dataset were encouraging: it achieved an accuracy of 0.80
and an F1-score of 0.47.

As a good next step, it might be worth going back to the feature engineering phase. Maybe is possible to extract more info 
from the pages visited by the user before churning, or maybe the fact that the user paid or not for the service is also a 
strong indicator. 

## What's on this repository?

- [sparkify_notebook.ipynb](./sparkify_notebook.ipynb): Jupyter notebook that contains all the outcome of the analysis, including the
python (powered by pyspark) logic to reproduce them.
- [init_workspace.sh](init_workspace.sh): Helper script that initializes a conda environment with dependencies.
- [download_datasets.sh](download_datasets.sh): Helper script that downloads the datasets for analysis from Udacity's public S3 bucket.

## Local Setup

### Installing Dependencies

You can find all the Python dependencies in the `requirements.txt` file. It is recommended to use a `conda` managed environment.

Running the following command will set up a `conda` environment automatically, assuming `conda` is installed
([instructions](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)).

```bash
. init_workspace.sh
```

### Downloading Datasets

Use the following command to download the small 128MB version of the sample data:

```bash
sh download_datasets.sh
```

You could also choose to download the large 12GB dataset, but at that point is recommended to use a distributed Spark cluster 
before trying to run any Spark logic on it:

```bash
sh download_datasets.sh --large
```

## Running on AWS

Refer to [this instructions](./aws_setup.md) for steps required to upload the notebook into your personal AWS account and running it with
the help of an EMR cluster.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgements

The datasets used by this project are freely provided by [Udacity](https://www.udacity.com/)
