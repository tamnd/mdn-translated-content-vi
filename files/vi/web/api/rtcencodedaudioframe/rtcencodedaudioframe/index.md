---
title: "RTCEncodedAudioFrame: RTCEncodedAudioFrame() constructor"
short-title: RTCEncodedAudioFrame()
slug: Web/API/RTCEncodedAudioFrame/RTCEncodedAudioFrame
page-type: web-api-constructor
browser-compat: api.RTCEncodedAudioFrame.RTCEncodedAudioFrame
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm khởi tạo **`RTCEncodedAudioFrame()`** tạo một đối tượng {{domxref("RTCEncodedAudioFrame")}} mới và hoàn toàn độc lập.

Đối tượng mới là một bản sao sâu của dữ liệu và siêu dữ liệu của đối tượng gốc, với bất kỳ siêu dữ liệu nào được chỉ định trong tham số options ghi đè các giá trị đã sao chép.

## Cú pháp

```js-nolint

new RTCEncodedAudioFrame(originalFrame);
new RTCEncodedAudioFrame(originalFrame, options);
```

### Tham số

- `originalFrame`
  - : Khung được sao chép.
- `options` {{optional_inline}}
  - : Đây là một đối tượng với thuộc tính sau:
    - `metadata` {{optional_inline}}
      - : Một đối tượng đặt siêu dữ liệu cho khung. Đây là một đối tượng có cùng thuộc tính như đối tượng được trả về bởi {{DOMxRef("RTCEncodedAudioFrame.getMetadata()")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - Buffer nguồn bị tách rời.
- {{jsxref("RangeError")}}
  - Phân bổ quá lớn.

## Ví dụ

### Sao chép một khung với siêu dữ liệu đã sửa đổi

Đoạn mã này cho thấy cách bạn có thể sao chép một khung và sửa đổi siêu dữ liệu của nó. Trong trường hợp này, chúng ta chỉ cập nhật thời gian chụp.

```js
// Frame là RTCEncodedAudioFrame đến
frame.getMetadata();

const newFrame = new RTCEncodedAudioFrame(frame, {
  metadata: {
    captureTime: frame.metadata.captureTime + 3,
  },
});
```

Loại sửa đổi này có thể hữu ích nếu bạn cần tạo nhiều khung đi từ một khung đến; ví dụ, để chuyển tiếp phương tiện đến một peer khác trên mạng. Thông thường bạn sẽ không cần sửa đổi siêu dữ liệu cho một khung.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
