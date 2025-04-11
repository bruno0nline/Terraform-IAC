

# Instalação do Terraform
https://www.terraform.io/

wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Ajuda

terraform -h
terraform init -h
terraform plan -h

# Documentação

registry.terraform.io
https://registry.terraform.io/providers/hashicorp/aws/latest
https://registry.terraform.io/providers/hashicorp/aws/latest/docs

Criar acesso a AWS via cli ou via variáveis de ambiente


