---
title: "MediaTrackSupportedConstraints: displaySurface property"
short-title: displaySurface
slug: Web/API/MediaTrackSupportedConstraints/displaySurface
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.displaySurface_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`displaySurface`** của từ điển {{domxref("MediaTrackSupportedConstraints")}} cho biết ràng buộc {{domxref("MediaTrackConstraints.displaySurface", "displaySurface")}} có được user agent và thiết bị nơi nội dung đang được sử dụng hỗ trợ hay không.

Danh sách các ràng buộc được hỗ trợ được lấy bằng cách gọi {{domxref("MediaDevices.getSupportedConstraints","navigator.mediaDevices.getSupportedConstraints()")}}.

## Giá trị

Giá trị Boolean là `true` nếu ràng buộc {{domxref("MediaTrackConstraints.displaySurface", "displaySurface")}} được thiết bị và user agent hỗ trợ.

## Ví dụ

Phương thức này thiết lập đối tượng ràng buộc chỉ định các tùy chọn cho lệnh gọi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}}. Nó thêm ràng buộc `displaySurface` (yêu cầu chỉ cho phép chia sẻ toàn màn hình) chỉ khi được biết là được hỗ trợ bởi trình duyệt. Sau đó bắt đầu chụp bằng cách gọi `getDisplayMedia()` và gắn luồng được trả về vào phần tử video được tham chiếu bởi biến `videoElem`.

```js
async function capture() {
  let supportedConstraints = navigator.mediaDevices.getSupportedConstraints();
  let displayMediaOptions = {
    video: {},
    audio: false,
  };

  if (supportedConstraints.displaySurface) {
    displayMediaOptions.video.displaySurface = "monitor";
  }

  try {
    videoElem.srcObject =
      await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
  } catch (err) {
    /* xử lý lỗi */
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API)
- [Sử dụng API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaDevices.getDisplayMedia()")}}
- {{domxref("MediaStreamTrack.getConstraints()")}}
- {{domxref("MediaStreamTrack.applyConstraints()")}}
- {{domxref("MediaStreamTrack.getSettings()")}}
