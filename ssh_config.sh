git config --global user.name "Tu Nombre"
git config --global user.email tucorreo@mail.com
ssh-keygen -t rsa -b 4096 -C tucorreo@email.com
enter
enter
eval "$(ssh-agent -s)" # agent pid
ssh-add ~/.ssh/id_rsa # añadir las llaves al archivo
if linux
  sudo apt install xclip
  xclip -sel clip < ~/.ssh/id_rsa.pub
elsif mac
  pbcopy < ~/.ssh/id_rsa.pub
else
  clip < ~/.ssh/id_rsa.pub
end

ssh -T git@github.com # si funciona debería decir Hi...!

