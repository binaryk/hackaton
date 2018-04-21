<template>
    <div>
        <div class="col-12">
            <div class="card card-accent-info ">
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
                    <button type="button" class="btn btn-sm btn-primary">
                        <i class="fa fa-eye"></i> &nbsp;
                        <span class="badge badge-light">{{question.views}}</span>
                    </button>

                    <button type="button" class="btn btn-sm btn-danger" @click="dislike($event); return false;">
                        <i class="fa fa-thumbs-down"></i> &nbsp;
                        <span class="badge badge-light">{{dislikes}}</span>
                    </button>

                    <button type="button" class="btn  btn-sm btn-success" @click="like($event); return false;">
                        <i class="fa fa-thumbs-up"></i> &nbsp;
                        <span class="badge badge-light">{{likes}}</span>
                    </button>
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