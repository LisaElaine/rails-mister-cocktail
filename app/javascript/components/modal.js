
// document.ready(function() {
//   ('#add-btn').on('click', function() { ('#new-dose-form').submit(); });
// });


function initAddDoseOnClick() {
  const form = document.querySelector('#new_dose');
  if (form) {
    document.querySelector('#add-btn').addEventListener('click', () => {
      form.submit();
    });
  }
}

export { initAddDoseOnClick };
