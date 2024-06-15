import { LineChart } from 'chartist';

const data = {
  labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
  series: [
    [5, 2, 4, 2, 0]
  ]
};

document.addEventListener('turbo:load', function() {
  document.querySelectorAll('.ct-chart').forEach(function(element){
    new LineChart(element, data)
  })
})

