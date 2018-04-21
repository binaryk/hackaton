<template>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-align-justify"></i> Raport de activitate
            </div>
            <div class="card-body">
                <div class="col-md-12 mb-2">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab"  href="#tab_1" role="tab" aria-controls="tab_!">Saptamanal</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tab_2" role="tab" aria-controls="tab_2">Per scoala</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_1" role="tabpanel">
                            <weekchart></weekchart>
                        </div>
                        <div class="tab-pane" id="tab_2" role="tabpanel">
                            <schoolchart></schoolchart>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import weekchart from './WeekChart.vue'
    import schoolchart from './SchoolChart.vue'
    export default {
        components: {
            weekchart,
            schoolchart
        }
    }
</script>