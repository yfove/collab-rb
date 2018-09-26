// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

let roles = [];
const applicants = [];

document.addEventListener('DOMContentLoaded', () => {
  const addRoleButton = document.querySelector('.add-role--button');
  const rolesElement = document.querySelector('.roles')
  if (rolesElement !== null) {
    const rolesString = rolesElement.value;
    roles = rolesString !== '' ? rolesString.split(',') : [];
  };

  if (addRoleButton !== null) {
    addRoleButton.addEventListener('click', e => {
      e.preventDefault();
      const role = document.querySelector('.add-role--input').value;
      roles.push(role);
      console.log(roles)
      document.querySelector('.roles--container').innerHTML += `<button type="button" name="button" onclick="deleteRole(this)">${role}</button>`;
      document.querySelector('.add-role--input').value = '';
      document.querySelector('.roles').value = roles.join(',');
    })
  }
})

const deleteRole = roleElement => {
  roles = roles.filter(role => role !== roleElement.textContent);
  document.querySelector('.roles').value = roles.join(',');
  const parent = document.querySelector('.roles--container')
  parent.removeChild(roleElement)
}
