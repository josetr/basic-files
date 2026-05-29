import { items } from './src/data.js';

function main() {
  const list = document.getElementById('list');
  if (!list) return;

  list.replaceChildren(
    ...items.map((item) => {
      const li = document.createElement('li');
      li.textContent = item;
      return li;
    }),
  );
}

window.addEventListener('DOMContentLoaded', main);
