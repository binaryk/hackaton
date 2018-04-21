<template>
    <div class="col-md-12">
        <div class="card card-accent-info">
            <div class="card-header">
                <i class="fa fa-check"></i>Content
                <div class="card-actions">
                    <a href="#" class="btn-setting"><i class="icon-settings"></i></a>
                    <a href="#" class="btn-minimize" data-toggle="collapse" data-target="#collapseExample" aria-expanded="true"><i class="icon-arrow-up"></i></a>
                </div>
            </div>
            <div class="card-body">
                {{ question.content }}
            </div>
            <div class="card-footer">
                <small>Views <span class="badge badge-primary badge-pill">{{question.views}}</span></small>
                <button class="btn btn-sm  btn-danger" @click="dislike()">
                    <i class="fa fa-thumbs-down"></i> Dislike
                </button>
                <span class="badge badge-primary badge-pill">{{question.dislikes}}</span>
                <button class="btn  btn-sm btn-success" @click="like()">
                    <i class="fa fa-thumbs-up"></i> Like
                </button>
                <span class="badge badge-primary badge-pill">{{question.likes}}</span>
            </div>
        </div>
    </div>
</template>
<script>
    import API from '../../../api';
    export default {
        name: 'QuestionLayout',
        props: ['question'],
        created() {
            console.log(this.question, 'this question');
        },
        methods: {
            async like() {
                await API.Question.like(this.question.id);
                this.question.likes++;

            },
            async dislike() {
                await API.Question.dislike(this.question.id);
                this.question.dislikes++;

            },
        }
    }
</script>