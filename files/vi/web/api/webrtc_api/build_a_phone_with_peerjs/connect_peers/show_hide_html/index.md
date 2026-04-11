---
title: Hiển thị và ẩn HTML
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Show_hide_html
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Get_microphone_permission", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Create_a_peer_connection")}}

Được rồi, vậy là bạn đã thiết lập quyền sử dụng micrô. Bước tiếp theo là đảm bảo mỗi người dùng biết ID ngang hàng của họ là gì để họ có thể tạo kết nối. Khung công tác ngang hàng cung cấp cho chúng ta một loạt trình xử lý sự kiện mà chúng ta có thể gọi trên thiết bị ngang hàng mà chúng ta đã tạo trước đó.

1. Hãy sử dụng sự kiện `open` để tạo trình nghe hiển thị ID của thiết bị ngang hàng khi nó mở. Thêm mã sau vào cuối `script.js`:

   ```js
   peer.on("open", () => {
     document.getElementById("cast-status").textContent =
       `Your device ID is: ${peer.id}`;
   });
   ```

2. Thử tải lại ứng dụng trong trình duyệt của bạn. Thay vì `connecting...`, bạn sẽ thấy `Your device ID is: <peer ID>`.

   ![Nền màu kem có dòng chữ 'gọi điện cho một người bạn' với phông chữ màu xanh đậm, đậm làm tiêu đề. 'ID thiết bị của bạn là: 3b77' nằm ngay bên dưới đó và 'vui lòng sử dụng tai nghe!' bên dưới đó. Tiếp theo là một nút lớn màu xanh đậm có chữ 'Gọi' được viết bằng cùng màu kem nền.](app_showing_device_id.png)

3. Trong khi ở đây, bạn cũng có thể tạo một số chức năng để hiển thị và ẩn các nội dung khác nhau mà bạn sẽ sử dụng sau này. Có hai hàm bạn nên tạo là `showCallContent()` và `showConnectedContent()`. Các chức năng này sẽ chịu trách nhiệm hiển thị nút gọi và hiển thị nút gác máy cũng như các thành phần âm thanh khi thích hợp.

   ```js
   const audioContainer = document.querySelector(".call-container");

   // Displays the call button and peer ID
   function showCallContent() {
     document.getElementById("cast-status").textContent =
       `Your device ID is: ${peer.id}`;
     callBtn.hidden = false;
     audioContainer.hidden = true;
   }

   // Displays the audio controls and correct copy
   function showConnectedContent() {
     document.getElementById("cast-status").textContent = "You're connected";
     callBtn.hidden = true;
     audioContainer.hidden = false;
   }
   ```

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Get_microphone_permission", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Create_a_peer_connection")}}
