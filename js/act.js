document.getElementById('list-view').addEventListener('click', function() {
    document.getElementById('projects').className = 'project-list';
  });
  
  document.getElementById('grid-view').addEventListener('click', function() {
    document.getElementById('projects').className = 'project-grid';
  });