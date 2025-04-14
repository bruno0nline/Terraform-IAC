
# Instalação do Terraform
https://www.terraform.io/

### ⌛️ Instalação via apt (modo direto - substituído pelo TFEnv abaixo)
```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### 🌐 Instalação do Terraform com TFEnv (gerenciamento de versões via /usr/local)
```bash
# 1. Remover instalações antigas, se existirem
rm -rf ~/.tfenv
rm -f ~/.local/bin/terraform ~/.local/bin/tfenv ~/.terraform-version
sudo rm -f /usr/bin/terraform
sudo apt remove terraform -y

# 2. Clonar TFEnv no diretório correto
sudo git clone https://github.com/tfutils/tfenv.git /usr/local/tfenv

# 3. Criar links simbólicos globais para tfenv e terraform
sudo ln -s /usr/local/tfenv/bin/tfenv /usr/local/bin/tfenv
sudo ln -s /usr/local/tfenv/bin/terraform /usr/local/bin/terraform

# 4. Corrigir permissões, se necessário
sudo chown -R $USER:$USER /usr/local/tfenv

# 5. Instalar e usar versão desejada do Terraform
export PATH=$PATH:/usr/local/bin
hash -r  # limpa cache de path do bash

tfenv install 1.6.6
tfenv use 1.6.6

# 6. (Opcional) Fixar versão no projeto atual
echo "1.6.6" > .terraform-version
```

### ✅ Verificação final:
```bash
which terraform
tfenv list
terraform -v
```

---

# Help

terraform -h  
terraform init -h

# Documentação

registry.terraform.io  
https://registry.terraform.io/providers/hashicorp/aws/latest  
https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Criar acesso a AWS via cli ou via variáveis de ambiente

# Terraform basico

terraform validate  
terraform fmt  
terraform plan  
terraform apply

---

### 🛠️ Configuração do GitHub e Acesso SSH com VS Code

#### 📁 Organização do projeto no servidor
```bash
mkdir -p ~/projetos/terraform
cd ~/projetos/terraform
```

#### 🔑 Gerar chave SSH no servidor Ubuntu
```bash
ssh-keygen -t ed25519 -C "terraform"
# Salvar em: /home/bruno/.ssh/id_terraform
```

#### 🧠 Adicionar chave SSH ao agente
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_terraform
```

#### 📋 Copiar a chave pública para adicionar ao GitHub
```bash
cat ~/.ssh/id_terraform.pub
```

> Acesse GitHub → Settings → SSH and GPG keys → New SSH key

---

#### 💻 Configurar VS Code com acesso remoto via SSH
1. Instalar a extensão **Remote - SSH** no VS Code.  
2. Criar/editar o arquivo `C:\Users\bma\.ssh\config` com:
```txt
Host terraform
    HostName 192.168.18.48
    User bruno
    IdentityFile C:\Users\bma\.ssh\id_terraform
```
3. No VS Code, usar `F1 > Remote-SSH: Connect to Host...` → `terraform`

---

#### 🧪 Testar conexão SSH do Windows:
```bash
ssh terraform
```

---

#### 💾 Configurar Git e criar repositório remoto
```bash
git config --global user.name "Bruno Mendes Augusto"
git config --global user.email "brunomendesaugusto@gmail.com"

git init
git add .
git commit -m "Commit inicial do projeto Terraform IaC"

git remote add origin git@github.com:bruno0nline/terraform-iac.git
git branch -M main
git push -u origin main
```

> Se aparecer erro de push por vazamento de chaves:  
- Use `.gitignore` para ignorar arquivos sensíveis (`echo "arquivo.csv" >> .gitignore`)  
- Remova o commit sensível com `git reset --soft HEAD~1` e faça o push novamente com `--force`.

---

# Alterar recursos criados no terraform

1. Alterações que não precisam recriar o recurso (update in-place)  
2. Alterações que forçam recriar o recurso (destroy e recria)

```bash
terraform validate
terraform fmt
terraform plan -out="tfplan.out"
terraform apply "tfplan.out"
terraform destroy
```

---

# Iniciar uma instância na AWS com Terraform  
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

---

# Variáveis no Terraform

- **Input Variables** (como argumentos)
- **Output Values**
- **Local Values**

Atributos: `default`, `type`, `description`, `validation`, `sensitive`  
Tipos: `string`, `number`, `bool`  
Complexos: `list`, `set`, `map`, `object`, `tuple(<TYPE>)`

```bash
terraform apply -auto-approve
```
