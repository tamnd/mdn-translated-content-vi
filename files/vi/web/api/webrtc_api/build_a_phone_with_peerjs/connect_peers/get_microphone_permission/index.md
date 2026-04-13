---
title: Nhận quyền sử dụng micrô của trình duyệt
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Get_microphone_permission
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Show_hide_html")}}

Sau khi tạo xong thiết bị ngang hàng, bạn sẽ muốn có được sự cho phép của trình duyệt để truy cập micrô. Chúng ta sẽ sử dụng phương thức [`getUserMedia()`](/en-US/docs/Web/API/MediaDevices/getUserMedia) trên đối tượng [`navigator.mediaDevices`](/en-US/docs/Web/API/Navigator/mediaDevices) .
Điểm cuối `getUserMedia()` nhận một đối tượng `constraints` chỉ định những quyền cần thiết. `getUserMedia()` là một lời hứa mà khi được giải quyết thành công sẽ trả về một đối tượng [`MediaStream`](/en-US/docs/Web/API/MediaStream) . Trong trường hợp của chúng tôi, phần này sẽ chứa âm thanh từ luồng của chúng tôi. Nếu lời hứa không được giải quyết thành công, bạn sẽ muốn bắt và hiển thị lỗi.

1. Thêm mã sau vào cuối tệp `script.js` của bạn:

   ```js
   function getLocalStream() {
     navigator.mediaDevices
       .getUserMedia({ video: false, audio: true })
       .then((stream) => {
         window.localStream = stream; // A
         window.localAudio.srcObject = stream; // B
         window.localAudio.autoplay = true; // C
       })
       .catch((err) => {
         console.error(`you got an error: ${err}`);
       });
   }
   ```

   Hãy giải thích những dòng quan trọng nhất:
   - `window.localStream = stream` gắn đối tượng `MediaStream` (mà chúng ta đã gán cho `stream` ở dòng trước) vào cửa sổ dưới dạng `localStream`.
   - `window.localAudio.srcObject = stream` đặt [phần tử `<audio>`](/en-US/docs/Web/HTML/Reference/Elements/audio) có ID của `localAudio`'s `src` là `MediaStream` được lời hứa trả về để nó sẽ phát luồng của chúng tôi.
   - `window.localAudio.autoplay = true` đặt thuộc tính `autoplay` của phần tử `<audio>` thành true để âm thanh tự động phát.

   > [!CẢNH BÁO]
   > Nếu bạn đã thực hiện một số điều tra trực tuyến, bạn có thể đã gặp [`navigator.getUserMedia`](/en-US/docs/Web/API/Navigator/getUserMedia) và cho rằng bạn có thể sử dụng nó thay vì `navigator.mediaDevices.getUserMedia`. Bạn đã sai. Phương thức trước là một phương thức không được dùng nữa, yêu cầu các lệnh gọi lại cũng như các ràng buộc làm đối số. Cái sau sử dụng một lời hứa nên bạn không cần sử dụng các cuộc gọi lại.

2. Hãy thử gọi hàm `getLocalStream` bằng cách thêm dòng sau vào cuối mã của bạn:

   ```js
   getLocalStream();
   ```

3. Làm mới ứng dụng của bạn, ứng dụng này vẫn đang chạy ở `localhost:8000`; bạn sẽ thấy quyền sau bật lên:

   ![Hộp thoại cấp quyền của trình duyệt có nội dung "http://localhost:8000 muốn sử dụng micrô của bạn" với hai tùy chọn: "chặn" và "cho phép"](use_microphone_dialogue_box.png)

4. Cắm một số tai nghe vào trước khi bạn cho phép sử dụng micrô để sau này khi bạn tự bật tiếng, bạn sẽ không nhận được bất kỳ phản hồi nào. Nếu bạn không thấy lời nhắc cấp phép, hãy mở trình kiểm tra để xem bạn có lỗi nào không. Đảm bảo tệp JavaScript của bạn cũng được liên kết chính xác với `index.html` của bạn.

Tất cả sẽ trông như thế này khi kết hợp với nhau:

```js
/* global Peer */

/**
 * Gets the local audio stream of the current caller
 * @param callbacks - an object to set the success/error behavior
 * @returns {void}
 */

function getLocalStream() {
  navigator.mediaDevices
    .getUserMedia({ video: false, audio: true })
    .then((stream) => {
      window.localStream = stream;
      window.localAudio.srcObject = stream;
      window.localAudio.autoplay = true;
    })
    .catch((err) => {
      console.error(`you got an error: ${err}`);
    });
}

getLocalStream();
```

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Connect_peers/Show_hide_html")}}
