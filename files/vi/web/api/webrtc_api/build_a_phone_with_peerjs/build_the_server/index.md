---
title: Xây dựng máy chủ
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs/Build_the_server
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Setup", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers")}}

Trong bài viết này, chúng tôi sẽ thiết lập máy chủ cho ứng dụng điện thoại của mình. Tệp máy chủ sẽ trông giống như tệp máy chủ Express thông thường với một điểm khác biệt là máy chủ Peer.

1. Trước hết, hãy tạo một tệp có tên `server.js` ở cùng vị trí với tệp HTML và CSS mà bạn đã tạo trước đó. Đây là điểm vào của ứng dụng của chúng tôi, như được xác định trong tệp `package.json` của chúng tôi.
2. Bạn sẽ cần bắt đầu mã của mình bằng cách yêu cầu máy chủ ngang hàng ở đầu tệp `server.js` để đảm bảo rằng chúng tôi có quyền truy cập vào máy chủ ngang hàng:

   ```js
   const { ExpressPeerServer } = require("peer");
   ```

3. Sau đó, bạn thực sự cần phải tạo máy chủ ngang hàng. Thêm mã sau vào bên dưới dòng trước của bạn:

   ```js
   const peerServer = ExpressPeerServer(server, {
     proxied: true,
     debug: true,
     path: "/myapp",
     ssl: {},
   });
   ```

   Chúng tôi sử dụng đối tượng `ExpressPeerServer` để tạo máy chủ ngang hàng, chuyển cho nó một số tùy chọn trong quy trình. Máy chủ ngang hàng sẽ xử lý tín hiệu cần thiết cho WebRTC cho chúng tôi, vì vậy chúng tôi không phải lo lắng về máy chủ STUN/TURN hoặc các giao thức khác.

4. Cuối cùng, bạn cần yêu cầu ứng dụng của mình sử dụng `peerServer` bằng cách gọi `app.use(peerServer)`. `server.js` đã hoàn thành của bạn phải bao gồm các phần phụ thuộc cần thiết khác mà bạn đưa vào tệp máy chủ, cũng như cung cấp tệp `index.html` tới đường dẫn gốc.

   Cập nhật `server.js` để nó trông như thế này:

   ```js
   const express = require("express");
   const http = require("http");
   const path = require("path");
   const { ExpressPeerServer } = require("peer");

   const app = express();
   const server = http.createServer(app);
   const port = process.env.PORT || "8000";

   const peerServer = ExpressPeerServer(server, {
     proxied: true,
     debug: true,
     path: "/myapp",
     ssl: {},
   });

   app.use(peerServer);

   app.use(express.static(path.join(__dirname)));

   app.get("/", (request, response) => {
     response.sendFile(`${__dirname}/index.html`);
   });

   server.listen(port);
   console.log(`Listening on: ${port}`);
   ```

5. Bạn có thể kết nối với ứng dụng của mình qua `localhost` (trong `server.js` chúng tôi đang sử dụng cổng 8000 nhưng bạn có thể đang sử dụng một số cổng khác). Chạy `yarn start` (trong đó `start` đề cập đến tập lệnh bạn đã khai báo trong `package.json` trên trang trước) trong thiết bị đầu cuối của bạn. Truy cập `localhost:8000` trong trình duyệt của bạn và bạn sẽ thấy một trang trông như thế này:

   ![Nền màu kem có dòng chữ 'gọi điện cho một người bạn' với phông chữ màu xanh đậm, đậm làm tiêu đề. 'Đang kết nối...' ở ngay bên dưới và 'vui lòng sử dụng tai nghe!' bên dưới đó. Tiếp theo là một nút lớn màu xanh đậm có chữ 'Gọi' được viết bằng cùng màu kem nền.](connecting_screen.png)

Nếu bạn muốn tìm hiểu thêm về Peer.js, hãy xem [Kho lưu trữ máy chủ Peer.js trên GitHub](https://github.com/peers/peerjs-server).

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Setup", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers")}}
