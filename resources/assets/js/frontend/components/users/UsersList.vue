<template>
    <div>
        <div class="col-md-12" v-if="activeTab == 'students'">
            <div class="card">
                <div class="card-body">
                    <div class="switch-container col-md-12">
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
                        <button class="btn btn-success " v-on:click="filter()" >Filter</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="col-md-12 mb-2">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" @click="setActiveTab('students')" href="#home" role="tab" aria-controls="home">Studenti</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" @click="setActiveTab('teachers')" href="#profile" role="tab" aria-controls="profile">Profesori</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="home" role="tabpanel">
                                <div class="form-group">
                                    <input type="text" name="search" v-model="searchUser" class="form-control" placeholder="Cauta">
                                </div>
                                <div class="row">
                                    <user v-for="user in usersList" :key="user.id" :user="user"></user>
                                </div>
                            </div>
                            <div class="tab-pane" id="profile" role="tabpanel">
                                <div class="form-group">
                                    <input type="text" name="search" v-model="searchTeacher" class="form-control" placeholder="Cauta">
                                </div>
                                <div class="row">
                                    <user v-for="user in teachersList" :key="user.id" :user="user"></user>
                                </div>
                            </div>
                        </div>
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
        props: ['users', 'teachers'],
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
                usersList: this.users,
                teachersList: this.teachers,
                activeTab: 'students',
                searchUser: '',
                searchTeacher: ''
            }
        },
        watch: {
            searchUser: function (value) {
                if(value.length > 3) {
                    this.usersList = this.usersList.filter((user) => {
                        return !user.user.full_name.toLowerCase().indexOf(value.toLowerCase());
                    })
                }else {
                    this.usersList = this.users;
                }
            },
            searchTeacher: function (value) {
                if(value.length > 3) {
                    this.teachersList = this.teachersList.filter((user) => {
                        return !user.user.full_name.toLowerCase().indexOf(value.toLowerCase());
                    })
                }else {
                    this.teachersList = this.teachers;
                }
            },
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
            },
            setActiveTab(tab){
                this.activeTab = tab;
            }
        }
    }
</script>
<style>
    .selected-items {
        padding: 10px;
    }
</style>
