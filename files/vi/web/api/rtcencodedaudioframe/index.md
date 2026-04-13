---
title: RTCEncodedAudioFrame
slug: Web/API/RTCEncodedAudioFrame
page-type: web-api-interface
browser-compat: api.RTCEncodedAudioFrame
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("window_and_dedicated")}}

**`RTCEncodedAudioFrame`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) đại diện cho một khung âm thanh đã mã hóa trong đường ống thu hoặc gửi của WebRTC, có thể được sửa đổi bằng [WebRTC Encoded Transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

Giao diện cung cấp các phương thức và thuộc tính để lấy siêu dữ liệu về khung, cho phép xác định định dạng và thứ tự của nó trong chuỗi các khung. Thuộc tính `data` cho phép truy cập dữ liệu khung đã mã hóa dưới dạng buffer, có thể được mã hóa hoặc được sửa đổi bởi một transform.

## Hàm khởi tạo

- {{domxref("RTCEncodedAudioFrame.RTCEncodedAudioFrame()","RTCEncodedAudioFrame()")}}
  - : Hàm khởi tạo sao chép. Tạo một đối tượng `RTCEncodedAudioFrame` mới và độc lập từ một khung, tùy chọn ghi đè một số siêu dữ liệu đã sao chép.

## Thuộc tính phiên bản

- {{domxref("RTCEncodedAudioFrame.timestamp")}} {{ReadOnlyInline}} {{deprecated_inline}} {{non-standard_inline}}
  - : Trả về dấu thời gian khi lấy mẫu khung bắt đầu.
- {{domxref("RTCEncodedAudioFrame.data")}}
  - : Trả về một buffer chứa dữ liệu khung đã mã hóa.

## Phương thức phiên bản

- {{DOMxRef("RTCEncodedAudioFrame.getMetadata()")}}
  - : Trả về siêu dữ liệu liên kết với khung.

## Ví dụ

### Chuyển đổi một khung âm thanh đã mã hóa

Đoạn mã này cho thấy một trình xử lý sự kiện `rtctransform` trong một {{domxref("Worker")}} triển khai {{domxref("TransformStream")}} và dẫn các khung đã mã hóa qua nó từ `event.transformer.readable` đến `event.transformer.writable` (`event.transformer` là một {{domxref("RTCRtpScriptTransformer")}}, phía worker của {{domxref("RTCRtpScriptTransform")}}).

Nếu transformer được chèn vào một luồng âm thanh, phương thức `transform()` được gọi với một `RTCEncodedAudioFrame` mỗi khi một khung mới được thêm vào `event.transformer.readable`. Phương thức `transform()` cho thấy cách đọc, sửa đổi bằng hàm mã hóa giả tưởng và đưa vào hàng đợi trên controller (điều này cuối cùng dẫn nó qua `event.transformer.writable` và trở lại đường ống WebRTC).

```js
addEventListener("rtctransform", (event) => {
  const transform = new TransformStream({
    async transform(encodedFrame, controller) {
      // Tái tạo khung gốc.
      const view = new DataView(encodedFrame.data);

      // Xây dựng buffer mới
      const newData = new ArrayBuffer(encodedFrame.data.byteLength);
      const newView = new DataView(newData);

      // Mã hóa các byte khung bằng phương thức encryptFunction() (không hiển thị)
      for (let i = 0; i < encodedFrame.data.byteLength; ++i) {
        const encryptedByte = encryptFunction(~view.getInt8(i));
        newView.setInt8(i, encryptedByte);
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

Lưu ý rằng các ví dụ đầy đủ hơn được cung cấp trong [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
- {{domxref("TransformStream")}}
- {{DOMxRef("RTCRtpScriptTransformer")}}
- {{DOMxRef("RTCEncodedVideoFrame")}}
