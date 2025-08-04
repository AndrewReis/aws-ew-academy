# create policies file
# create file handler.mjs

# attach role for lambda
aws iam create-role \
  --role-name lambda-example \
  --assume-role-policy-document file://policies.json \
  | tee logs/create-role.log


# zip project
zip functions.zip handler.js


# deploy
aws lambda create-function \
    --function-name ew-func-without-frameworks \
    --runtime nodejs22.x \
    --zip-file fileb://functions.zip \
    --handler handler.run \
    --role arn:aws:iam::0000000000000000:role/lambda-example \
    | tee logs/create-funtion.log


# invoke
aws lambda invoke \
    --function-name ew-func-without-frameworks \
    --cli-binary-format raw-in-base64-out \
    --payload '{ "name": "Bob" }' \
    response.json \
    | tee logs/invoke-funtion.log


# update function
zip functions.zip handler.mjs

aws lambda update-function-code \
    --function-name ew-func-without-frameworks \
    --zip-file fileb://functions.zip \
    | tee logs/update-funtion.log


# delete function
aws lambda delete-function \
    --function-name ew-func-without-frameworks \
    | tee logs/delete-funtion.log
