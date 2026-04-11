---
title: "Navigator: phương thức getUserMedia()"
short-title: getUserMedia()
slug: Web/API/Navigator/getUserMedia
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Navigator.getUserMedia
---

{{APIRef("Media Capture and Streams")}}{{deprecated_header}}{{SecureContext_Header}}

Phương thức **`Navigator.getUserMedia()`** không được dùng nữa sẽ nhắc người dùng cấp quyền sử dụng tối đa một thiết bị đầu vào video (chẳng hạn như máy ảnh hoặc màn hình dùng chung) và tối đa một thiết bị đầu vào âm thanh (chẳng hạn như micrô) làm nguồn cho {{domxref("MediaStream")}}.

Nếu được cấp quyền, `MediaStream` có bản nhạc video và/hoặc âm thanh đến từ các thiết bị đó sẽ được gửi đến lệnh gọi lại thành công đã chỉ định.
Nếu quyền bị từ chối, không tồn tại thiết bị đầu vào tương thích hoặc bất kỳ tình trạng lỗi nào khác xảy ra, lệnh gọi lại lỗi sẽ được thực thi với một đối tượng mô tả sự cố.
Thay vào đó, nếu người dùng không đưa ra lựa chọn nào thì cả cuộc gọi lại đều không được thực thi.

> [!LƯU Ý]
> Đây là một phương pháp cũ.
> Thay vào đó, vui lòng sử dụng {{domxref("MediaDevices.getUserMedia", "navigator.mediaDevices.getUserMedia()")}} mới hơn.
> Mặc dù về mặt kỹ thuật không được dùng nữa nhưng phiên bản gọi lại cũ này được đánh dấu như vậy vì đặc tả khuyến khích sử dụng phiên bản trả lại lời hứa mới hơn.

## Cú pháp

```js-nolint
getUserMedia(constraints, successCallback, errorCallback)
```

### Thông số

- `constraints`
  - : Một đối tượng chỉ định các loại phương tiện truyền thông tới
    yêu cầu, kèm theo các yêu cầu đối với từng loại. Để biết chi tiết, hãy xem [constraints](/en-US/docs/Web/API/MediaDevices/getUserMedia#parameters)
    phần theo phương pháp {{domxref("MediaDevices.getUserMedia()")}} hiện đại
    như bài viết [Capabilities, constraints, and settings](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints).
- `successCallback`
  - : Một chức năng được gọi khi yêu cầu truy cập phương tiện được phê duyệt. các
    hàm được gọi với một tham số: đối tượng {{domxref("MediaStream")}}
    chứa luồng phương tiện. Cuộc gọi lại của bạn sau đó có thể gán luồng cho mong muốn
    đối tượng (chẳng hạn như phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}), như
    thể hiện trong ví dụ sau:

````js
    function successCallback(stream) {
      const video = document.querySelector("video");
      video.srcObject = stream;
      video.onloadedmetadata = (e) => {
        // Do something with the video here.
      };
    }
    ```

- `errorCallback`
  - : Khi cuộc gọi không thành công, chức năng được chỉ định trong `errorCallback` là
    được gọi với một đối tượng làm đối số duy nhất của nó; cái này
    đối tượng được mô hình hóa trên {{domxref("DOMException")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Chiều rộng và chiều cao

Đây là ví dụ về cách sử dụng `getUserMedia()`, bao gồm mã để xử lý
tiền tố của các trình duyệt khác nhau. Lưu ý rằng đây là cách thực hiện không được dùng nữa: Xem
Phần [Examples](/en-US/docs/Web/API/MediaDevices/getUserMedia#frame_rate)
theo {{domxref("MediaDevices.getUserMedia()")}} cho các ví dụ hiện đại.

```js
navigator.getUserMedia =
  navigator.getUserMedia ||
  navigator.webkitGetUserMedia ||
  navigator.mozGetUserMedia;

if (navigator.getUserMedia) {
  navigator.getUserMedia(
    { audio: true, video: { width: 1280, height: 720 } },
    (stream) => {
      const video = document.querySelector("video");
      video.srcObject = stream;
      video.onloadedmetadata = (e) => {
        video.play();
      };
    },
    (err) => {
      console.error(`The following error occurred: ${err.name}`);
    },
  );
} else {
  console.log("getUserMedia not supported");
}
````

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaDevices.getUserMedia()")}} thay thế phương thức không được dùng nữa này.
- [WebRTC](/en-US/docs/Web/API/WebRTC_API) - trang giới thiệu về API
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API) - API cho
  đối tượng luồng phương tiện
- [Taking webcam photos](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Taking_still_photos) - một
  hướng dẫn sử dụng `getUserMedia()` để chụp ảnh thay vì quay video.
