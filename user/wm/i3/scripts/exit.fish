set ans (echo "<b>cancel</b>|<b><span color='orange'>exit</span></b>|<b><span color='red'>shutdown</span></b>|<b><span color='red'>reboot</span></b>" | rofi -sep '|' -location 3 -markup-rows -dmenu -p "Do you want to exit?" -l 4 -theme-str 'window {width: 6%; x-offset: -9px; y-offset: 53px; padding: 0; margin: 0;}' -theme-str 'inputbar { enabled: false;}' -theme-str 'listview {border: 0; margin: 0; padding: 0;}'  -format 'i')

if test "$ans" = "0"
  echo "CANCEL"
else if test "$ans" = "1"
  i3-msg exit
else if test "$ans" = "2"
  shutdown -h now
else if test "$ans" = "3"
  reboot
end
