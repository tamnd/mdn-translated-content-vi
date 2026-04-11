---
title: MediaDevices
slug: Web/API/MediaDevices
page-type: web-api-interface
browser-compat: api.MediaDevices
---

{{APIRef("Media Capture and Streams")}}{{SecureContext_Header}}

Giao diện **`MediaDevices`** của {{domxref("Media Capture and Streams API", "", "", "nocode")}} cung cấp quyền truy cập vào các thiết bị đầu vào phương tiện đã kết nối như camera và microphone, cũng như chia sẻ màn hình. Về bản chất, nó cho phép bạn truy cập bất kỳ nguồn phần cứng nào tạo ra dữ liệu phương tiện.

{{InheritanceDiagram}}

## Thuộc tính instance

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("EventTarget")}}._

## Phương thức instance

_Kế thừa các phương thức từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("MediaDevices.enumerateDevices", "enumerateDevices()")}}
  - : Lấy một mảng thông tin về các thiết bị đầu vào và đầu ra phương tiện có sẵn trên hệ thống.
- {{domxref("MediaDevices.getSupportedConstraints", "getSupportedConstraints()")}}
  - : Trả về một đối tượng phù hợp với {{domxref("MediaTrackSupportedConstraints")}}, cho biết những thuộc tính có thể ràng buộc nào được hỗ trợ trên giao diện {{domxref("MediaStreamTrack")}}. Xem [Media Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints) để tìm hiểu thêm về các ràng buộc và cách sử dụng chúng.
- {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}}
  - : Nhắc người dùng chọn một màn hình hoặc một phần của màn hình (chẳng hạn như một cửa sổ) để thu lại dưới dạng {{domxref("MediaStream")}} cho mục đích chia sẻ hoặc ghi hình. Trả về một promise được resolve thành `MediaStream`.
- {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}
  - : Với sự cho phép của người dùng thông qua hộp thoại nhắc, bật camera và/hoặc microphone trên hệ thống và cung cấp một {{domxref("MediaStream")}} chứa track video và/hoặc audio với nguồn đầu vào.
- {{domxref("MediaDevices.selectAudioOutput", "selectAudioOutput()") }} {{Experimental_Inline}}
  - : Nhắc người dùng chọn một thiết bị đầu ra âm thanh cụ thể.

## Sự kiện

- {{domxref("MediaDevices/devicechange_event", "devicechange")}}
  - : Được kích hoạt khi một thiết bị đầu vào hoặc đầu ra phương tiện được gắn vào hoặc tháo ra khỏi máy tính của người dùng.

## Ví dụ

```js
// Đặt các biến trong phạm vi toàn cục để chúng có thể dùng trong console của trình duyệt.
const video = document.querySelector("video");
const constraints = {
  audio: false,
  video: true,
};

navigator.mediaDevices
  .getUserMedia(constraints)
  .then((stream) => {
    const videoTracks = stream.getVideoTracks();
    console.log("Got stream with constraints:", constraints);
    console.log(`Using video device: ${videoTracks[0].label}`);
    stream.onremovetrack = () => {
      console.log("Stream ended");
    };
    video.srcObject = stream;
  })
  .catch((error) => {
    if (error.name === "OverconstrainedError") {
      console.error(
        `The resolution ${constraints.video.width.exact}x${constraints.video.height.exact} px is not supported by your device.`,
      );
    } else if (error.name === "NotAllowedError") {
      console.error(
        "You need to grant this page permission to access your camera and microphone.",
      );
    } else {
      console.error(`getUserMedia error: ${error.name}`, error);
    }
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API): API mà giao diện này là một phần của nó.
- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API): API định nghĩa phương thức {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}}.
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("Navigator.mediaDevices")}}: Trả về một tham chiếu đến đối tượng `MediaDevices` có thể dùng để truy cập thiết bị.
- [CameraCaptureJS:](https://github.com/chrisjohndigital/CameraCaptureJS) Quay và phát lại video HTML bằng `MediaDevices` và MediaStream Recording API
- [OpenLang](https://github.com/chrisjohndigital/OpenLang): Ứng dụng web phòng học ngôn ngữ video HTML dùng `MediaDevices` và MediaStream Recording API để ghi video
