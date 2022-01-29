if (typeof importScripts === "function") {
    importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
    importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");
    importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-analytics.js");
}
var firebaseConfig = {
    apiKey: "AIzaSyAI6Ne4Oi6JgNYHEWp_MVysLS2X3XQ_jI4",
    authDomain: "relab-crv.firebaseapp.com",
    projectId: "relab-crv",
    storageBucket: "relab-crv.appspot.com",
    messagingSenderId: "583613066440",
    appId: "1:583613066440:web:963f524747f965aa9009fd",
    measurementId: "G-KS5EHT3TRG"
};
if (!firebase.apps.length) {
    firebase.initializeApp(firebaseConfig);
}
const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});

self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});