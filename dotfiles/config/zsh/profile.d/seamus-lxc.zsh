# Work helpers
alias ssh="signmykey -e; ssh"
alias scp="signmykey -e; scp"
alias tmuxp="signmykey -e; tmuxp"
alias ansible="signmykey -e; ansible"
alias ansible-playbook="signmykey -e; ansible-playbook"
alias htop='gotop'

# Usage: cat file.yml | yaml2json
alias yaml2json="python3 -c 'import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout, indent=2)'"

# Python venv helpers
alias venv-molecule="source ~/gitlab/ansible-molecule/venv/bin/activate"
alias venv-ansible="source ~/gitlab/ansible-vm-config/venv/bin/activate"

# Vault helpers
vault_ldap_login() {
  # get token age in hours
  [ -s ~/.vault-token ] && local token_age=$((($(date +%s) - $(date +%s -r ~/.vault-token)) / 3600)) || local token_age=12
  test $token_age -ge 12 && vault login -no-print -method=ldap username=$USER ||:
}
vault_root_password() {	vault kv get -field 2023_root unix/ru/ssh | copy2cb }
vault_root_password_ir() { vault kv get -field root unix/ir/ssh | copy2cb }
vault_my_token() { cat ~/.vault-token | copy2cb }

# Work vars
export VAULT_ADDR=https://vault.maxim.services:8200
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export TECHNO_REGIONS=(ru ir sg id br cl)

# Dumb way for disabling unneeded completions
__git_heads_remote() {}
__git_tags_of_type() {}
__git_recent_commits() {}
