<template>

  <div id="scoreGauge">
    <div id="chart">
      <VueApexCharts type=radialBar height=350 :options="chartOptions" :series="[score]" />
    </div>
  </div>

</template>

<script>
  import VueApexCharts from 'vue-apexcharts'

  export default {
    name: 'scoreGauge',
    props: ['score'],
    components: {
      VGauge,
      VueApexCharts
    },
    data: function () {
      return {
        computedScore: [0], 
        chartOptions: {
          chart: {
            toolbar: {
              show: false
            }
          },
          plotOptions: {
            radialBar: {
              startAngle: -135,
              endAngle: 225,
              hollow: {
                margin: 0,
                size: '70%',
                background: '#fff',
                position: 'front',
                dropShadow: {
                  enabled: true,
                  top: 3,
                  left: 0,
                  blur: 4,
                  opacity: 0.24
                }
              },
              track: {
                background: '#fff',
                strokeWidth: '67%',
                margin: 0, // margin is in pixels
                dropShadow: {
                  enabled: true,
                  top: -3,
                  left: 0,
                  blur: 4,
                  opacity: 0.35
                }
              },

              dataLabels: {
                name: {
                  offsetY: -10,
                  show: true,
                  color: '#888',
                  fontSize: '17px'
                },
                value: {
                  formatter: function (val) {
                    return parseInt(val);
                  },
                  color: '#111',
                  fontSize: '36px',
                  show: true,
                }
              }
            }
          },
          fill: {
            colors: [function({ value }) {
                    if(value <= 40) {
                        return '#f23e35'
                    } else if (value > 40 && value < 60) {
                        return '#b2cfff'
                    } else {
                        return '#4fff60'
                    }
                }],
            
          },
          stroke: {
            lineCap: 'round'
          },
          labels: ['Happiness %'],
        }
      }
    }
  }
</script>

<style scoped>
</style>
