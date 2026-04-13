---
title: "MediaStream: thuộc tính active"
short-title: active
slug: Web/API/MediaStream/active
page-type: web-api-instance-property
browser-compat: api.MediaStream.active
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính chỉ đọc **`active`** của giao diện {{domxref("MediaStream")}} trả về một giá trị Boolean là `true` nếu luồng đang hoạt động; ngược lại, nó trả về `false`. Một luồng được coi là **đang hoạt động** nếu ít nhất một {{domxref("MediaStreamTrack")}} của nó không có thuộc tính {{domxref("MediaStreamTrack.readyState")}} được đặt thành `ended`. Khi mọi track đều đã kết thúc, thuộc tính `active` của luồng trở thành `false`.

## Giá trị

Một giá trị Boolean là `true` nếu luồng đang hoạt động; ngược lại, giá trị là `false`.

## Ví dụ

Trong ví dụ này, một luồng mới có nguồn gốc từ camera và microphone cục bộ của người dùng được yêu cầu bằng cách sử dụng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}. Khi luồng đó khả dụng (tức là khi {{jsxref("Promise")}} được trả về được hoàn thành), một nút trên trang được cập nhật dựa trên việc luồng có đang hoạt động hay không.

```js
const promise = navigator.mediaDevices.getUserMedia({
  audio: true,
  video: true,
});

promise.then((stream) => {
  const startBtn = document.querySelector("#startBtn");
  startBtn.disabled = stream.active;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
