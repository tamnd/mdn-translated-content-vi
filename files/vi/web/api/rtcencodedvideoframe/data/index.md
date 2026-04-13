---
title: "RTCEncodedVideoFrame: thuộc tính data"
short-title: data
slug: Web/API/RTCEncodedVideoFrame/data
page-type: web-api-instance-property
browser-compat: api.RTCEncodedVideoFrame.data
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`data`** của giao diện {{domxref("RTCEncodedVideoFrame")}} trả về một bộ đệm chứa dữ liệu khung.

## Giá trị

Một {{jsxref("ArrayBuffer")}}.

## Ví dụ

Ví dụ này về [WebRTC encoded transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) cho thấy cách bạn có thể lấy dữ liệu khung trong hàm `transform()` của {{domxref("TransformStream")}} và đảo ngược tất cả các bit.

Hàm `transform()` tạo một {{jsxref("DataView")}} trên bộ đệm trong thuộc tính `data` của khung, và cũng tạo một view trên một {{jsxref("ArrayBuffer")}} mới.
Sau đó nó ghi các byte đã đảo ngược trong dữ liệu gốc vào bộ đệm mới, gán bộ đệm đó cho thuộc tính `data` của khung được mã hóa, và đưa khung đã sửa đổi vào hàng đợi trên stream.

```js
addEventListener("rtctransform", (event) => {
  const transform = new TransformStream({
    async transform(encodedFrame, controller) {
      // Reconstruct the original frame.
      const view = new DataView(encodedFrame.data);

      // Construct a new buffer
      const newData = new ArrayBuffer(encodedFrame.data.byteLength);
      const newView = new DataView(newData);

      // Negate all bits in the incoming frame
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

Lưu ý rằng code xung quanh được hiển thị ở đây được mô tả trong [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
