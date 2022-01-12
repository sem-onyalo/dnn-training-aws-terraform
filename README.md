# AWS Terraform for GAN Deep Learning Training

This code is designed to launch an EC2 instance, clone another training repository on that instance and train a GAN model.

The default key-pair for the EC2 instance that gets launched is called `training-server-key`. If you plan to SSH into the launched EC2 instance you'll need to create a key-pair with that name in AWS (see [main.tf](./main.tf)).

To run this code you'll need your AWS credentials configured. For example, from the AWS CLI run 

```
aws configure
```

The training can be launched from a bash terminal using the command below.

```
./run
```

You'll most likely need to specify a specific training command, for example parameters for the training code like the command below.

```
./run -c 'python3 main.py --train' -f 'python3 app.py'
``` 

You can specify a different repository, like the command below

```
./run -a 'https://github.com/your-username' -b 'your-training-repo' -d 'https://github.com/your-username' -b 'your-monitoring-repo'
```

If you specify your own repository it will need to include a bash script called `run`. See the [default training repository](https://github.com/sem-onyalo/gan-training-model) and the accompanying [automated training documentation](https://github.com/sem-onyalo/gan-training-doc) for more details.
