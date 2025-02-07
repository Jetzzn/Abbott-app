// firebase-messaging-sw.js
importScripts("https://www.gstatic.com/firebasejs/10.0.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.0.0/firebase-messaging-compat.js");

// Firebase Config
const firebaseConfig = {
    apiKey: "AIzaSyC5G5jICwXH7PPuOxwTD-DXUZ3UnxMjZ64",
  authDomain: "abbot-e2d4c.firebaseapp.com",
  projectId: "abbot-e2d4c",
  storageBucket: "abbot-e2d4c.firebasestorage.app",
  messagingSenderId: "262076126066",
  appId: "1:262076126066:web:f7cfe573a00eca064f83eb",
  measurementId: "G-TWEP15F5Y9"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// Handle background messages
messaging.onBackgroundMessage((payload) => {
    console.log("Received background message ", payload);
    self.registration.showNotification(payload.notification.title, {
        body: payload.notification.body,
        icon: "/icons/icon-192x192.png",
    });
});
