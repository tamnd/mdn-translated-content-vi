---
title: "MediaTrackSettings: suppressLocalAudioPlayback property"
short-title: suppressLocalAudioPlayback
slug: Web/API/MediaTrackSettings/suppressLocalAudioPlayback
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.MediaStreamTrack.applyConstraints.suppressLocalAudioPlayback_constraint
---

{{APIRef("Media Capture and Streams")}}{{SeeCompatTable}}

Thuộc tính **`suppressLocalAudioPlayback`** của từ điển {{domxref("MediaTrackSettings")}} kiểm soát xem âm thanh đang phát trong một tab có tiếp tục được phát ra loa cục bộ của người dùng hay không khi tab đó được chụp.

Ví dụ, trong các trường hợp bạn phát sóng cuộc gọi video đến hệ thống AV bên ngoài trong phòng hội nghị, bạn muốn âm thanh phát ra từ hệ thống AV, không phải từ loa cục bộ. Bằng cách này, âm thanh sẽ to hơn, rõ ràng hơn, và cũng đồng bộ với video hội nghị.

## Giá trị

Giá trị của `suppressLocalAudioPlayback` là boolean - `true` bật tính năng triệt âm thanh phát cục bộ, và `false` tắt nó.

## Ví dụ

Hàm dưới đây thiết lập đối tượng ràng buộc chỉ định các tùy chọn cho lệnh gọi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}}. Nó thêm ràng buộc `suppressLocalAudioPlayback` (yêu cầu âm thanh được chụp không phát ra loa cục bộ của người dùng) chỉ khi được biết là được hỗ trợ bởi trình duyệt. Sau đó bắt đầu chụp bằng cách gọi `getDisplayMedia()` và gắn luồng được trả về vào phần tử video được tham chiếu bởi biến `videoElem`.

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
