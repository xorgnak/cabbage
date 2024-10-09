
sudo apt install screen emacs-nox emacs-goodies-el mosquitto mosquitto-clients ruby-full 

cat << END > ~/.screenrc 
shell -${SHELL}
caption always "[ %H ] %w"
defscrollback 1024
startup_message off
hardstatus on
hardstatus alwayslastline
screen -t EMACS 0 emacs -nw --visit ~/index.org
screen -t LLAMA 1 llama --cli --color -p "What is the meaning of life?"
screen -t BT 8 bluetoothctl
screen -t TOP 9 htop
select 3
END

echo "--[CABBAGE] DONE."
