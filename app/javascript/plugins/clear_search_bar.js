const clearInput = () => {
  const input = document.querySelector('#searchInput');
  const cross = document.querySelector('.clear-input');
  cross.addEventListener('click', (event) => {
    if (input.value !== "") {
      input.value = "";
      cross.classList.add("d-none");
    }
  })
}

export { clearInput }
