/**
 * Created by tiziano on 23/06/15.
 */

function trackEvent(value){
    var socket = io('http://localhost:3000/trackevent');
    socket.emit('log', {
        data: value
    });
}
