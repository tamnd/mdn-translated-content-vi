---
title: Kết nối đồng nghiệp
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Build_the_server", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Get_microphone_permission")}}

Trong bài viết trước, chúng tôi đã thiết lập máy chủ của mình, nhưng nó chưa làm được gì cả vì chúng tôi chưa phục vụ bất cứ điều gì. Đây là phần bạn đang chờ đợi — thực sự là tạo kết nối ngang hàng phía máy khách và logic cuộc gọi. Đây sẽ là một quá trình phức tạp nhưng chúng tôi đã chia nó thành nhiều phần phụ để bạn có thể xử lý các phần khác nhau thành từng phần nhỏ vừa ăn.

1. Trước tiên, hãy tạo tệp `script.js` ở cùng vị trí với các tệp khác — đây là nơi chứa tất cả logic của bạn.
2. Chúng ta cần tạo một đối tượng ngang hàng có ID. ID sẽ được sử dụng để kết nối hai thiết bị ngang hàng với nhau và nếu bạn không tạo một ID, một ID sẽ được gán cho thiết bị ngang hàng. Thêm phần sau vào `script.js`:

   ```js
   const peer = new Peer(
     `${Math.floor(Math.random() * 2 ** 18)
       .toString(36)
       .padStart(4, 0)}`,
     {
       host: location.hostname,
       debug: 1,
       path: "/myapp",
     },
   );
   ```

3. Sau đó, bạn sẽ cần gắn thiết bị ngang hàng vào cửa sổ để có thể truy cập được. Thêm dòng sau vào bên dưới mã trước đó của bạn:

   ```js
   window.peer = peer;
   ```

4. Trong một cửa sổ terminal khác, khởi động máy chủ ngang hàng bằng cách chạy lệnh sau bên trong thư mục gốc của thư mục ứng dụng điện thoại của bạn:

   ```bash
   peerjs --port 443 --key peerjs --path /myapp
   ```

Điều này trông rất giống với máy chủ ngang hàng mà chúng tôi đã tạo ở bước trước; đây là phần phía khách hàng. Để trình duyệt kết nối với máy chủ ngang hàng đang chạy, chúng ta cần chỉ dẫn cho trình duyệt cách thực hiện; đây là những gì dòng trên làm.

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Build_the_server", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Get_microphone_permission")}}
