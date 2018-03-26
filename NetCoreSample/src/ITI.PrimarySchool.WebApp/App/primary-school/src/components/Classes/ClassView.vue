<template>
    <div>
       <h1> Vue détaillée de la classe </h1><br>
       <div class="form-group">
           <h3> Nom de la classe : {{item.name}} / niveau : {{item.level}}</h3><br>

            <h4>Professeur en charge : </h4>
               <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                        </tr>
                        <tr>
                            <td> {{item.teacherId}}</td>
                            <td> {{item.teacherLastName}} </td>
                            <td> {{item.teacherFirstName}} </td>
                        </tr>
                    </thead>
               </table>
               <h4>Liste des elèves</h4>
               <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                        </tr>
                         <tr v-for="i of item.students">
                             <td>{{i.studentId}}</td>
                             <td>{{i.lastName}}</td>
                             <td>{{i.firstName}}</td>
                         </tr>
                    </thead>
               </table>
              
        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import ClassApiService from '../../services/ClassApiService'

    export default {
        data() {
            return {
               studentList:[],
               item:{},
               mode: null,
               id: null
            }
        },

        async mounted() {
            this.mode = this.$route.params.mode;
            this.id = this.$route.params.id;
            this.item = await ClassApiService.getClassAsync(this.id);
        },

        methods: {
        ...mapActions(['executeAsyncRequestOrDefault','executeAsyncRequest']),
        }
    }
</script>

<style lang="scss">

</style>