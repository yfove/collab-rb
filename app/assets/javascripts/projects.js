// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener('DOMContentLoaded', () => {
  const roles = [];
  const addRoleButton = document.querySelector('.add-role--button');
  if (addRoleButton !== null) {
    addRoleButton.addEventListener('click', e => {
      e.preventDefault();
      const role = document.querySelector('.add-role--input').value;
      roles.push(role);
      document.querySelector('.roles--container').innerHTML += `<div style="display: inline-block; margin-left: 0.25em">${role}</a>`;
      document.querySelector('.add-role--input').value = '';
      document.querySelector('.roles').value = roles.join(',');
    })
  }
})
