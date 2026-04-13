---
title: "HTMLMediaElement: phương thức captureStream()"
short-title: captureStream()
slug: Web/API/HTMLMediaElement/captureStream
page-type: web-api-instance-method
browser-compat: api.HTMLMediaElement.captureStream
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`captureStream()`** của giao diện {{domxref("HTMLMediaElement")}} trả về một đối tượng {{domxref('MediaStream')}} truyền phát nội dung được hiển thị theo thời gian thực trong phần tử phương tiện.

Ví dụ, điều này có thể được sử dụng làm nguồn cho [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("RTCPeerConnection")}}.

## Cú pháp

```js-nolint
captureStream()
```

### Tham số

Không có.

### Giá trị trả về

Đối tượng {{domxref('MediaStream')}} có thể được sử dụng làm nguồn cho dữ liệu âm thanh và/hoặc video bằng mã xử lý phương tiện khác hoặc làm nguồn cho [WebRTC](/en-US/docs/Glossary/WebRTC).

## Ví dụ

### Cách sử dụng cơ bản

Trong ví dụ này, một trình xử lý sự kiện được thiết lập để việc nhấp vào nút sẽ bắt đầu ghi lại nội dung của phần tử phương tiện có ID `"playback"` thành {{domxref("MediaStream")}}.
Sau đó, luồng này có thể được sử dụng cho các mục đích khác, chẳng hạn như luồng WebRTC để chia sẻ video đã ghi trước với người khác trong cuộc gọi điện video.

```js
document.querySelector(".playAndRecord").addEventListener("click", () => {
  const playbackElement = document.getElementById("playback");
  const captureStream = playbackElement.captureStream();
  playbackElement.play();
});
```

Xem [Recording a media element](/en-US/docs/Web/API/MediaStream_Recording_API/Recording_a_media_element) để biết ví dụ và giải thích dài hơn và phức tạp hơn.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Recording a media element](/en-US/docs/Web/API/MediaStream_Recording_API/Recording_a_media_element)
- [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API)
- {{domxref("HTMLCanvasElement.captureStream()")}}
- {{domxref("MediaStream")}}
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
