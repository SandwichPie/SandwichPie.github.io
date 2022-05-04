#!/bin/bash

function pnt_data () {
  cat $1 | awk '/^'$2'/{for (i = 2; $i != '$2'; ++i) print $i}'
}

function pnt_entry () {
  echo "<p>"
  pnt_data $1 name | awk -v RS="" '{$1=$1} 1'
  echo "</p>"
  echo "<p>"
  pnt_data $1 catigory | awk -v RS="" '{$1=$1} 1'
  echo "</p>"
  echo "<p>"
  pnt_data $1 price
  echo "</p>"
  echo "<p>"
  pnt_data $1 tags | awk '{for (i = 0; i <= argc; ++i) print "#" $i}' | awk -v RS="" '{$1=$1} 1'
  echo "</p>"
  echo "<p>"
  pnt_data $1 url | awk '{for (i = 0; i <= argc; ++i) print "<a href=\"" $1 "\">" $1 "</a>"}'
  echo "</p>"
  echo "<hr>"
}

function check_file () {
  for i in $(pnt_data tmp files)
  do
    if [ $i == $1 ]; then
      echo 1
    fi
  done
}

function gen_file () {

  echo "<DOCTYPE html>"
  echo "<html>"
  echo "<body>"
  echo ""
  echo "<a href=\"https://SandwichPie.github.io\">Home</a>"
  echo "<hr>"
  echo ""
  for i in $(seq $(( $(cat data.db | wc -l) / 7 )))
  do
  cat data.db | head -$(( (7*$i)-1 )) | tail +$(( (7*($i-1))+1 )) > tmp

#    if (( $check_file $1 == 1)); then
#      pnt_entry tmp
#      echo ""
#    fi

    for i in $(pnt_data tmp files)
      do
        if [ $i == $1 ]; then
          pnt_entry tmp
        fi
      done

  done
  echo "</html>"
  echo "</body>"
}

gen_file bones

gen_file bones > topics/bones.html
gen_file colour > topics/colour.html
gen_file forms > topics/forms.html
gen_file gesture > topics/gesture.html
gen_file head > topics/head.html
gen_file lighting > topics/lighting.html
gen_file muscles > topics/muscles.html
gen_file rendering > topics/rendering.html
gen_file shape > topics/shape.html
gen_file vislib > topics/vislib.html
gen_file hands > topics/hands.html
gen_file fur > topics/fur.html
gen_file courses > topics/courses.html
gen_file perspective > topics/perspective.html
