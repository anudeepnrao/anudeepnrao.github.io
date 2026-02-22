const projects = document.getElementById('projects');
const listViewButton = document.getElementById('list-view');
const gridViewButton = document.getElementById('grid-view');

function setProjectsView(viewClass) {
  projects.classList.remove('project-list', 'project-grid');
  projects.classList.add(viewClass);
}

listViewButton.addEventListener('click', function () {
  setProjectsView('project-list');
});

gridViewButton.addEventListener('click', function () {
  setProjectsView('project-grid');
});
