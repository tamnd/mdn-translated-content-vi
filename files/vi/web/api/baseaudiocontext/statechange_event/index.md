---
title: "BaseAudioContext: sự kiện statechange"
short-title: statechange
slug: Web/API/BaseAudioContext/statechange_event
page-type: web-api-event
browser-compat: api.BaseAudioContext.statechange_event
---

{{APIRef("Web Audio API")}}

Sự kiện `statechange` được kích hoạt tại một đối tượng {{DOMxRef("BaseAudioContext")}} khi thành viên {{domxref("BaseAudioContext.state", "state")}} của nó thay đổi.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("statechange", (event) => { })

onstatechange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

Đoạn mã sau được lấy từ [bản demo AudioContext states](https://github.com/mdn/webaudio-examples) của chúng tôi ([xem chạy trực tiếp](https://mdn.github.io/webaudio-examples/audiocontext-states/).) Trình xử lý `onstatechange` được dùng để ghi log giá trị
{{domxref("BaseAudioContext.state", "state")}} ra console mỗi khi nó thay đổi.

```js
audioCtx.onstatechange = () => {
  console.log(audioCtx.state);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
