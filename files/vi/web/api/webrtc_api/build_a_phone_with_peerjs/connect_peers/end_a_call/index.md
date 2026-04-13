---
title: Kết thúc cuộc gọi
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/End_a_call
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{PreviousMenu("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Answer_a_call", "Web/API/WebRTC_API/Build_a_phone_with_peerjs")}}

Điều cuối cùng bạn muốn làm là đảm bảo người gọi của bạn có cách kết thúc cuộc gọi.
Cách duyên dáng nhất để thực hiện việc này là đóng kết nối bằng hàm `close()` mà bạn có thể thực hiện trong trình xử lý sự kiện cho nút gác máy.

1. Thêm phần sau vào cuối tệp `script.js` của bạn:

   ```js
   const hangUpBtn = document.querySelector(".hangup-btn");
   hangUpBtn.addEventListener("click", () => {
     conn.close();
     showCallContent();
   });
   ```

2. Khi kết nối đã bị đóng, bạn cũng muốn hiển thị nội dung HTML chính xác để có thể gọi hàm `showCallContent()` của mình. Trong sự kiện `call`, bạn cũng muốn đảm bảo trình duyệt từ xa được cập nhật. Để đạt được điều này, hãy thêm một trình xử lý sự kiện khác trong trình xử lý sự kiện `peer.on('call', (stream) => { }`, trong khối điều kiện.

   ```js
   conn.on("close", () => {
     showCallContent();
   });
   ```

   Bằng cách này, nếu người bắt đầu cuộc gọi nhấp vào "Cúp máy" trước thì cả hai trình duyệt vẫn được cập nhật trạng thái mới.

3. Kiểm tra lại ứng dụng của bạn và thử kết thúc cuộc gọi.

> [!LƯU Ý]
> Sự kiện `on('close')` được gọi trên biến `conn` chưa có trên Firefox; điều này chỉ có nghĩa là trong Firefox, mỗi người gọi sẽ phải gác máy riêng lẻ.

> [!CẢNH BÁO]
> Cách chúng tôi mã hóa hiện tại có nghĩa là khi kết nối bị ngắt, cả hai trình duyệt sẽ **chỉ** được cập nhật nếu người bắt đầu cuộc gọi nhấn "Cúp máy" trước. Nếu người trả lời cuộc gọi nhấp vào "Cúp máy" trước thì người gọi khác cũng sẽ phải nhấp vào "Cúp máy" để xem HTML chính xác.

Bây giờ chúng ta đã hoàn thành dự án!
Tiếp theo, bạn có thể [triển khai nó đến nhà cung cấp dịch vụ lưu trữ hỗ trợ các dự án Node.js](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/deployment).

## Xem thêm

- [ngang hàng](https://peerjs.com/)
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Máy chủ PeerJS](https://github.com/peers/peerjs-server)
- [Một video hướng dẫn tương tự với video](https://www.youtube.com/watch?v=OOrBcpwelPY)
- [Hướng dẫn mã](https://github.com/SamsungInternet/WebPhone/tree/master/tutorial)

{{PreviousMenu("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Answer_a_call", "Web/API/WebRTC_API/Build_a_phone_with_peerjs")}}
