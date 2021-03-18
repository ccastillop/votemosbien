import Rails from '@rails/ujs'

document.addEventListener('change', (event) => {
  if (!event.target.matches('.js-submit-on-click') ) {
    return
  }
  //event.target.closest('form').submit()
  Rails.fire( event.target.closest('form'), 'submit')
})

document.addEventListener('input', (event) => {
  if (!event.target.matches('.js-submit-on-input')) {
    return
  }
  //event.target.closest('form').submit()
  Rails.fire(event.target.closest('form'), 'submit')
})