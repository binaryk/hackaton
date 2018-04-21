<template>
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-align-justify"></i> Comentarii
                <small>cele mai recente</small>
            </div>
            <div class="card-body">
                <div class="list-group">
                    <comment v-for="comment, index in comments" :comment="comment" :key="index"></comment>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import comment from './Comment.vue'
    import API from '../../api/index.js';
    export default {
        props: ['question_id'],
        components: {
            comment
        },
        created(){
            API.Comment.list({question_id: this.question_id}).then(res => {
                this.comments = res.data;
            })
        },
        data(){
            return {
                comments: []
            }
        }
    }
</script>
<style>
    .list-group-item{
        margin-bottom: 10px;
    }
</style>