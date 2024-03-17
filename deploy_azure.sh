echo ""
echo ""
echo "=================================================================="
echo "==             DESPLIEGUE ARQUITECTURA AZURE                    =="
echo "=================================================================="
cd terraform
echo ""
echo ""
echo ">> terraform init"
terraform init
echo ""
echo ""
echo ">> terraform plan"
terraform plan
echo ""
echo ""
echo ">> terraform apply"
terraform apply -auto-approve
echo ""
echo ""
echo ""
