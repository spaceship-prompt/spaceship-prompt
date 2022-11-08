function initRegistry(list, input) {
  const registryType = input ? input.getAttribute('data-registry') : null;

  const registry = registryType
    ? fetch(`/registry/${registryType}.json`)
        .then(res => res.json())
        .then(registry => registry.sections)
    : Promise.all([
        fetch('/registry/internal.json').then(res => res.json()),
        fetch('/registry/external.json').then(res => res.json()),
      ])
        .then(([internal, external]) => ([
          ...internal.sections,
          ...external.sections
        ]));

  registry.then(sections => {
    list.innerHTML = sections
      .sort((a, b) => a.name.localeCompare(b.name))
      .map(item => `
        <a href="${item.url}">
          <li>
            <strong>
              ${item.name}
              ${item.internal ? '<em>internal</em>' : ''}
            </strong>
            ${item.description}
          </li>
        </a>
      `)
      .join('');
  });

  input.addEventListener('keyup', _.debounce(e => {
    console.log(e.target.value);
    const query = e.target.value.toLowerCase().trim();

    Array.from(list.children).forEach(item => {
      if (item.innerText.toLowerCase().includes(query)) {
        item.style.display = '';
      } else {
        item.style.display = 'none';
      }
    })
  }, 300));
}

const observer = new MutationObserver(mutations => {
  const list = document.querySelector('#sections-list');
  const input = document.querySelector('#sections-search');

  if (list && input) {
    initRegistry(list, input);
  }
});

observer.observe(document.body, {childList: true});
