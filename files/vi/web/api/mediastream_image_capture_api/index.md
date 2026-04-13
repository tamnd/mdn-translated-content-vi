---
title: MediaStream Image Capture API
slug: Web/API/MediaStream_Image_Capture_API
page-type: web-api-overview
browser-compat: api.ImageCapture
---

{{DefaultAPISidebar("Image Capture API")}}

**MediaStream Image Capture API** là một API để chụp ảnh hoặc video từ thiết bị chụp ảnh. Ngoài việc chụp dữ liệu, nó còn cho phép bạn truy xuất thông tin về khả năng của thiết bị như kích thước hình ảnh, giảm mắt đỏ và liệu có đèn flash hay không và chúng đang được đặt thành cài đặt gì. Ngược lại, API cho phép khả năng được cấu hình trong các ràng buộc mà thiết bị cho phép.

## Khái niệm và cách sử dụng Image Capture qua MediaStream

Quá trình truy xuất luồng hình ảnh hoặc video xảy ra như được mô tả bên dưới.

Trước tiên, lấy tham chiếu đến thiết bị bằng cách gọi {{domxref("MediaDevices.getUserMedia()")}}. Ví dụ dưới đây yêu cầu bất kỳ thiết bị video nào có sẵn, mặc dù phương thức `getUserMedia()` cho phép yêu cầu các khả năng cụ thể hơn. Phương thức này trả về {{jsxref("Promise")}} giải quyết với đối tượng {{domxref("MediaStream")}}.

```js
navigator.mediaDevices.getUserMedia({ video: true }).then((mediaStream) => {
  // Do something with the stream.
});
```

Tiếp theo, cô lập phần trực quan của luồng phương tiện. Làm điều này bằng cách gọi {{domxref("MediaStream.getVideoTracks()")}}. Điều này trả về một mảng các đối tượng {{domxref("MediaStreamTrack")}}.

```js
const track = mediaStream.getVideoTracks()[0];
```

Tại đây, bạn có thể muốn cấu hình khả năng thiết bị trước khi chụp hình ảnh. Bạn có thể làm điều này bằng cách gọi {{domxref("MediaStreamTrack.applyConstraints","applyConstraints()")}} trên đối tượng track trước khi làm bất cứ điều gì khác.

```js
let zoom = document.querySelector("#zoom");
const capabilities = track.getCapabilities();
// Check whether zoom is supported or not.
if (!capabilities.zoom) {
  return;
}
track.applyConstraints({ advanced: [{ zoom: zoom.value }] });
```

Cuối cùng, truyền đối tượng `MediaStreamTrack` vào constructor {{domxref("ImageCapture.ImageCapture()", "ImageCapture()")}}.

```js
let imageCapture = new ImageCapture(track);
```

## Các giao diện

- {{domxref("ImageCapture")}}
  - : Giao diện để chụp ảnh từ thiết bị chụp ảnh được tham chiếu thông qua {{domxref("MediaStreamTrack")}} hợp lệ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaStream")}}
- {{domxref("MediaStreamTrack")}}
