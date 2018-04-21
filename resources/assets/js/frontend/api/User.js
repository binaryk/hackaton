import axios from 'axios';

export default new class {
    filter(data) {
        return axios.post('/users/filter', data);
    }
}