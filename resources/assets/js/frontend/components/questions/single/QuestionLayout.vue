<template>
    <div>
        <div class="col-md-12">
            <div class="card card-accent-info">
                <div class="card-header">
                    <i class="fa fa-check"></i> Intrebarea (?)
                    <div class="card-actions">
                        <a href="#" class="btn-setting"><i class="icon-settings"></i></a>
                        <a href="#" class="btn-minimize" data-toggle="collapse" data-target="#collapseExample" aria-expanded="true"><i class="icon-arrow-up"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <p v-html="question.content"></p>
                </div>
                <div class="card-footer">
                    <small>Views <span class="badge badge-primary badge-pill">{{question.views}}</span></small>
                    <button class="btn  btn-sm btn-success" @click="like()">
                        <i class="fa fa-thumbs-up"></i> Like
                    </button>
                    <span class="badge badge-primary badge-pill">{{likes}}</span>
                    <button class="btn btn-sm  btn-danger" @click="dislike()">
                        <i class="fa fa-thumbs-down"></i> Dislike
                    </button>
                    <span class="badge badge-primary badge-pill">{{dislikes}}</span>
                </div>
            </div>
        </div>
        <comments-list :user="user" :question="question"></comments-list>
    </div>
</template>
<script>
    import API from '../../../api';
    import CommentsList from '../../comments/List.vue';

    export default {
        name: 'QuestionLayout',
        components: {
            CommentsList
        },
        props: ['question', 'user'],
        created() {
            console.log(this.question, 'this question');
            console.log(this.user, 'this user');
        },
        data() {
            return {
                dislikes: this.question.dislikes,
                likes: this.question.likes
            }
        },
        methods: {
            async like() {
                this.$notify({
                    group: 'foo',
                    type: 'success',
                    title: 'Notificare',
                    text: 'Like-ul a fost aprobat'
                });
                await API.Question.like(this.question.id);
                this.likes++;
            },
            async dislike() {
                this.dislikes++;
                this.$notify({
                    group: 'foo',
                    type: 'success',
                    title: 'Notificare',
                    text: 'Disike-ul a fost aprobat'
                });
                await API.Question.dislike(this.question.id);

            },
        }
    }
</script>