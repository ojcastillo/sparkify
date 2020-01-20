# sparkify

ML model constructed with Spark that predicts user churn in a fictional music platform

## Initial Setup

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

You could also choose to download the large 12GB dataset, but at that point is recommended to use a distributed Spark cluster before trying to run any Spark logic on it:

```bash
sh download_datasets.sh --large
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgements

The datasets used by this project are freely provided by [Udacity](https://www.udacity.com/)
