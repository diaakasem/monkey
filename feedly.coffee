`// ==UserScript==
// @name        Feedly Enhancer
// @namespace   http://diaa.me/monkey/feedly.enhancer
// @version     0.7
// @description Removes unwanted entries from feedly and highlights the important stuff
// @match       *.feedly.com/*
// @require     http://code.jquery.com/jquery-1.8.3.min.js
// @copyright   2012+, You
// ==/UserScript==`
$(document).ready ->
  removed = [".NET", "Visual studio", "API Spotlight:", "API:", "APIs Used", "Asp.net", "ASP.NET", "ASP.net", "App42", "Azure", "Backbone", "C#", "Dojo", "Enterprise Java", "ExtJs", "GWT", "JSF", "JSP", "Lisp", "MicroSoft", "Microsoft", "New APIs", "PhoneGap", "Power Shell", "PowerShell", "TypeScript", "Typescript", "Visual Studio", "Windows", "asp.net", "microsoft", "windows"]
  highlighted = [
    name: ["javascript", "JavaScript", "Javascript", "JAVASCRIPT"]
    color: "#fff8ee"
  ,
    name: [".js", ".JS"]
    color: "#BBB"
  ,
    name: ["angular", "Angular"]
    color: "#b5d418"
  ,
    name: ["D3", "d3"]
    color: "#14a9df"
  ,
    name: ["test", "Test"]
    color: "#f065b5"
  ,
    name: ["node", "Node"]
    color: "#df7614"
  ]
  doneClass = 'done'
  removeSelector = "div.condensedTools img[title=\"Mark as read and hide\"]"
  parentSelector = "div.u0Entry"
  DivContains = (name, fn) ->
    parents = undefined
    selected = $("#{parentSelector} a:not('.done'):contains(#{name})")
    if selected.length
      parents = selected.parents(parentSelector)
      selected.addClass(doneClass)
      fn parents
    selected = $("span.u0summary:not('.#{doneClass}'):contains(#{name})")
    if selected.length
      parents = selected.parents(parentSelector)
      selected.addClass(doneClass)
      fn parents
  setInterval (->
    $.each removed, (i, item) ->
      DivContains item, (parents) ->
        parents.find(removeSelector).click()

    $.each highlighted, (i, item) ->
      $.each item.name, (j, name) ->
        DivContains name, (parents) ->
          parents.css "background-color", item.color

    $("#{parentSelector} a").click (e) ->
      parents = $(this).parents(parentSelector)
      parents.find(removeSelector).click()

  ), 5000

