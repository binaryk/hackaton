import axios from 'axios';

export default new class {
    translate(data) {
        return axios.post(`/google`, data);
    }

};
