---
title: "HTMLMediaElement: sự kiện error"
short-title: error
slug: Web/API/HTMLMediaElement/error_event
page-type: web-api-event
browser-compat: api.HTMLMediaElement.error_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`error`** được kích hoạt khi không thể tải tài nguyên do lỗi (ví dụ: sự cố kết nối mạng).

Sự kiện này không thể hủy và không bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung chung.

## Ví dụ

```js
const video = document.querySelector("video");
const videoSrc = "https://path/to/video.webm";

video.addEventListener("error", () => {
  console.error(`Error loading: ${videoSrc}`);
});

video.setAttribute("src", videoSrc);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLAudioElement")}}
- {{domxref("HTMLVideoElement")}}
- {{HTMLElement("audio")}}
- {{HTMLElement("video")}}
