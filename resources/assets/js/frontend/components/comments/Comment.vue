<template>
    <div class="list-group-item list-group-item-action flex-column align-items-start">
        <div class="card">
            <div class="card-header">
                <div class="d-flex w-100 ">
                    <span class="name">{{ comment.user.full_name}}</span>
                    <small>{{ comment.created_at }}</small>
                </div>
            </div>
            <div class="card-body">
                <p class="mb-1" v-html="comment.content"></p>
            </div>
            <div class="card-footer">
                <button class="btn  btn-sm btn-success" @click="like()">
                    <i class="fa fa-thumbs-up"></i> Like
                </button>

                <span class="badge badge-primary badge-pill">{{comment.likes}}</span>

                <button class="btn btn-sm  btn-danger" @click="dislike()">
                    <i class="fa fa-thumbs-down"></i> Dislike
                </button>
                <span class="badge badge-primary badge-pill">{{comment.dislikes}}</span>
                <span class="answer" v-bind:class="{ answered: comment.isAnswer }"><i v-if="isTeacher || 1" @click="answer()" title="Este raspunsul corect?" class="icon-check icons font-2xl d-block mt-4"></i></span>
            </div>
        </div>
    </div>
</template>
<script>
    import API from '../../api';
    export default {
        name: 'comment',
        props: ['comment', 'user'],
        created() {
            console.log(this.user.roles[0].name, 'user');
        },
        computed: {
            isTeacher() {
                return this.user.roles[0] && this.user.roles[0].name === 'teacher';
            }
        },
        methods: {
            async like() {
                await API.Comment.like(this.comment.id).then(res => {
                    this.comment.likes++;
                });

            },
            async dislike() {
                await API.Comment.dislike(this.comment.id).then(res => {
                    this.comment.dislikes++;
                });
            },
            async answer() {
                await API.Comment.answer(this.comment.id);
                this.comment.isAnswer = 1;
                this.$notify({
                    group: 'foo',
                    type: 'success',
                    title: 'Notificare',
                    text: 'Multumim pentru raspuns!'
                });
            }
        }
    }
</script>
<style lang="scss">
    .name{
        margin-right: 15px;
    }
    .answer {
        display: inline-block;
        cursor: pointer;
    }

    .answered {
        color: #1ebb6e;
    }
</style>