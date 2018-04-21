<template>
    <div>
        <div class="card">
            <div class="card-header">
                <i class="fa fa-align-justify"></i> Comentarii
                <small>cele mai recente</small>
            </div>
            <div class="card-body">
                <div class="list-group">
                    <comment v-for="comment, index in comments" :comment="comment" :user="user" :key="index"></comment>
                </div>
            </div>
        </div>
        <add-comment :user_id="user.id" :question_id="question.id" @on-submit="submitComment"></add-comment>
    </div>
</template>
<script>
    import comment from './Comment.vue'
    import API from '../../api/index.js';
    import Add from './AddComment.vue';
    export default {
        props: ['question', 'user'],
        components: {
            comment
        },
        created(){
            API.Comment.list({question_id: this.question.id}).then(res => {
                this.comments = res.data;
            })
        },
        data(){
            return {
                comments: []
            }
        },
        methods: {
            submitComment(comment) {
                console.log(comment, 'comment');
                this.comments.unshift(comment);
            }
        }
    }
</script>
<style>
    .list-group-item{
        margin-bottom: 10px;
    }
</style>