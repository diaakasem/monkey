// ==UserScript==
// @name           8tracks Cleaner
// @namespace      8tracks
// @version        1
// @description    Cleans 8tracks from usless adds
// @include        http://8tracks.com/*
// @include        https://8tracks.com/*
// @include        http://www.8tracks.com/*
// @include        https://www.8tracks.com/*
// @require        http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js
// ==/UserScript==

$(document).ready(function(){
    $('#headerboard').remove();
    $('#sidebar_ad_wrapper').remove();
});
