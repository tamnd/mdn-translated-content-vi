---
title: Trả lời cuộc gọi
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Answer_a_call
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Creating_a_call", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/End_a_call")}}

Bây giờ người dùng của chúng tôi có thể thực hiện cuộc gọi nhưng họ không thể trả lời cuộc gọi. Hãy thêm mảnh ghép tiếp theo để người dùng có thể trả lời các cuộc gọi được thực hiện cho họ.

1. Khung công tác ngang hàng làm cho sự kiện `.on('call')` có sẵn để sử dụng, vì vậy hãy sử dụng nó ở đây. Thêm phần này vào cuối `script.js`:

   ```js
   peer.on("call", (call) => {
     const answerCall = confirm("Do you want to answer?");
   });
   ```

   Đầu tiên, chúng tôi nhắc người dùng trả lời bằng lời nhắc xác nhận. Thao tác này sẽ hiển thị một cửa sổ trên màn hình (như hiển thị trong hình ảnh) mà từ đó người dùng có thể chọn "OK" hoặc "Hủy" - điều này ánh xạ tới giá trị boolean được trả về. Khi bạn nhấn "Gọi" trong trình duyệt của mình, lời nhắc sau sẽ xuất hiện:

   ![Lời nhắc của trình duyệt hỏi "Bạn có muốn trả lời không?" với hai lựa chọn: "Hủy" và "Ok"](confirm_prompt.png)

   > [!CẢNH BÁO]
   > Vì chúng tôi đang sử dụng lời nhắc `confirm` để hỏi người dùng xem họ có muốn trả lời cuộc gọi hay không, điều quan trọng là trình duyệt và tab được gọi là "đang hoạt động", nghĩa là không nên thu nhỏ cửa sổ và tab này phải ở trên màn hình và đặt tiêu điểm của chuột ở đâu đó bên trong tab đó. Lý tưởng nhất là trong phiên bản sản xuất của ứng dụng này, bạn nên tạo cửa sổ phương thức của riêng mình bằng HTML để không có những hạn chế này.

2. Hãy cùng tìm hiểu thêm về trình nghe sự kiện này. Cập nhật nó như sau:

   ```js
   peer.on("call", (call) => {
     const answerCall = confirm("Do you want to answer?");

     if (answerCall) {
       call.answer(window.localStream); // A
       showConnectedContent(); // B
       call.on("stream", (stream) => {
         // C
         window.remoteAudio.srcObject = stream;
         window.remoteAudio.autoplay = true;
         window.peerStream = stream;
       });
     } else {
       console.log("call denied"); // D
     }
   });
   ```

   Hãy xem qua các phần quan trọng nhất của mã này:
   - `call.answer(window.localStream)`: nếu `answerCall` là `true`, bạn sẽ muốn gọi hàm `answer()` của ngang hàng trong cuộc gọi để tạo câu trả lời, truyền nó vào luồng cục bộ.
   - `showCallContent`: Tương tự như những gì bạn đã làm trong trình nghe sự kiện nút gọi, bạn muốn đảm bảo người được gọi nhìn thấy nội dung HTML chính xác.
   - Mọi thứ trong khối `call.on('stream', () => { }` hoàn toàn giống với trình xử lý sự kiện của nút gọi. Lý do bạn cần thêm nó vào đây là để trình duyệt cũng được cập nhật cho người trả lời cuộc gọi.
   - Nếu người đó từ chối cuộc gọi, chúng ta sẽ ghi một tin nhắn vào bảng điều khiển.

3. Mã bạn có bây giờ đủ để bạn tạo cuộc gọi và trả lời cuộc gọi. Làm mới trình duyệt của bạn và kiểm tra nó. Bạn sẽ muốn đảm bảo rằng cả hai trình duyệt đều mở bảng điều khiển, nếu không bạn sẽ không nhận được lời nhắc trả lời cuộc gọi. Nhấp vào cuộc gọi, gửi ID ngang hàng cho trình duyệt khác rồi trả lời cuộc gọi. Trang cuối cùng sẽ trông như thế này:

   ![Hai màn hình cạnh nhau đều có nền màu kem với dòng chữ 'gọi điện cho một người bạn' với phông chữ đậm, màu xanh đậm làm tiêu đề. Dòng chữ 'Bạn đã kết nối' nằm ngay bên dưới dòng chữ đó và 'vui lòng sử dụng tai nghe!' và 'Bạn tự động bị tắt tiếng, vui lòng tự bật tiếng!' bên dưới đó. Tiếp theo là một nút lớn màu đỏ sẫm có dòng chữ 'Cúp máy' được viết trên nền cùng màu kem.](screens_side_by_side.png)

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Creating_a_call", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/End_a_call")}}
