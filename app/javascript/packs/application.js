// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")




// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
import 'css/site'
import 'jquery';
import 'popper.js'
import 'bootstrap';
import $ from 'jquery';
import "@fortawesome/fontawesome-free/css/all";
global.$ = $;
global.jQuery = $;



jQuery('.chat-list').css("overflow-y", "scroll");

$(document).on("turbolinks:load", function () {
    var $element = $(".chat");
    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

  $('body').on('click', '.comment_button', function(e){
    debugger;
    var commentsId = $(this).attr('data-att');
    $("#" + commentsId).toggle('show');
  //if ($("#comment_button").attr("data-att")== $("#comments").attr("data-type")) {
    //var com = parseInt($("#comments").attr("data-type"));
  //$('[data-type= 3]').toggle('show');   
  //}
});

  $('body').on('click', '.more_comment_button', function(e){
    var comments = $(this).attr('data-comment');
  $("#"+ comments).toggleClass('show');
});

    $('body').on('click', '#search-tag', function(e){
  $(".searched").toggleClass('active');
});

 //  $("body *").not('.hello').on("click", function() {
 //  $(".searched").removeClass('active');    
 // });


   $('.time > a').on("click",function(){
    $(this).addClass('active');
  $(this).siblings().removeClass('active');
  return true;
  });

  function readPhotoURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#photo_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#photo-upload").change(function(){
    $('#photo_prev').removeClass('hidden');
    readPhotoURL(this);
  });


  function readCoverPhotoURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#cover_photo_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#cover-photo-upload").change(function(){
    $('#cover_photo_prev').removeClass('hidden');
    readCoverPhotoURL(this);
  });




  // function readImageURL(input) {
  //   if (input.files && input.files[0]) {
  //     var reader = new FileReader();

  //     reader.onload = function (e) {
  //       $('#img_prev').attr('src', e.target.result);
  //     }
  //     reader.readAsDataURL(input.files[0]);
  //   }
  // }

  // $("#avatar-upload").change(function(){
  //   $('#img_prev').removeClass('hidden');
  //   readImageURL(this);
  // });


    function imagesPreview(input, placeToInsertImagePreview) {

        if (input.files) {
            var filesAmount = input.files.length;
            var i;
             for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                      $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                }

                reader.readAsDataURL(input.files[i]);
             }
        }

    };

    $('#avatar-upload').change(function() {
        $('#img_prev').removeClass('hidden');
        imagesPreview(this, 'div.gallery');
    });



    function videosPreview(input, placeToInsertVideoPreview) {

        if (input.files) {
            var filesAmount = input.files.length;
            var i;
             for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                      $($.parseHTML('<video>')).attr('src', event.target.result).appendTo(placeToInsertVideoPreview);
                       $('.gallery > video').prop("controls", true);
                }

                reader.readAsDataURL(input.files[i]);
             }
        }

    };

    $('#video-upload').change(function() {
        $('#video_prev').removeClass('hidden');
        videosPreview(this, 'div.gallery');
    });

  // function readVideoURL(input) {
  //   if (input.files && input.files[0]) {
  //     var reader = new FileReader();

  //     reader.onload = function (e) {
  //       $('#vid_prev').attr('src', e.target.result);
  //     }
  //     reader.readAsDataURL(input.files[0]);
  //   }
  // }

  // $("#video-upload").change(function(){
  //   $('#vid_prev').removeAttr('style');
  //   $('#vid_prev').removeClass('hidden');
  //   readVideoURL(this);
  // });

  $('#basic').on("click",function(){
  $(".editing-info").removeClass('hide'); 
  $(".editing-info").addClass('show'); 
  $(".editing-work-info").removeClass('show');
  $(".editing-work-info").addClass('hide');
  $(".editing-interest").removeClass('show'); 
  $(".editing-interest").addClass('hide');
  $(".editing-education-info").removeClass('show');
  $(".editing-education-info").addClass('hide');   
  });



  $('#work-info').on("click",function(){
  $(".editing-work-info").removeClass('hide');
  $(".editing-work-info").addClass('show'); 
  $(".editing-info").removeClass('show');
  $(".editing-info").addClass('hide');
  $(".editing-interest").removeClass('show'); 
  $(".editing-interest").addClass('hide'); 
  $(".editing-education-info").removeClass('show');
  $(".editing-education-info").addClass('hide');   
  });


  $('#education-info').on("click",function(){
  $(".editing-education-info").removeClass('hide');
  $(".editing-education-info").addClass('show'); 
  $(".editing-work-info").removeClass('show');
  $(".editing-work-info").addClass('hide'); 
  $(".editing-info").removeClass('show');
  $(".editing-info").addClass('hide');
  $(".editing-interest").removeClass('show'); 
  $(".editing-interest").addClass('hide');  
  });





  $('#interest').on("click",function(){
  $(".editing-interest").removeClass('hide'); 
  $(".editing-interest").addClass('show');  
  $(".editing-info").removeClass('show'); 
  $(".editing-info").addClass('hide'); 
  $(".editing-work-info").removeClass('show');
  $(".editing-work-info").addClass('hide');
  $(".editing-education-info").removeClass('show');
  $(".editing-education-info").addClass('hide');  
  });



  $('.top-area > .setting-area > li').on("click",function(){
  $(this).siblings().children('div').removeClass('active');
  $(this).children('div').addClass('active');
  return false;
  });
//------- remove class active on body
  $("body *").not('.top-area > .setting-area > li').on("click", function() {
  $(".top-area > .setting-area > li > div").removeClass('active');    
 });
  

//--- user setting dropdown on topbar 
$('.user-img').on('click', function() {
  $('.user-setting').addClass("active");
  return false;
}); 
  

$("body *").not('.user-img').on("click", function() {
  $(".user-setting").removeClass('active');    
 });
//--- side message box  
$('.friendz-list > li, .chat-users > li').on('click', function() {
  $('.chat-box').addClass("show");
  $('.chat-list > ul').css("overflow-y", "scroll");
  return false;
}); 
  $('.close-mesage').on('click', function() {
    $('.chat-box').removeClass("show");
    return false;
  }); 
  
//------ scrollbar plugin
  if ($.isFunction($.fn.perfectScrollbar)) {
    $('.dropdowns, .twiter-feed, .invition, .followers, .chatting-area, .peoples, #people-list, .chat-list > ul, .message-list, .chat-users, .left-menu').css("overflow-y", "scroll");
  }



/*--- socials menu scritp ---*/ 
  $('.trigger').on("click", function() {
      $(this).parent(".menu").toggleClass("active");
    });
  
/*--- emojies show on text area ---*/ 
  $('.add-smiles > span').on("click", function() {
      $(this).parent().siblings(".smiles-bunch").toggleClass("active");
    });

// delete notifications
$('.notification-box > ul li > i.del').on("click", function(){
    $(this).parent().slideUp();
  return false;
  });   

/*--- socials menu scritp ---*/ 
  $('.f-page > figure i').on("click", function() {
      $(".drop").toggleClass("active");
    });

//===== Search Filter =====//
  (function ($) {
  // custom css expression for a case-insensitive contains()
  jQuery.expr[':'].Contains = function(a,i,m){
    return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
  };

  function listFilter(searchDir, list) { 
    var form = $("<form>").attr({"class":"filterform","action":"#"}),
    input = $("<input>").attr({"class":"filterinput","type":"text","placeholder":"Search Contacts..."});
    $(form).append(input).appendTo(searchDir);

    $(input)
    .change( function () {
    var filter = $(this).val();
    if(filter) {
      $(list).find("li:not(:Contains(" + filter + "))").slideUp();
      $(list).find("li:Contains(" + filter + ")").slideDown();
    } else {
      $(list).find("li").slideDown();
    }
    return false;
    })
    .keyup( function () {
    $(this).change();
    });
  }

//search friends widget
  $(function () {
    listFilter($("#searchDir"), $("#people-list"));
  });
  }(jQuery)); 

//progress line for page loader
  // $('body').show();
  // NProgress.start();
  // setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 2000);
  
//--- bootstrap tooltip 
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });
  
// Sticky Sidebar & header
  if($(window).width() < 769) {
    jQuery(".sidebar").children().removeClass("stick-widget");
  }

  if ($.isFunction($.fn.stick_in_parent)) {
    $('.stick-widget').stick_in_parent({
      parent: '#page-contents',
      offset_top: 60,
    });

    
    $('.stick').stick_in_parent({
        parent: 'body',
            offset_top: 0,
    });
    
  }
  
/*--- topbar setting dropdown ---*/ 
  $(".we-page-setting").on("click", function() {
      $(".wesetting-dropdown").toggleClass("active");
    }); 
    
/*--- topbar toogle setting dropdown ---*/  
$('#nightmode').on('change', function() {
    if ($(this).is(':checked')) {
        // Show popup window
        $(".theme-layout").addClass('black'); 
    }
  else {
        $(".theme-layout").removeClass("black");
    }
});

//chosen select plugin
if ($.isFunction($.fn.chosen)) {
  $("select").chosen();
}

//----- add item plus minus button
if ($.isFunction($.fn.userincr)) {
  $(".manual-adjust").userincr({
    buttonlabels:{'dec':'-','inc':'+'},
  }).data({'min':0,'max':20,'step':1});
} 
  
if ($.isFunction($.fn.loadMoreResults)) { 
  $('.loadMore').loadMoreResults({
    displayedItems: 3,
    showItems: 1,
    button: {
      'class': 'btn-load-more',
      'text': 'Load More'
    }
  }); 
}
  //===== owl carousel  =====//
  if ($.isFunction($.fn.owlCarousel)) {
    $('.sponsor-logo').owlCarousel({
      items: 6,
      loop: true,
      margin: 30,
      autoplay: true,
      autoplayTimeout: 1500,
      smartSpeed: 1000,
      autoplayHoverPause: true,
      nav: false,
      dots: false,
      responsiveClass:true,
        responsive:{
          0:{
            items:3,
          },
          600:{
            items:3,

          },
          1000:{
            items:6,
          }
        }

    });
  }
  
// slick carousel for detail page
  if ($.isFunction($.fn.slick)) {
  $('.slider-for-gold').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    slide: 'li',
    fade: false,
    asNavFor: '.slider-nav-gold'
  });
  
  $('.slider-nav-gold').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    asNavFor: '.slider-for-gold',
    dots: false,
    arrows: true,
    slide: 'li',
    vertical: true,
    centerMode: true,
    centerPadding: '0',
    focusOnSelect: true,
    responsive: [
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        vertical: false,
        centerMode: true,
        dots: false,
        arrows: false
      }
    },
    {
      breakpoint: 641,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        vertical: true,
        centerMode: true,
        dots: false,
        arrows: false
      }
    },
    {
      breakpoint: 420,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        vertical: false,
        centerMode: true,
        dots: false,
        arrows: false
      }
    } 
    ]
  });
}
  
//---- responsive header
  
// $(function() {

  //  create the menus
  // $('#menu').mmenu();
  // $('#shoppingbag').mmenu({
  //   navbar: {
  //     title: 'General Setting'
  //   },
  //   offCanvas: {
  //     position: 'right'
  //   }
  // });

  //  fire the plugin
//   $('.mh-head.first').mhead({
//     scroll: {
//       hide: 200
//     }
    
//   });
//   $('.mh-head.second').mhead({
//     scroll: false
//   });

  
// });   

//**** Slide Panel Toggle ***//
    $("span.main-menu").on("click", function(){
       $(".side-panel").addClass('active');
      $(".theme-layout").addClass('active');
      return false;
    });

    $('.theme-layout').on("click",function(){
      $(this).removeClass('active');
       $(".side-panel").removeClass('active');
      
       
    });

    
// login & register form
  $('button.signup').on("click", function(){
    $('.login-reg-bg').addClass('show');
    return false;
    });
    
    $('.already-have').on("click", function(){
    $('.login-reg-bg').removeClass('show');
    return false;
    });
  
//----- count down timer    
  if ($.isFunction($.fn.downCount)) {
    $('.countdown').downCount({
      date: '11/12/2018 12:00:00',
      offset: +10
    });
  }
  
/** Post a Comment **/
jQuery(".post-comt-box textarea").on("keydown", function(event) {

  if (event.keyCode == 13) {
    var comment = jQuery(this).val();
    var parent = jQuery(".showmore").parent("li");
    var comment_HTML = '  <li><div class="comet-avatar"><img src="images/resources/comet-1.jpg" alt=""></div><div class="we-comment"><div class="coment-head"><h5><a href="time-line.html" title="">Jason borne</a></h5><span>1 year ago</span><a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a></div><p>'+comment+'</p></div></li>';
    $(comment_HTML).insertBefore(parent);
    jQuery(this).val('');
  }
}); 
  
//inbox page  
//***** Message Star *****//  
    $('.message-list > li > span.star-this').on("click", function(){
      $(this).toggleClass('starred');
    });


//***** Message Important *****//
    $('.message-list > li > span.make-important').on("click", function(){
      $(this).toggleClass('important-done');
    });

    

// Listen for click on toggle checkbox
  $('#select_all').on("click", function(event) {
    if(this.checked) {
        // Iterate each checkbox
        $('input:checkbox.select-message').each(function() {
            this.checked = true;
        });
    }
    else {
      $('input:checkbox.select-message').each(function() {
            this.checked = false;
        });
    }
  });


  $(".delete-email").on("click",function(){
    $(".message-list .select-message").each(function(){
        if(this.checked) {
          $(this).parent().slideUp();
        }
    });
  });

// change background color on hover
  $('.category-box').hover(function () {
    $(this).addClass('selected');
    $(this).parent().siblings().children('.category-box').removeClass('selected');
  });
  
  
//------- offcanvas menu 

  const menu = document.querySelector('#toggle');  
  const menuItems = document.querySelector('#overlay');  
  const menuContainer = document.querySelector('.menu-container');  
  const menuIcon = document.querySelector('.canvas-menu i');  

  function toggleMenu(e) {
    menuItems.classList.toggle('open');
    menuContainer.classList.toggle('full-menu');
    menuIcon.classList.toggle('fa-bars');
    menuIcon.classList.add('fa-times');
    e.preventDefault();
  }

  if( menu ) {
    menu.addEventListener('click', toggleMenu, false);  
  }
  
// Responsive nav dropdowns
  $('.offcanvas-menu li.menu-item-has-children > a').on('click', function () {
    $(this).parent().siblings().children('ul').slideUp();
    $(this).parent().siblings().removeClass('active');
    $(this).parent().children('ul').slideToggle();
    $(this).parent().toggleClass('active');
    return false;
  }); 
  



//Disabling send button of message box
  $('.chat-input-button').attr('disabled',true);
  $('.chat-input').keyup(function(){
      if($('.chat-input').val().length !=0)
          $('.chat-input-button').attr('disabled',false);            
      else
          $('.chat-input-button').attr('disabled',true);
  })


  // $('.comt').attr('disabled',true);
  // $('.post-comt-box').keyup(function(){
  //     if($('.post-comt-box').val().length !=0)
  //         $('.comt').attr('disabled',false);            
  //     else
  //         $('.comt').attr('disabled',true);
  // })



//Disabling publish button of post
    $(checkForVideoChanges);
    $(checkForImageChanges);
    $('.publish_button').attr('disabled',true); 
    $('#post_description').keyup(function(){
      if($('#post_description').val().length !=0)
          $('.publish_button').attr('disabled',false);            
      else
          $('.publish_button').attr('disabled',true);
        $(checkForImageChanges);
        $(checkForVideoChanges);
  })


  function checkForImageChanges()
  {
      if ($('#img_prev').hasClass('hidden'))
        setTimeout(checkForImageChanges, 500);
      else
        $('.publish_button').attr('disabled',false);      
  }

  function checkForVideoChanges(){
      if ($('#vid_prev').hasClass('hidden'))
        setTimeout(checkForVideoChanges, 500);
      else
        $('.publish_button').attr('disabled',false); 
  }




var state = "minimized";
//Check if navbar is expanded or minimized and handle 
$('#navbar-toggle').click(function() {
    if (state == "expanded") {
        $('.side').attr('style', 'margin-left: -25%');
        $('.menu-icon').removeClass("fa-times");
        $('.menu-icon').addClass("fa-bars");
        state = "minimized";
    } else {
        if (state == "minimized") {
            $('.side').attr('style', 'left: 0 !important');
            $('.side').attr('style', 'margin-left: 0% !important');
            $('.menu-icon').removeClass("fa-bars");
            $('.menu-icon').addClass("fa-times");
            state = "expanded";
        }
    }
})

$('#toggler').click(function() {
  if($('#toggler').hasClass('collapsed')){
    $('#symbol').removeClass('navbar-toggler-icon');
    $('#symbol').addClass('fa fa-times fa-2x');
  }else{
    $('#symbol').removeClass("fa fa-times fa-2x");
    $('#symbol').addClass('navbar-toggler-icon');
  }
})


});
 

