# Define os valores para as variáveis declaradas em variables.tf.
# Exemplo de um ID de AMI para Ubuntu 22.04 LTS na região us-east-1.
# Lembre-se de verificar e usar o ID correto para a sua região!
ami_id = "ami-053b0d53c279acc90" # Este é um exemplo, procure o atual na console AWS!
# Você pode sobrescrever os valores padrão se desejar, por exemplo:
aws_region = "us-west-2"
instance_type = "t3.small"
instance_name = "MinhaInstanciaTerraform"