---
title: RTCEncodedVideoFrame
slug: Web/API/RTCEncodedVideoFrame
page-type: web-api-interface
browser-compat: api.RTCEncodedVideoFrame
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("window_and_dedicated")}}

**`RTCEncodedVideoFrame`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) đại diện cho một khung video được mã hóa trong đường ống nhận hoặc gửi WebRTC, có thể được sửa đổi bằng [WebRTC Encoded Transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

## Hàm khởi tạo

- {{domxref("RTCEncodedVideoFrame.RTCEncodedVideoFrame()","RTCEncodedVideoFrame()")}}
  - : Hàm khởi tạo sao chép. Tạo một đối tượng `RTCEncodedVideoFrame` mới và độc lập từ một khung khác, tùy chọn ghi đè một số metadata đã sao chép.

## Thuộc tính phiên bản

- {{domxref("RTCEncodedVideoFrame.type")}} {{ReadOnlyInline}}
  - : Trả về liệu khung hiện tại có phải là khung chính, delta frame, hay khung rỗng hay không.
- {{domxref("RTCEncodedVideoFrame.timestamp")}} {{ReadOnlyInline}} {{deprecated_inline}} {{non-standard_inline}}
  - : Trả về timestamp khi bắt đầu lấy mẫu khung.
- {{domxref("RTCEncodedVideoFrame.data")}}
  - : Trả về một bộ đệm chứa dữ liệu khung được mã hóa.

## Phương thức phiên bản

- {{DOMxRef("RTCEncodedVideoFrame.getMetadata()")}}
  - : Trả về metadata liên kết với khung.

## Mô tả

Dữ liệu video thô được tạo ra như một chuỗi các khung, trong đó mỗi khung là một mảng 2 chiều các giá trị pixel.
Các bộ mã hóa video chuyển đổi đầu vào thô này thành một biểu diễn nén của bản gốc để truyền và lưu trữ.
Một cách phổ biến là gửi "key frames" chứa đủ thông tin để tái tạo toàn bộ hình ảnh với tốc độ tương đối thấp, và giữa các khung chính gửi nhiều "delta frames" nhỏ hơn chỉ mã hóa những thay đổi kể từ khung trước.

Có nhiều codec khác nhau, chẳng hạn như H.264, VP8 và VP9, mỗi loại có quá trình mã hóa và cấu hình khác nhau, cung cấp các sự đánh đổi khác nhau giữa hiệu quả nén và chất lượng video.

**`RTCEncodedVideoFrame`** đại diện cho một khung đơn được mã hóa với một bộ mã hóa video cụ thể.
Thuộc tính {{domxref("RTCEncodedVideoFrame.type","type")}} cho biết liệu khung có phải là khung "key" hay "delta", và bạn có thể sử dụng phương thức {{DOMxRef("RTCEncodedVideoFrame.getMetadata()","getMetadata()")}} để lấy các chi tiết khác về phương thức mã hóa.
Thuộc tính {{domxref("RTCEncodedVideoFrame.data", "data")}} cung cấp quyền truy cập vào dữ liệu hình ảnh được mã hóa cho khung, sau đó có thể được sửa đổi ("transformed") khi các khung được gửi hoặc nhận.

## Ví dụ

### Transforming a khung video được mã hóa

Đoạn mã này cho thấy một hàm xử lý cho sự kiện `rtctransform` trong một {{domxref("Worker")}} triển khai một {{domxref("TransformStream")}}, và pipe các khung được mã hóa qua nó từ `event.transformer.readable` đến `event.transformer.writable` (`event.transformer` là một {{domxref("RTCRtpScriptTransformer")}}, counterpart phía worker của {{domxref("RTCRtpScriptTransform")}}).

Nếu transformer được chèn vào một video stream, phương thức `transform()` được gọi với một `RTCEncodedVideoFrame` mỗi khi một khung mới được xếp vào hàng đợi trên `event.transformer.readable`.
Phương thức `transform()` cho thấy cách đọc khung này, sửa đổi bằng cách đảo ngược các bit, và sau đó xếp vào hàng đợi trên controller (cuối cùng pipe nó qua `event.transformer.writable`, và sau đó trở lại đường ống WebRTC).

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

Lưu ý rằng các ví dụ đầy đủ hơn được cung cấp trong [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
- {{domxref("TransformStream")}}
- {{DOMxRef("RTCRtpScriptTransformer")}}
- {{DOMxRef("RTCEncodedAudioFrame")}}
