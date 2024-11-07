# Work helpers
alias ssh="signmykey -e; ssh"
alias scp="signmykey -e; scp"
alias tmuxp="signmykey -e; tmuxp"
alias ansible="signmykey -e; ansible"
alias ansible-playbook="signmykey -e; ansible-playbook"
alias htop='gotop'
# usage: cat file.yml | yaml2json
alias yaml2json="python3 -c 'import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout, indent=2)'"

# Vault helpers
vault_ldap_login() { vault login -no-print -method=ldap username=$USER }
vault_root_password() {	vault kv get -field 2023_root unix/ru/ssh | copy2cb }
vault_root_password_ir() { vault kv get -field root unix/ir/ssh | copy2cb }
vault_my_token() { cat ~/.vault-token | copy2cb }

# Work vars
export VAULT_ADDR=https://vault.maxim.services:8200
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export TECHNO_REGIONS='ru ir sg id br cl'
