export default {
    
    async log (message) {
        // eslint-disable-next-line no-console
        console.log(message + '\r\n');
    },
    async error (message) {
        // eslint-disable-next-line no-console
        console.error(message + '\r\n');
    }
};
