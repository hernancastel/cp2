echo "================================================================================"
echo "=                                                                              ="
echo "=                  DEPLOY APLICACIONES EN AZURE ANSIBLE                        ="
echo "=                                                                              ="
echo "================================================================================"
echo ""
echo ""
cd ansible
ansible-playbook -i inventory.yaml all_playbook.yaml --private-key ~/.ssh/id_rsa
echo ""
echo "Fin de despliegue Ansible"
echo ""
echo ""
