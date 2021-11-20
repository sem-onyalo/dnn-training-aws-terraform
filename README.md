# AWS Terraform for Deep Neural Network Training

This code is designed to launch an EC2 instance, clone another training repository on that instance and train a DNN model.

The default key-pair for the EC2 instance that gets launched is called `training-server-key`. If you plan to SSH into the launched EC2 instance you'll need to create a key-pair with that name in AWS (see [main.tf](./main.tf)).

To run this code you'll need your AWS credentials configured. For example, from the AWS CLI run 

```
aws configure
```

The training can be launched from a bash terminal using the command below.

```
./run
```

You can specify different training parameters for the training code like the command below

```
./run -c 'python3 main.py -b 256 -e 5'
``` 

or you can specify a different repository altogether, like the command below

```
./run -u 'https://github.com/your-username' -r 'your-dnn-training-repo'
```

If you specify your own repository it will need to include a bash script called `run`. See the [default training repository](https://github.com/sem-onyalo/dnn-training-model) for more details.
