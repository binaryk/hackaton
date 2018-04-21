<template>
    <div>
        <div class="card">
            <div class="card-body">
                <div class="switch-container col-md-12">
                    <div class="btn-group show">
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            Selecteaza institutia
                        </button>
                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 35px, 0px); top: 0px; left: 0px; will-change: transform;">
                            <a class="dropdown-item" hchref="#" v-for="s in schools" :key="s.id">
                                <input type="checkbox" value="1" v-on:click="changeSchool(s)">
                                {{ s.name }}
                            </a>
                        </div>
                    </div>
                    <div class="btn-group show">
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            Selecteaza materiile
                        </button>
                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 35px, 0px); top: 0px; left: 0px; will-change: transform;">
                            <a class="dropdown-item" hchref="#" v-for="s in disciplines" :key="s.id">
                                <input type="checkbox" value="1" v-on:click="changeDisciplines(s)">
                                {{ s.name }}
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-12 selected-items" v-if="selectedSchools.length > 0">
                    Scoli:
                    <button type="button" class="btn btn-labeled btn-info" v-on:click="changeSchool(s)" v-for="s in selectedSchools">
                        <span class="btn-label"><i class="fa fa-times" ></i></span>&nbsp; {{ s.name }}
                    </button>

                </div>
                <br />
                <div class="col-12 selected-items" v-if="selectedDisciplines.length > 0">
                    Materii:
                    <button type="button" class="btn btn-labeled btn-info" v-on:click="changeDisciplines(s)" v-for="s in selectedDisciplines">
                        <span class="btn-label" ><i class="fa fa-times" ></i></span>&nbsp; {{ s.name }}
                    </button>

                </div>
                <div class="col-12">
                    <button class="btn btn-success " v-on:click="filter()" :disabled="selectedDisciplines.length == 0 && selectedSchools.length == 0">Filter Questions</button>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <user v-for="user in usersList" :key="user.id" :user="user"></user>
                    </div>
                </div>
                <div class="card-footer">Toti utilizatorii</div>
            </div>
        </div>

    </div>
</template>
<script>
    import User from './User.vue';
    import API from '../../api/index.js';
    export default {
        name: 'UsersList',
        props: ['users'],
        components: {
            User
        },
        data(){
            return {
                schools: [],
                disciplines: [],
                selectedDisciplines: [],
                selectedSchools: [],
                currentView: 1,
                sort: null,
                usersList: this.users
            }
        },
        async created() {
            const schools = await API.School.list();
            const disciplines = await API.Discipline.list();
            this.schools = schools.data;
            this.disciplines = disciplines.data;

        },
        methods: {
            changeDisciplines(discipline) {
                let find = this.selectedDisciplines.findIndex((d) => {return d.id === discipline.id});
                if(find === -1)
                    this.selectedDisciplines.push(discipline);
                else
                    this.selectedDisciplines.splice(find, 1);

                console.log(this.selectedDisciplines);
            },

            changeSchool(id) {
                let index = this.selectedSchools.indexOf(id);
                if(index === -1)
                    this.selectedSchools.push(id);
                else
                    this.selectedSchools.splice(find, 1);
            },


            async filter() {
                const disciplines = this.selectedDisciplines.map((discipline) => {return discipline.id});
                const schools = this.selectedSchools.map((school) => {return school.id});

                let list = await API.User.filter({disciplines: disciplines, schools: schools});
                this.usersList = list.data;
            }
        }
    }
</script>
<style>
    .selected-items {
        padding: 10px;
    }
</style>