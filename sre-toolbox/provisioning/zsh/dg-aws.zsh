# AWS
complete -C aws_completer aws
function aws-export-profile() {
    echo "$1"
    echo "Exporting \"$1\" aws profile..."
    export AWS_PROFILE=$1
    export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $1)
    export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $1)
    export AWS_SESSION_TOKEN=$(aws configure get aws_session_token --profile $1)
    export AWS_SECURITY_TOKEN=$(aws configure get aws_security_token --profile $1)
    if [[ "$2" == "true" ]]; then
      echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" > $PWD/.env.aws
      echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> $PWD/.env.aws
      echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" >> $PWD/.env.aws
    fi
}
# Description: This function will assume a role and export the credentials
# USAGE aws-assume-role arn:aws:iam::account-id:role/role-name session_name
function aws-assume-role() {
  local role_arn=$1
  local session_name=$2
  local region=${3:-us-east-1}
  # Check if all required arguments are provided
  if [ -z "$role_arn" ] || [ -z "$session_name" ]; then
    echo "Usage: aws-assume-role role_arn session_name [region]"
    return 1
  fi

  local $(printf "aws_access_key_id=%s aws_secret_access_key=%s aws_session_token=%s" \
  $(aws sts assume-role \
  --role-arn $role_arn \
  --role-session-name $session_name \
  --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
  --output text))

  echo "\n"
  echo "Writing credentials to ~/.aws/credentials"
  echo "[$session_name]"
  echo "region=$region"
  echo "aws_access_key_id=$aws_access_key_id"
  echo "aws_secret_access_key=$aws_secret_access_key"
  echo "aws_session_token=$aws_session_token"
  echo "\n"
  echo "Or export the credentials with:"
  echo "export AWS_ACCESS_KEY_ID=$aws_access_key_id AWS_SECRET_ACCESS_KEY=$aws_secret_access_key AWS_SESSION_TOKEN=$aws_session_token"
}
function aws-ecr-login(){
  aws_account_id=$(aws sts get-caller-identity --query Account --output text)
  aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $aws_account_id.dkr.ecr.us-east-1.amazonaws.com
}
function aws-whoami(){
  aws sts get-caller-identity
}
