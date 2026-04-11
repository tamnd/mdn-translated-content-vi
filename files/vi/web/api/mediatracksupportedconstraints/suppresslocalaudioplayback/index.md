---
title: "MediaTrackSupportedConstraints: suppressLocalAudioPlayback property"
short-title: suppressLocalAudioPlayback
slug: Web/API/MediaTrackSupportedConstraints/suppressLocalAudioPlayback
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.MediaStreamTrack.applyConstraints.suppressLocalAudioPlayback_constraint
---

{{APIRef("Media Capture and Streams")}}{{SeeCompatTable}}

Thuộc tính **`suppressLocalAudioPlayback`** của từ điển {{domxref("MediaTrackSupportedConstraints")}} cho biết ràng buộc {{domxref("MediaTrackConstraints.suppressLocalAudioPlayback", "suppressLocalAudioPlayback")}} có được user agent và thiết bị nơi nội dung đang được sử dụng hỗ trợ hay không.

Danh sách các ràng buộc được hỗ trợ được lấy bằng cách gọi {{domxref("MediaDevices.getSupportedConstraints","navigator.mediaDevices.getSupportedConstraints()")}}.

## Giá trị

Giá trị boolean là `true` nếu ràng buộc {{domxref("MediaTrackConstraints.suppressLocalAudioPlayback", "suppressLocalAudioPlayback")}} được thiết bị và user agent hỗ trợ.

## Ví dụ

Hàm dưới đây thiết lập các tùy chọn cho lệnh gọi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}}. Nó thêm ràng buộc `suppressLocalAudioPlayback` (yêu cầu âm thanh được chụp không phát ra loa cục bộ của người dùng) chỉ khi được biết là được hỗ trợ bởi trình duyệt. Sau đó bắt đầu chụp bằng cách gọi `getDisplayMedia()` và gắn luồng được trả về vào phần tử video được tham chiếu bởi biến `videoElem`.

```js
async function capture() {
  const supportedConstraints = navigator.mediaDevices.getSupportedConstraints();
  const displayMediaOptions = {
    audio: {},
  };

  if (supportedConstraints.suppressLocalAudioPlayback) {
    displayMediaOptions.audio.suppressLocalAudioPlayback = true;
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
