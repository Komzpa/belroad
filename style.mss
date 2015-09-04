@water: #9fd9e5;
@green: #00b600;
@darkgray: #4a4a4a;
@gray: #909090;
@lightgray: #e0e0e0;
@lightlightgray: #efefef;
@purple: #ac46ac; 
@lpurple: lighten(@purple, 40%);
@yellow: #ffe7a8;
@redroad: #d57c8f;
@orange: #ffb879;
@brown: #b89762; 

@sans: "PT Sans Regular", "Droid Sans Fallback Regular";
@sans_italic: "PT Sans Italic", "Droid Sans Fallback Regular";
@sans_bold: "PT Sans Bold", "Droid Sans Fallback Regular";
@sans_caption: "PT Sans Caption Regular", "Droid Sans Fallback Regular";

Map {
  background-color: white;
  buffer-size: 256;
  font-directory: url(data/ptsans);
}

.route {
  line-width:5;
  line-color:#012d64;
  line-join: round; 
  line-cap: round;
  [zoom<10] {
    line-width: 4;
  }
}

#power[zoom>=13] {
  line-width: 0.5;
  line-color: fadeout(#d57c8f, 30%);
  line-dasharray: 20, 2, 2, 2;
}

/*  ADMIN BORDERS  */

#admin[admin_level="2"] {
  line-color: @lpurple;
  line-width: 6;
  line-join: round;
  [zoom<8] { line-width: 5; }
}

#admin[admin_level="4"][zoom>=8] {
  line-color: @lpurple;
  line-width: 3;
  line-join: round;
}

#admin[admin_level="4"][zoom<8],
#admin[admin_level="6"][zoom>=9] {
  line-width: 2;
  [zoom<10] { line-width: 1.5; }
  line-color: @lpurple;
  line-join: round;
  line-dasharray: 6;
}

#admin-line[admin_level="4"][zoom>=8] {
  line-width: 1;
  line-dasharray: 6;
  line-join: round;
  line-color: @purple;
}

#admin-line[admin_level="2"] {
  line-width: 2;
  [zoom<9] { line-width: 1.5; }
  line-dasharray: 6;
  line-join: round;
  line-color: @purple;
}

/* SCALE */

#scale[label=''] {
  ::casing {
    line-width: 5;
    line-color: black; 
  }
  ::fill[id2=1] {
    line-width: 3;
    line-color: white;
  }
}

#scale[label!=''] {
  text-name: [label];
  text-face-name: @sans;
  text-size: 9;
  text-dy: -7;
  [label=~'.+Open.+'] {
    text-dy: 7;
    text-size: 8;
  }
  text-allow-overlap: true;
}


#hnolabels[zoom>=14] {
  text-name: [hno];
  text-face-name: @sans;
  text-size: 8;
  text-spacing: 0;
  text-clip: false;
  text-min-distance: 13;
  text-orientation: [angle];
  text-halo-radius: 1.5;
  text-halo-fill: mix(@gray, @lightgray, 25%); 
  /*
  colored halos need more thinking.
  [highway='primary']{text-halo-fill: mix(@redroad, @lightgray, 25%);}
  [highway='secondary']{text-halo-fill: mix(@orange, @lightgray, 25%);}
  [highway='tertiary']{text-halo-fill: mix(@yellow, @lightgray, 25%);}
  */
  [zoom>=15] {text-size: 9; }
  [zoom>=16] {text-size: 10; text-min-distance: 9;}
  [zoom>=17] {text-min-distance: 10;}  
}

#barriers[zoom>=16] {
  line-width:.5;
  line-color:#000;
}

@building_shade: #ccc;
#buildings3d[zoom>14] {
  ::shadow {
    [visible='shadow'] { 
    	polygon-fill: black;
  		opacity: 0.1
  	}
  }
  //line-width:1;line-color:#168;
  //[visible='yes-h'], [visible='yes-v'] {line-color:#444; line-width: 0.3}
  //[visible='no-h'], [visible='no-v'] {line-color:#444; line-width: 0.1}
  [hv=2][visible='yes-h'] {
    polygon-fill: mix(@building_base, @building_shade, 29%);
    line-color: @building_base; 
    line-width: 0.2;
    //polygon-opacity: 0.9
  }
  /*[visible='yes'] {
    polygon-fill: silver; 
    line-color: @building_base; 
    line-width: 0.5;
  //  polygon-opacity: 0.6
  }*/


  //::burn {
    [hv=1][visible='yes'] {
    	[azim>=0.0][azim<18.0] {polygon-fill: mix(@building_base, @building_shade, 70%)}
    	[azim>=18.0][azim<36.0] {polygon-fill: mix(@building_base, @building_shade, 69%)}
    	[azim>=36.0][azim<54.0] {polygon-fill: mix(@building_base, @building_shade, 66%)}
    	[azim>=54.0][azim<72.0] {polygon-fill: mix(@building_base, @building_shade, 62%)}
    	[azim>=72.0][azim<90.0] {polygon-fill: mix(@building_base, @building_shade, 56%)}
    	[azim>=90.0][azim<108.0] {polygon-fill: mix(@building_base, @building_shade, 50%)}
    	[azim>=108.0][azim<126.0] {polygon-fill: mix(@building_base, @building_shade, 44%)}
    	[azim>=126.0][azim<144.0] {polygon-fill: mix(@building_base, @building_shade, 38%)}
    	[azim>=144.0][azim<162.0] {polygon-fill: mix(@building_base, @building_shade, 33%)}
    	[azim>=162.0][azim<180.0] {polygon-fill: mix(@building_base, @building_shade, 31%)}
    	line-color: @building_base; 
    	line-width: 0.5;
    }
//  }
  
}