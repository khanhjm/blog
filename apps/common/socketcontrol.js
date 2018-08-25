module.exports = function(io) {
    var usernames = [];
    io.sockets.on("connection", function(socket) {        
        // Listen adduser event
        socket.on("add_user", function(username) {
            // Save user
            socket.username = username;
            usernames.push(username);
            
            // Notify to myself
            var data = {
                sender: "SERVER",
                message: "You have join chat room"
            };
            socket.emit("update_message", data);

            // Notify to other users
            var data = {
                sender: "SERVER",
                message: "<b><i>" + username + "<i></b> has join to chat room"
            };
            socket.broadcast.emit("update_message", data);
        });

        // Listen send_message event
        socket.on("send_message", function(message) {
            // Notify to myself
            var data = {
                sender: "You",
                message: message
            };
            socket.emit("update_message", data);

            // Notify to other user
            var data = {
                sender: socket.username,
                message: message
            };
            socket.broadcast.emit("update_message", data);
        });

        // Listen disconnect event
        socket.on("disconnect", function() {
            // Delete username
            for(var i=0; i< usernames.length; i++) {
                if(usernames[i] == socket.username) {
                    usernames.splice(i, 1);
                }
            }

            // Notify to other user
            var data = {
                sender: "SERVER",
                message: "<span style='color: red;'>" + socket.username + " has left</span>"
            };
            socket.broadcast.emit("update_message", data);
        })
    });
}