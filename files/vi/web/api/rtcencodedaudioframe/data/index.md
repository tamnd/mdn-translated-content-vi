---
title: "RTCEncodedAudioFrame: data property"
short-title: data
slug: Web/API/RTCEncodedAudioFrame/data
page-type: web-api-instance-property
browser-compat: api.RTCEncodedAudioFrame.data
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`data`** của giao diện {{domxref("RTCEncodedAudioFrame")}} trả về một buffer chứa dữ liệu cho một khung đã mã hóa.

## Giá trị

Một {{jsxref("ArrayBuffer")}}.

## Ví dụ

[WebRTC encoded transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) này cho thấy cách bạn có thể lấy dữ liệu khung trong hàm `transform()` của {{domxref("TransformStream")}} để sửa đổi các bit.

Hàm `transform()` xây dựng một {{jsxref("DataView")}} trên buffer trong thuộc tính `data` của khung, và cũng tạo một view trên một {{jsxref("ArrayBuffer")}} mới. Sau đó nó ghi các byte phủ định trong dữ liệu gốc vào buffer mới, gán buffer cho thuộc tính `data` của khung đã mã hóa và thêm khung đã sửa đổi vào luồng.

```js
addEventListener("rtctransform", (event) => {
  const transform = new TransformStream({
    async transform(encodedFrame, controller) {
      // Tái tạo khung gốc.
      const view = new DataView(encodedFrame.data);

      // Xây dựng buffer mới
      const newData = new ArrayBuffer(encodedFrame.data.byteLength);
      const newView = new DataView(newData);

      // Phủ định tất cả các bit trong khung đến
      for (let i = 0; i < encodedFrame.data.byteLength; ++i) {
        newView.setInt8(i, ~view.getInt8(i));
      }

      encodedFrame.data = newData;
      controller.enqueue(encodedFrame);
    },
  });
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
});
```

Lưu ý rằng mã xung quanh được mô tả trong [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
