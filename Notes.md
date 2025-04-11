
# Instalação do Terraform
https://www.terraform.io/

wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

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

#### 🧾 Configurar Git e criar repositório remoto

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


# Alterar recursos criados no terraform (Temos duas formas)

1 Alterações que não precisam recriar o recurso
2 Alterações que forçam recriar o recurso

