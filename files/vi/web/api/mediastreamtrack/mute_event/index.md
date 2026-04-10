---
title: "MediaStreamTrack: sự kiện mute"
short-title: mute
slug: Web/API/MediaStreamTrack/mute_event
page-type: web-api-event
browser-compat: api.MediaStreamTrack.mute_event
---

{{APIRef("Media Capture and Streams")}}

Sự kiện **`mute`** được gửi đến một {{domxref("MediaStreamTrack")}} khi nguồn của track tạm thời không thể cung cấp dữ liệu phương tiện.

Khi track một lần nữa có thể tạo ra đầu ra phương tiện, một sự kiện {{domxref("MediaStreamTrack/unmute_event", "unmute")}} được gửi.

Trong thời gian giữa sự kiện `mute` và sự kiện `unmute`, giá trị của thuộc tính {{domxref("MediaStreamTrack.muted", "muted")}} của track là `true`.

> [!NOTE]
> Điều kiện mà hầu hết mọi người nghĩ là "tắt tiếng" (tức là trạng thái tắt tiếng track do người dùng chuyển đổi) thực tế được quản lý bằng thuộc tính {{domxref("MediaStreamTrack.enabled")}}, không có sự kiện nào cho thuộc tính này.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("mute", (event) => { })

onmute = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Trong ví dụ này, các trình xử lý sự kiện được thiết lập cho các sự kiện `mute` và {{domxref("MediaStreamTrack.unmute_event", "unmute")}} để phát hiện khi phương tiện không chảy từ nguồn cho {{domxref("MediaStreamTrack")}} được tham chiếu bởi `musicTrack`.

```js
musicTrack.addEventListener("mute", (event) => {
  const widget = document.getElementById("timeline-widget");
  widget.style.backgroundColor = "#aaaaaa";
});

musicTrack.addEventListener("unmute", (event) => {
  document.getElementById("timeline-widget").style.backgroundColor = "white";
});
```

Với các trình xử lý sự kiện này được thiết lập, khi track `musicTrack` vào trạng thái {{domxref("MediaStreamTrack.muted", "muted")}} của nó, phần tử có ID `timeline-widget` sẽ được thay đổi màu nền thành `#aaaaaa`. Khi track thoát khỏi trạng thái tắt tiếng—được phát hiện bằng sự kiện `unmute` đến—màu nền được khôi phục thành màu trắng.

Bạn cũng có thể sử dụng thuộc tính trình xử lý sự kiện `onmute` để thiết lập một trình xử lý cho sự kiện này; tương tự, trình xử lý sự kiện {{domxref("MediaStreamTrack.unmute_event", "onunmute")}} khả dụng để thiết lập một trình xử lý cho sự kiện `unmute`. Ví dụ sau đây minh họa điều này:

```js
musicTrack.onmute = (event) => {
  document.getElementById("timeline-widget").style.backgroundColor = "#aaaaaa";
};

musicTrack.onunmute = (event) => {
  document.getElementById("timeline-widget").style.backgroundColor = "white";
};
```

### Tắt tiếng các track thông qua receivers

Ví dụ sau đây cho thấy cách tắt tiếng các track bằng receivers.

```js
// Peer 1 (Sender)
const transceivers = peer.getTransceivers();

const audioTrack = transceivers[0];
audioTrack.direction = "recvonly";

const videoTrack = transceivers[1];
videoTrack.direction = "recvonly";

// Peer 2 (Receiver)
audioTrack.addEventListener("mute", (event) => {
  // Làm gì đó trong UI
});

videoTrack.addEventListener("mute", (event) => {
  // Làm gì đó trong UI
});
```

`transceivers` là một mảng các {{domxref("RTCRtpTransceiver")}} nơi bạn có thể tìm thấy track âm thanh hoặc video được gửi và nhận. Để biết thêm thông tin, xem bài viết {{domxref("RTCRtpTransceiver.direction", "direction")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("MediaStreamTrack/unmute_event", "unmute")}}
- {{domxref("RTCRtpTransceiver.direction", "direction")}}
