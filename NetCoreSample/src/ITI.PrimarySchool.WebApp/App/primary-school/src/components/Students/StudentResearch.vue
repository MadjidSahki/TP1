<template>
<div>
    <h1>Rechercher un élève</h1>

     <form @submit="onSubmit($event)">
            <div class="form-group">
                <label class="required">Nom</label>
                <input type="text" v-model="item.FirstName" class="form-control" required>
            </div>
    <button type="submit" class="fa fa-search"></button>
    </form>
</div>
</template>

<script>
import { mapActions } from 'vuex'
import StudentApiService from '../../services/StudentApiService';

export default {
     data() {
            return {
                item:{}
            }
        },

        async mounted() {
        },

        methods: {
           ...mapActions(['notifyLoading', 'notifyError']),
   
        async onSubmit(e) {
            e.preventDefault();

            var errors = [];

            this.errors = errors;
           console.log(this.item.FirstName);
            if (errors.length == 0) {
                 
                try {
                    this.notifyLoading(true);
                        this.$router.replace("/ResearchResult/studentFirstName/" + this.item.FirstName);
                        console.log('laaaaaaaaaaaaaaa');
                }
                catch (error) {
                    this.notifyError(error);
                }
                finally {
                    this.notifyLoading(false);
                }
            }
        }
        }
}
</script>

<style lang="scss">

</style>
