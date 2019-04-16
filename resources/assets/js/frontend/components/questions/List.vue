<template>
    <div class="col-sm-12 col-xl-12">
        <div class="card">
            <div class="card-header">
                Dashboard
            </div>
            <div class="card-body">
                <add :user_id="user.id" @on-submit="onStore"></add>
            </div>
        </div>
        <div class="card">
            <div class="switch-container col-md-12">
                <div class="btn-group show">
                    <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Selecteaza materiile
                    </button>
                    <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 35px, 0px); top: 0px; left: 0px; will-change: transform;">
                        <a class="dropdown-item" hchref="#" v-for="s in disciplines" :key="s.id">
                            <input type="checkbox" value="1" :checked="isSelectedDiscipline(s.id)" v-on:click="changeDisciplines(s)">
                            {{ s.name }}
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-12 selectedItems" v-if="selectedSchools.length > 0">
                Scoli:
                <button type="button" class="btn btn-labeled btn-info" v-on:click="changeSchool(s)" v-for="s in selectedSchools">
                    <span class="btn-label"><i class="fa fa-times" ></i></span>&nbsp; {{ s.name }}
                </button>
                <br />
            </div>

            <div class="col-12 selectedItems" v-if="selectedDisciplines.length > 0">
                Materii:
                <button type="button" class="btn btn-labeled btn-info" v-on:click="changeDisciplines(s)" v-for="s in selectedDisciplines">
                    <span class="btn-label" ><i class="fa fa-times" ></i></span>&nbsp; {{ s.name }}
                </button>
            </div>
            <div class="col-12">
                <button class="btn btn-success " v-on:click="filter()">Filter Questions</button>
            </div>
            <br />
            <div class="card-header">
                <i class="fa fa-align-justify"></i> Intrebari
                <small>cele mai recente</small>
                <div class="pull-right" style="float:right">
                    Order by:
                    <span class="badge badge-pill " v-bind:class="{'badge-secondary': (sort == 'updated_at'),  'badge-primary': (sort !== 'updated_at')}" v-on:click="sortQuestions('updated_at')">Date</span>
                    <span class="badge badge-pill " v-bind:class="{'badge-secondary': (sort == 'likes'),  'badge-primary': (sort !== 'likes')}" v-on:click="sortQuestions('likes')">Likes</span>
                    <span class="badge badge-pill " v-bind:class="{'badge-secondary': (sort == 'dislikes'),  'badge-primary': (sort !== 'dislikes')}" v-on:click="sortQuestions('dislikes')">Dislikes</span>
                </div>
            </div>
            <div class="card-body">
                <div class="list-group">

                    <question v-for="q in list" :question="q" :key="q.id"></question>

                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Question from './Question.vue';
    import Add from './AddQuestion.vue';
    import API from '../../api/index.js';
    export default {
        name: 'QuestionsList',
        props: ['user'],
        components: {
            Question,
            Add
        },
        data() {
            return {
                list: [],
                schools: [],
                disciplines: [],
                selectedDisciplines: [],
                selectedSchools: [],
                currentView: 1,
                sort: null,
            }
        },
        async created() {
            const schools = await API.School.list();
            const disciplines = await API.Discipline.list();
            const list = await API.Question.list();
            this.list = list.data;
            this.schools = schools.data;
            this.disciplines = disciplines.data;
        },
        methods: {
            onStore(post) {
                this.list.unshift(post.data);
            },

            changeDisciplines(discipline) {
                let find = this.selectedDisciplines.findIndex((d) => {return d.id === discipline.id});
                if(find === -1)
                    this.selectedDisciplines.push(discipline);
                else
                    this.selectedDisciplines.splice(find, 1);

                console.log(this.selectedDisciplines);
            },

            changeSchool(school) {
                let find = this.selectedSchools.findIndex((d) => {return d.id === school.id});
                if(find === -1)
                    this.selectedSchools.push(school);
                else
                    this.selectedSchools.splice(find, 1);
            },

            sortQuestions(type) {
                this.sort = type;
                this.filter();
            },

            async filter() {
                const disciplines = this.selectedDisciplines.map((discipline) => {return discipline.id});
                const schools = this.selectedSchools.map((school) => {return school.id});

                const list = await API.Question.filter({sort: this.sort, disciplines: disciplines, schools: schools});
                this.list = list.data;
            },

            isSelectedDiscipline(id) {
                let find = this.selectedDisciplines.findIndex((d) => {return d.id === id});
                if(find === -1){
                    return false;
                }
                return true;
            },

            isSelectedSchool(id) {
                let find = this.selectedSchools.findIndex((d) => {return d.id === id});
                if(find === -1){
                    return false;
                }
                return true;
            }
        }

    }
</script>
<style lang="scss">
    .switch-container {
        margin: 10px 0;
    }
    .list-group a {
        margin-bottom: 10px;
    }
    .badge:hover {
        cursor: pointer;
    }
    .selectedItems{
        margin: 2px 0;
    }
    .selectedItems button{
        margin: 0 5px;
    }

</style>
