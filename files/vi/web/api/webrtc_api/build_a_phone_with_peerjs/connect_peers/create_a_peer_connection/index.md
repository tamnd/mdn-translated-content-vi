---
title: Tạo kết nối ngang hàng
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Create_a_peer_connection
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Show_hide_html", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Creating_a_call")}}

Tiếp theo, bạn muốn đảm bảo người dùng của mình có cách kết nối với đồng nghiệp của họ. Để kết nối hai đồng nghiệp, bạn sẽ cần ID ngang hàng của một trong số họ.

1. Hãy tạo một biến chứa ID và một hàm để yêu cầu người dùng nhập nó mà chúng ta sẽ gọi sau. Thêm phần này vào cuối `script.js`:

   ```js
   let code;
   function getStreamCode() {
     code = window.prompt("Please enter the sharing code");
   }
   ```

   Phương thức [`window.prompt()`](/en-US/docs/Web/API/Window/prompt) cung cấp một cách thuận tiện để nhận ID ngang hàng có liên quan — bạn có thể sử dụng phương pháp này khi muốn thu thập ID ngang hàng cần thiết để tạo kết nối.

2. Sử dụng khung ngang hàng, bạn sẽ muốn kết nối `localPeer` với `remotePeer`. PeerJS cung cấp cho chúng ta hàm `connect()`, hàm này cần có ID ngang hàng để kết nối. Thêm khối này bên dưới mã trước đó của bạn:

   ```js
   let conn;
   function connectPeers() {
     conn = peer.connect(code);
   }
   ```

3. Khi một kết nối được tạo, hãy sử dụng `on('connection')` của khung PeerJS để đặt ID của thiết bị ngang hàng từ xa và mở kết nối. Hàm dành cho trình nghe này chấp nhận một đối tượng `connection` là một phiên bản của đối tượng `DataConnection` (là một trình bao bọc xung quanh [`RTCDataChannel`](/en-US/docs/Web/API/RTCDataChannel) của WebRTC); trong hàm này bạn sẽ muốn gán nó cho một biến. Một lần nữa, bạn sẽ muốn tạo biến bên ngoài hàm để có thể gán nó sau này. Thêm phần sau vào bên dưới mã trước đó của bạn:

   ```js
   peer.on("connection", (connection) => {
     conn = connection;
   });
   ```

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Show_hide_html", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Creating_a_call")}}
