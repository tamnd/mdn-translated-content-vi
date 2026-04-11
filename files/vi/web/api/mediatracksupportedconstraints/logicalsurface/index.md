---
title: "MediaTrackSupportedConstraints: logicalSurface property"
short-title: logicalSurface
slug: Web/API/MediaTrackSupportedConstraints/logicalSurface
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.logicalSurface_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`logicalSurface`** của từ điển {{domxref("MediaTrackSupportedConstraints")}} cho biết ràng buộc {{domxref("MediaTrackConstraints.logicalSurface", "logicalSurface")}} có được user agent và thiết bị nơi nội dung đang được sử dụng hỗ trợ hay không.

Danh sách các ràng buộc được hỗ trợ được lấy bằng cách gọi {{domxref("MediaDevices.getSupportedConstraints","navigator.mediaDevices.getSupportedConstraints()")}}.

## Giá trị

Giá trị boolean là `true` nếu ràng buộc {{domxref("MediaTrackConstraints.logicalSurface", "logicalSurface")}} được thiết bị và user agent hỗ trợ.

## Ví dụ

Phương thức này thiết lập đối tượng ràng buộc chỉ định các tùy chọn cho lệnh gọi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}}. Nó thêm ràng buộc `logicalSurface` (yêu cầu chỉ các bề mặt hiển thị logic - những bề mặt có thể không hoàn toàn hiển thị trên màn hình - được đưa vào các tùy chọn có sẵn cho người dùng) chỉ khi được biết là được hỗ trợ bởi trình duyệt. Sau đó bắt đầu chụp bằng cách gọi `getDisplayMedia()` và gắn luồng được trả về vào phần tử video được tham chiếu bởi biến `videoElem`.

```js
async function capture() {
  const supportedConstraints = navigator.mediaDevices.getSupportedConstraints();
  const displayMediaOptions = {
    video: {},
    audio: false,
  };

  if (supportedConstraints.logicalSurface) {
    displayMediaOptions.video.logicalSurface = "monitor";
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
