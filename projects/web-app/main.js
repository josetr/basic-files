function main() {
  const message = document.getElementById('message');
  if (!message) return;
  message.textContent = 'Loaded from bundled assets.';
}

window.addEventListener('DOMContentLoaded', main);
