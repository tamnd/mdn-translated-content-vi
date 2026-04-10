---
title: "MediaStream: phương thức getAudioTracks()"
short-title: getAudioTracks()
slug: Web/API/MediaStream/getAudioTracks
page-type: web-api-instance-method
browser-compat: api.MediaStream.getAudioTracks
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`getAudioTracks()`** của giao diện {{domxref("MediaStream")}} trả về một dãy đại diện cho tất cả các đối tượng {{domxref("MediaStreamTrack")}} trong [tập hợp track](https://w3c.github.io/mediacapture-main/#dfn-track-set) của luồng này nơi {{domxref("MediaStreamTrack.kind")}} là `audio`.

## Cú pháp

```js-nolint
getAudioTracks()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng {{domxref("MediaStreamTrack")}}, mỗi đối tượng cho một track audio được chứa trong luồng. Các track audio là những track có thuộc tính {{domxref("MediaStreamTrack.kind", "kind")}} là `audio`. Mảng rỗng nếu luồng không chứa track audio nào.

> [!NOTE]
> Thứ tự của các track được trả về không được xác định bởi đặc tả và thực tế có thể thay đổi từ lần gọi `getAudioTracks()` này sang lần gọi khác.

Các phiên bản đầu tiên của API này bao gồm một giao diện `AudioStreamTrack` đặc biệt được sử dụng làm kiểu cho mỗi mục trong danh sách các luồng audio; tuy nhiên, kể từ đó nó đã được hợp nhất vào giao diện {{domxref("MediaStreamTrack")}} chính.

## Ví dụ

Ví dụ này lấy audio và video từ webcam trong một luồng bằng cách sử dụng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}, gắn luồng vào phần tử {{HTMLElement("video")}}, sau đó thiết lập một bộ hẹn giờ mà khi hết hạn sẽ dừng track audio đầu tiên tìm thấy trên luồng.

```js
navigator.mediaDevices
  .getUserMedia({ audio: true, video: true })
  .then((mediaStream) => {
    document.querySelector("video").srcObject = mediaStream;
    // Dừng luồng audio sau 5 giây
    setTimeout(() => {
      const tracks = mediaStream.getAudioTracks();
      tracks[0].stop();
    }, 5000);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
