// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
 

/***************************  History API ********************************/
var use_remote = true;

var addEvent = (function () {
  if (document.addEventListener) {
    return function (el, type, fn) {
      if (el && el.nodeName || el === window) {
        el.addEventListener(type, fn, false);
      } else if (el && el.length) {
        for (var i = 0; i < el.length; i++) {
          addEvent(el[i], type, fn);
        }
      }
    };
  } else {
    return function (el, type, fn) {
      if (el && el.nodeName || el === window) {
        el.attachEvent('on' + type, function () { return fn.call(el, window.event); });
      } else if (el && el.length) {
        for (var i = 0; i < el.length; i++) {
          addEvent(el[i], type, fn);
        }
      }
    };
  }
})();

function reportEvent(data) {
  if(data.url != "unknown"){
	$.ajax({
	  url: data.url,
	  data: {pop : 1},
	  dataType: "script"
	});
  }
}

addEvent(window, 'popstate', function (event) {
  if(use_remote){
    var data = event.state;
    reportEvent(event.state || { url: "unknown", name: "undefined" });
  }
});

jQuery.fn.extend({
  slideRightShow: function() {
    return this.each(function() {
        $(this).show('slide', {direction: 'right'}, 700);
    });
  },
  slideLeftHide: function(element) {
    return this.each(function() {
      $(this).hide('slide', {
          direction: 'left',
          complete:function(){
            $(this).remove();
            element.slideRightShow();
          }
        }, 700);      
    });
  },
  slideRightHide: function() {
    return this.each(function() {
      $(this).hide('slide', {direction: 'right'}, 1000);
    });
  },
  slideLeftShow: function() {
    return this.each(function() {
      $(this).show('slide', {direction: 'left'}, 1000);
    });
  }
});


/***************************  Load lights ********************************/

function load_lights(){
  load_light([3, 5, 1, 4, 0, 2]);
}

function load_light(indexes){
  if(indexes.length > 0){
    var index = indexes.pop();
    $("#lights_container div:eq(" + index + ") a img").fadeIn(500, function(){
      //$("#lights_container div:eq(" + index + ") a.light img").trigger('hover');
      load_light(indexes);
    });
  }
}