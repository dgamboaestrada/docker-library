# Terraform
complete -o nospace -C /usr/local/bin/terraform terraform
alias t="terraform"
alias tplan="terraform plan -out=plan.tfstate"
alias tapply="terraform apply plan.tfstate"
alias twp-list="terraform workspace list"
alias tdoc="terraform-docs markdown table --output-file README.md --output-mode inject ./"

#USAGE t-force-unlock LOCK_ID
function t-force-unlock() {
  terraform force-unlock $1
}

