<template>
    <div class="card">
        <div class="card-header">
            <strong>Adauga intrebarea aici</strong>
        </div>
        <div class="card-body">
            <div class="form-group row">
                <label class="col-md-3 col-form-label" >Question </label>
                <div class="col-md-9">
                    <quill-editor :content="form.content"
                                  :options="editorOption"
                                  @change="update($event)">
                    </quill-editor>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label" for="select1">Disciplina</label>
                <div class="col-md-9">
                    <select id="select1" name="select1" v-model="form.discipline_id" class="form-control">
                        <option value="0">Please select</option>
                        <option v-for="item, index in disciplines" :key="index" :value="item.id">{{ item.name }}</option>
                    </select>
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
        props: ['user_id'],
        components: {
            quillEditor
        },
        data (){
            return {
                editorOption: {
                    modules: {
                        toolbar: toolbar
                    }
                },
                form: {
                    content: '',
                    discipline_id: null,
                    user_id: null
                },
                disciplines: []
            }
        },
        created(){
            this.form.user_id = this.user_id;
            API.Discipline.list().then(res => {
                this.disciplines = res.data;
            })
        },
        methods: {
            update($event) {
                this.form.content = $event.html;
            },
            async submit(){
                const list = await API.Question.store(this.form);
                this.$emit('on-submit', list);
                this.form.content = "";
                this.form.discipline_id = null;
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
