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
  for i in $(seq $(( $(cat data.db | wc -l) / 6 )))
  do
  cat data.db | head -$(( (6*$i)-1 )) | tail +$(( (6*($i-1))+1 )) > tmp

#    if (( $check_file $1 == 1)); then
#      pnt_entry tmp
#      echo ""
#    fi

    for i in $(pnt_data tmp tags)
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

#Anatomy
gen_file anatomy > topics/anatomy.html
gen_file bones > topics/bones.html
gen_file muscles > topics/muscles.html
gen_file gesture > topics/gesture.html
gen_file head > topics/head.html
gen_file hands > topics/hands.html
gen_file human > topics/human.html
gen_file ears > topics/ears.html
gen_file legs > topics/legs.html
gen_file knees > topics/knees.html
gen_file noses > topics/noses.html
gen_file feet > topics/feet.html

#Painting
gen_file colour > topics/colour.html
gen_file lighting > topics/lighting.html
gen_file rendering > topics/rendering.html
gen_file shape > topics/shape.html
gen_file fur > topics/fur.html
gen_file paintovers > topics/paintovers.html
gen_file painting > topics/painting.html
gen_file edges > topics/edges.html
gen_file values > topics/values.html
gen_file composition > topics/composition.html
gen_file brushwork > topics/brushwork.html

#Sketching
gen_file sketching > topics/sketch.html
gen_file inking > topics/inking.html

#Philosophy
gen_file vislib > topics/vislib.html
gen_file mindset > topics/mindset.html
gen_file health > topics/health.html

#Perspective
gen_file forms > topics/forms.html
gen_file perspective > topics/perspective.html

#3D
gen_file 3d-modeling > topics/modeling.html
gen_file blender > topics/blender.html
gen_file 3d-sculpting > topics/sculpting.html

#Animation
gen_file 3d-sculpting > topics/sculpting.html

gen_file courses > topics/courses.html
gen_file tips > topics/tips.html
gen_file technical > topics/technical.html
gen_file beginner > topics/beginner.html
gen_file excersises > topics/excersises.html
gen_file youtube > topics/youtube.html
gen_file tutorials > topics/tutorials.html
gen_file unsorted > topics/unsorted.html
