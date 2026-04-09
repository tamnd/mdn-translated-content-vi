---
title: "AudioWorkletNode: sự kiện processorerror"
short-title: processorerror
slug: Web/API/AudioWorkletNode/processorerror_event
page-type: web-api-event
browser-compat: api.AudioWorkletNode.processorerror_event
---

{{ APIRef("Web Audio API") }}{{SecureContext_Header}}

Sự kiện `processorerror` kích hoạt khi {{domxref("AudioWorkletProcessor")}} cơ sở phía sau nút ném ra một ngoại lệ trong hàm tạo của nó, trong phương thức {{domxref("AudioWorkletProcessor.process", "process")}}, hoặc trong bất kỳ phương thức lớp nào do người dùng định nghĩa.

Một khi ngoại lệ đã được ném ra, processor (và do đó cả nút) sẽ xuất ra sự im lặng trong suốt vòng đời của nó.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("processorerror", (event) => { })

onprocessorerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Để được thông báo khi processor ném ra ngoại lệ, bạn có thể thêm một trình xử lý vào thể hiện {{domxref("AudioWorkletNode")}} bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}}, như sau:

```js
whiteNoiseNode.addEventListener("processorerror", (event) => {
  console.error("There was an error!");
});
```

Ngoài ra, bạn có thể dùng thuộc tính xử lý sự kiện `onprocessorerror` để thiết lập trình xử lý cho sự kiện `processorerror`:

```js
whiteNoiseNode.onprocessorerror = (event) => {
  console.error("There was an error!");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
