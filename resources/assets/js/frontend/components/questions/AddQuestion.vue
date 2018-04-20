<template>
    <div class="container">
        <div class="row">
            <div class="col-12 with-padding" >
                <quill-editor :content="form.description"
                              :options="editorOption"
                              @change="update($event)">
                </quill-editor>
            </div>
            <div class="col-12 with-padding">
                <select name="disciplines" id="" v-model="form.discipline" class="form-control">
                    <option value="" disabled selected>Selecteaza disciplina</option>
                    <option value="Matematica">Matematica</option>
                    <option value="Istorie">Istorie</option>
                </select>
            </div>
            <div class="col-12 with-padding">
                <button class="btn btn-primary" @click="submit">Trimite</button>
            </div>
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
                    description: '',
                    discipline: null
                },
            }
        },
        methods: {
            update($event) {
                this.form.description = $event.html;
            },
            async submit(){
                const list = await API.Question.store(this.form).then(res => {
                    console.log(list, 'added with success');
                });

            }
        }
    }
</script>
<style scoped>
    .with-padding{
        padding: 15px;
    }
</style>