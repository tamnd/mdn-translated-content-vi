---
title: MediaKeys.getStatusForPolicy()
slug: Web/API/MediaKeys/getStatusForPolicy
page-type: web-api-instance-method
browser-compat: api.MediaKeys.getStatusForPolicy
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Phương thức **`getStatusForPolicy()`** của giao diện {{domxref("MediaKeys")}} được sử dụng để kiểm tra xem hệ thống CDM (Content Decryption Module) có cho phép trình chiếu dữ liệu được mã hóa bằng cách sử dụng các key tạo ra bởi hệ thống CDM hay không, dựa trên chính sách được chỉ định.

Phương thức trả về {{jsxref("Promise")}} thực hiện với chuỗi cho biết xem CDM có cho phép trình chiếu không. Giá trị có cùng ý nghĩa như các giá trị trong {{domxref("MediaKeyStatus")}} của {{domxref("MediaKeySession")}}.

Phương thức này cho phép các ứng dụng xác định trước khi bắt đầu phát liệu có đủ điều kiện tái tạo nội dung hay không dựa trên các chính sách (ví dụ yêu cầu HDCP), mà không cần tạo phiên key hay chờ sự kiện "encrypted".

## Cú pháp

```js-nolint
getStatusForPolicy(policy)
```

### Tham số

- `policy`
  - : Đối tượng với các thuộc tính sau:
    - `minHdcpVersion` {{optional_inline}}
      - : Chuỗi chỉ định phiên bản HDCP tối thiểu cần thiết. Ví dụ: `"1.0"`, `"1.4"`, `"2.0"`, `"2.2"`.

### Giá trị trả về

{{jsxref("Promise")}} thực hiện với chuỗi liệt kê trạng thái của key được liên quan đến chính sách.

Giá trị có thể là một trong các giá trị sau:

- `usable`
  - : Key hiện đang có thể sử dụng để giải mã.
- `expired`
  - : Key không còn có thể sử dụng để giải mã vì thời gian hết hạn đã qua.
- `released`
  - : Key đã được giải phóng và dữ liệu không còn sẵn sàng với hệ thống CDM.
- `output-restricted`
  - : Có hạn chế đầu ra liên quan đến key dựa trên chính sách được chỉ định. Phương tiện có thể không thể phát.
- `output-downscaled`
  - : Có hạn chế đầu ra liên quan đến key, nhưng những hạn chế này có thể được đáp ứng bằng cách phát lại nội dung ở độ phân giải thấp hơn.
- `usable-in-future`
  - : Key sẽ có thể sử dụng trong tương lai khi tất cả yêu cầu chính sách đã được thỏa mãn.
- `status-pending`
  - : Trạng thái của key không được biết và đang được xác định.
- `internal-error`
  - : Key không thể sử dụng do lỗi và hệ thống CDM không thể thực hiện thêm hành động nào.

## Ví dụ

### Kiểm tra tính khả dụng của HDCP 2.2

Ví dụ này sử dụng `getStatusForPolicy()` để kiểm tra xem CDM có thể chiếu nội dung nếu HDCP 2.2 được yêu cầu hay không.

```js
const config = [
  {
    videoCapabilities: [
      {
        contentType: 'video/mp4; codecs="avc1.640028"',
        encryptionScheme: "cenc",
        robustness: "SW_SECURE_DECODE",
      },
    ],
  },
];

navigator
  .requestMediaKeySystemAccess("com.widevine.alpha", config)
  .then((mediaKeySystemAccess) => mediaKeySystemAccess.createMediaKeys())
  .then((mediaKeys) =>
    mediaKeys.getStatusForPolicy({
      minHdcpVersion: "2.2",
    }),
  )
  .then((status) => {
    if (status !== "usable") {
      console.error("HDCP 2.2 không khả dụng.");
      return;
    }
    console.log("HDCP 2.2 khả dụng. Bắt đầu phát nội dung.");
  })
  .catch((err) => {
    console.error(err);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaKeys.createSession()")}}
- {{domxref("MediaKeySession")}}
