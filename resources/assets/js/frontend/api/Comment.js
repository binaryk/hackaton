import axios from 'axios';

export default new class {
    list(){
        return axios.get('comments');
    }
    store(data){
        return axios.post('/comments', data);
    }
}