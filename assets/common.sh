login_approle() {
    vault_role_id="$1"
    vault_secret_id="$2"
    token=$(vault write -format=json auth/app-id/login app_id=${vault_app_id} user_id=${vault_user_id} | jq -r '.auth.client_token')
    if [ -z "${token}" ]; then
        echo "ERROR: No token retrieved"
	return 1
    fi
    echo -n "${token}" > ~/.vault-token
}

get_secret() {
    vault read -format=json ${1} | jq -r '.data'
}
