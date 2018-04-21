<template>
    <div class="row with-height">
        <canvas ref="canvas" width="900" height="400"></canvas>
    </div>
</template>
<script>
    import VueCharts from 'vue-chartjs'
    import {Line} from 'vue-chartjs'

    export default {
        extends: Line,
        mounted () {
            this.renderChart({
                labels: ['Luni', 'Marti', 'Miercuri', 'Joi', 'Vineri'],
                datasets: [
                    {
                        label: 'Intrebari',
                        data: [70, 39, 25, 62, 39],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                    },
                    {
                        label: 'Raspunsuri',
                        data: [30, 38, 24, 20, 30],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                    }
                ]
            }, {responsive: true, maintainAspectRatio: false})
        }
    }
</script>
<style>
    .with-height{
        height: 400px;
    }
</style>