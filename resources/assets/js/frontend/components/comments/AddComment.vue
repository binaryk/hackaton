<template>

    <div class="card">
        <div class="card-header">
            <strong>Adauga commentariu</strong>
        </div>
        <div class="card-body">
            <div class="form-group row">
                <div class="col-md-12">
                    <quill-editor :content="form.content"
                                  :options="editorOption"
                                  @change="update($event)">
                    </quill-editor>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <button type="button" class="btn btn-sm btn-primary right" @click="submit"><i class="fa fa-dot-circle-o"></i> Trimite</button>
        </div>
    </div>

</template>

<script>
    import 'quill/dist/quill.core.css';
    import 'quill/dist/quill.snow.css';
    import 'quill/dist/quill.bubble.css';

    import { quillEditor } from 'vue-quill-editor';
    import { toolbar } from '../config'

    import API from '../../api/index.js';
    export default {
        props: ['user_id', 'question_id'],
        components: {
            quillEditor
        },
        data(){
            return {
                form : {
                    content: '',
                    user_id: null,
                    question_id: null
                },
                editorOption: {
                    modules: {
                        toolbar: toolbar
                    }
                },
            }
        },
        created(){
            this.form.user_id = this.user_id;
            this.form.question_id = this.question_id;
        },
        methods: {
            update($event) {
                this.form.content = $event.html;
            },
            async submit(){
                const comment = await API.Comment.store(this.form);
                this.$emit('on-submit', comment.data);
                this.form.content = "";
                this.form.question_id = null;
                this.form.user_id = null;
            }
        }

    }
</script>
<style>
    .right{
        float: right;
    }
    .ql-container{
        height: 100px;
    }
</style>