---
title: "MediaTrackSettings: restrictOwnAudio property"
short-title: restrictOwnAudio
slug: Web/API/MediaTrackSettings/restrictOwnAudio
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.MediaStreamTrack.applyConstraints.restrictOwnAudio_constraint
---

{{APIRef("Media Capture and Streams")}}{{SeeCompatTable}}

Thuộc tính **`restrictOwnAudio`** của từ điển {{domxref("MediaTrackSettings")}} kiểm soát xem âm thanh hệ thống xuất phát từ tab đang chụp có bị lọc bỏ khỏi chụp màn hình hay không, cho phép ghi màn hình rõ ràng hơn trong một số trường hợp.

Ví dụ, nếu trang web đang chụp tự phát âm thanh hoặc video nhúng, thì âm thanh đó sẽ được đưa vào bản chụp. Vì điều này có thể dẫn đến tiếng vọng không mong muốn hoặc can thiệp với các nguồn âm thanh dự định từ các tab hoặc ứng dụng khác, việc loại bỏ nó khỏi bản chụp là mong muốn.

## Giá trị

Giá trị boolean, trong đó `true` bật hạn chế âm thanh hệ thống của tab đang chụp và `false` tắt nó.

Nếu giá trị là `true`, user agent sẽ cố gắng loại bỏ bất kỳ âm thanh nào xuất phát từ âm thanh do tab gọi {{domxref("MediaDevices.getDisplayMedia()")}} để bắt đầu chụp màn hình tạo ra. Nếu việc loại bỏ âm thanh qua xử lý thất bại, user agent có thể loại trừ tất cả âm thanh xuất phát từ tab đang chụp.

> [!NOTE]
> Nếu bề mặt hiển thị được chụp không bao gồm âm thanh hệ thống, thiết lập này sẽ không có hiệu lực.

## Ví dụ

Hàm sau đây thiết lập đối tượng ràng buộc chỉ định các tùy chọn cho lệnh gọi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}}. Nó thêm ràng buộc `restrictOwnAudio` (yêu cầu lọc bỏ âm thanh hệ thống xuất phát từ tab đang chụp khỏi chụp màn hình) chỉ khi được biết là được hỗ trợ bởi trình duyệt. Sau đó bắt đầu chụp bằng cách gọi `getDisplayMedia()` và gắn luồng được trả về vào phần tử {{htmlelement("video")}} được tham chiếu bởi biến `videoElem`.

```js
async function capture() {
  const supportedConstraints = navigator.mediaDevices.getSupportedConstraints();
  const displayMediaOptions = {
    audio: {},
  };

  if (supportedConstraints.restrictOwnAudio) {
    displayMediaOptions.audio.restrictOwnAudio = true;
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
