---
title: Tạo cuộc gọi
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Creating_a_call
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Create_a_peer_connection", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Answer_a_call")}}

Thời gian thật thú vị — bây giờ bạn sắp cung cấp cho người dùng khả năng thực hiện cuộc gọi.

1. Trước hết, hãy tham chiếu đến nút "Gọi" được xác định trong HTML, bằng cách thêm phần sau vào cuối `script.js`:

   ```js
   const callBtn = document.querySelector(".call-btn");
   ```

2. Khi người gọi nhấp vào "Gọi", bạn sẽ muốn hỏi họ ID ngang hàng của thiết bị ngang hàng mà họ muốn gọi (mà chúng tôi sẽ lưu trữ trong biến `code` trong `getStreamCode()`) và sau đó bạn sẽ muốn tạo kết nối với mã đó. Thêm phần sau vào bên dưới mã trước đó của bạn:

   ```js
   callBtn.addEventListener("click", () => {
     getStreamCode();
     connectPeers();
     const call = peer.call(code, window.localStream); // A

     call.on("stream", (stream) => {
       // B
       window.remoteAudio.srcObject = stream;
       window.remoteAudio.autoplay = true;
       window.peerStream = stream;
       showConnectedContent();
     });
   });
   ```

   Hãy xem qua mã này:
   - `const call = peer.call(code, window.localStream)`: Thao tác này sẽ tạo cuộc gọi với `code` và `window.localStream` mà chúng ta đã chỉ định trước đó. Lưu ý rằng `localStream` sẽ là `localStream` của người dùng. Vì vậy, đối với người gọi A, đó sẽ là luồng của họ và đối với B, đó sẽ là luồng của riêng họ.
   - `call.on('stream', (stream) => {` : ngang hàng cung cấp cho chúng tôi sự kiện `stream` mà bạn có thể sử dụng trên `call` mà bạn đã tạo. Khi một cuộc gọi bắt đầu truyền trực tuyến, bạn cần đảm bảo rằng luồng từ xa đến từ cuộc gọi được gán cho các thành phần HTML và cửa sổ chính xác, đây là nơi bạn sẽ thực hiện điều đó.
   - Hàm ẩn danh lấy đối tượng `MediaStream` làm đối số, sau đó bạn phải đặt đối tượng này thành HTML của cửa sổ như bạn đã làm trước đây. Ở đây chúng tôi lấy phần tử `<audio>` từ xa của bạn và gán luồng được truyền cho hàm cho thuộc tính `srcObject` .
   - Đảm bảo thuộc tính `autoplay` của phần tử cũng được đặt thành `true`.
   - Đảm bảo rằng `peerStream` của cửa sổ được đặt thành luồng được truyền tới hàm.
   - Cuối cùng bạn muốn hiển thị đúng nội dung nên gọi hàm `showConnectedContent()` mà bạn đã tạo trước đó.

3. Để kiểm tra điều này, hãy mở `localhost:8000` trong hai cửa sổ trình duyệt và nhấp vào Gọi bên trong một trong số chúng. Bạn sẽ thấy điều này:

   ![Hai màn hình cạnh nhau. Nền màu kem có dòng chữ 'gọi điện cho một người bạn' với phông chữ đậm, màu xanh đậm làm tiêu đề. Màn hình đầu tiên có 'ID thiết bị của bạn là: 3b77' và màn hình thứ hai 'ID thiết bị của bạn là: 2doa', ngay bên dưới tiêu đề và 'vui lòng sử dụng tai nghe!' bên dưới đó. Tiếp theo là một nút lớn màu xanh đậm có chữ 'Gọi' được viết bằng cùng màu kem nền. Màn hình thứ hai có hộp thoại trình duyệt yêu cầu id ngang hàng.](screens_side_by_side.png)

   Nếu bạn gửi ID của người kia, cuộc gọi sẽ được kết nối!

Cho đến nay, tất cả đều hoạt động nhưng chúng tôi cần cho trình duyệt khác cơ hội trả lời hoặc từ chối cuộc gọi. Chúng tôi sẽ thực hiện việc đó tiếp theo.

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Create_a_peer_connection", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Answer_a_call")}}
