aws s3api create-bucket --bucket ew-sh-hello-bucket

aws s3 cp example.txt s3://ew-sh-hello-bucket

aws s3 rm s3://ew-sh-hello-bucket --recursive

aws s3api delete-bucket --bucket ew-sh-hello-bucket