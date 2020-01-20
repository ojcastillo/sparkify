# Running notebook on AWS

The [sparkify_notebook.ipynb](./sparkify_notebook.ipynb) should be able to be uploaded into an AWS account for execution with the help of a configured [EMR](https://aws.amazon.com/emr/) cluster. This is one way to scale up our Supervised Machine Learning model to work on the 12GB large dataset.

Follow these steps to get you started:

1. If you have an AWS account already, sign in. If not, visit [aws.amazon.com](https://aws.amazon.com/) and click on the
"Create an AWS Account" button
    - When you sign up, you will need to provide a credit card. But don’t worry, you won’t be charged for anything yet.
    - You will also need to choose a support plan. You can choose the free Basic Support Plan.
    - Once you finish signing up, wait a few minutes to receive your AWS account confirmation email. Then return to aws.amazon.com and sign in.
1. Follow the instructions below to launch your EMR cluster:
    - Go to the Amazon EMR Console
    - Select "Clusters" in the menu on the left, and click the "Create cluster" button
    - Configure your cluster with the following settings:
        - Release: emr-5.28.0 or later
        - Applications: Spark 2.4.4 or later
        - Instance type: m5.xlarge
        - Number of instance: 3
        - EC2 key pair: Proceed without an EC2 key pair or feel free to use one you created if you'd like
        - You can keep the remaining default settings and click "Create cluster" on the bottom right
            - If you enabled logging, then update the `EMR_DefaultRole` beforehand so it can has full access to the S3 bucket provided
    - Once you create the cluster, you'll see a status next to your cluster name that says "Starting". Wait a short time for this status to
    change to "Waiting" before moving on to the next step.
1. Now that you launched your cluster successfully, let's work on uploading the notebook for execution:
    - First create a new role that has both the `AmazonElasticMapReduceEditorsRole` and `AmazonS3FullAccess` policies attached. Let's
    assume the name of the role created is `EMR_Notebooks`.
    - Select "Notebooks" in the menu on the left, and click the "Create notebook" button
    - Configure your notebook:
        - Use the name `sparkify_notebook`. You could use a separate name, but it makes thing easier if you match the name of the file you're gonna be uploading.
        - Select "Choose an existing cluster" and choose the cluster you just created
        - Provide the role `EMR_Notebooks` in "AWS service role"
    - Wait for the Notebook to reach the "Ready" Status, then click on `Open in JupyterLab`
    - In the left panel, click the "Upload Files" icon on the top and select the [sparkify_notebook.ipynb](./sparkify_notebook.ipynb) file
    on this repo. If you used the same name then it will ask to overwrite, which you should confirm.
    - Open the file, then change the Kernel in the upper right to `PySpark`.
1. You should now be ready to run the notebook! **But be careful!** From this point on, AWS will charge you for running your EMR cluster. If you run your cluster for a day with the settings specified earlier (3 instances of m5.xlarge), you should expect costs to be around $18. So once you're done, you should terminate your cluster, delete the S3 buckets, and delete the notebook.



