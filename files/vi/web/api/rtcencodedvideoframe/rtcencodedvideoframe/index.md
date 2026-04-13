---
title: "RTCEncodedVideoFrame: hàm khởi tạo RTCEncodedVideoFrame()"
short-title: RTCEncodedVideoFrame()
slug: Web/API/RTCEncodedVideoFrame/RTCEncodedVideoFrame
page-type: web-api-constructor
browser-compat: api.RTCEncodedVideoFrame.RTCEncodedVideoFrame
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm khởi tạo **`RTCEncodedVideoFrame()`** tạo một đối tượng {{domxref("RTCEncodedVideoFrame")}} mới và hoàn toàn độc lập.

Đối tượng mới là một bản sao sâu của dữ liệu và metadata của đối tượng gốc, với bất kỳ metadata nào được chỉ định trong tham số options sẽ ghi đè các giá trị đã sao chép.

## Cú pháp

```js-nolint

new RTCEncodedVideoFrame(originalFrame);
new RTCEncodedVideoFrame(originalFrame, options);
```

### Tham số

- `originalFrame`
  - : Khung cần được sao chép.
- `options` {{optional_inline}}
  - : Đây là một đối tượng với thuộc tính sau:
    - `metadata` {{optional_inline}}
      - : Một đối tượng thiết lập metadata của khung.
        Đây là một đối tượng có cùng thuộc tính như đối tượng được trả về bởi {{DOMxRef("RTCEncodedVideoFrame.getMetadata()")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - Bộ đệm nguồn đã bị tách ra.
- {{jsxref("RangeError")}}
  - Kích thước cấp phát quá lớn.

## Ví dụ

### Sao chép khung với metadata đã sửa đổi

Đoạn code này cho thấy cách bạn có thể sao chép một khung và sửa đổi metadata của nó.
Trong trường hợp này chúng ta chỉ cập nhật thời gian chụp.

```js
// Frame is an incoming RTCEncodedVideoFrame
frame.getMetadata();

const newFrame = new RTCEncodedVideoFrame(frame, {
  metadata: {
    captureTime: frame.metadata.captureTime + 3,
  },
});
```

Loại sửa đổi này có thể hữu ích nếu bạn cần tạo nhiều khung đầu ra từ một khung đầu vào duy nhất; ví dụ, để chuyển tiếp media đến một peer khác trên mạng.
Thông thường bạn sẽ không cần sửa đổi metadata cho một khung.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
