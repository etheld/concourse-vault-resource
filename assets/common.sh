login_appid() {
    vault_app_id="$1"
    vault_user_id="$2"
    token=$(vault write -format=json auth/app-id/login app_id=${vault_app_id} user_id=${vault_user_id} | jq -r '.auth.client_token')
    if [ -z "${token}" ]; then
        echo "ERROR: No token retrieved"
	      return 1
    fi
    echo -n "${token}" > ~/.vault-token
}

get_secret() {
    vault read -field=value ${1}
}
