---
title: "WebSocket: phương thức close()"
short-title: close()
slug: Web/API/WebSocket/close
page-type: web-api-instance-method
browser-compat: api.WebSocket.close
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Phương thức **`WebSocket.close()`** đóng kết nối {{domxref("WebSocket")}} hoặc nỗ lực kết nối, nếu có. Nếu kết nối đã ở trạng thái `CLOSED`, phương thức này không làm gì cả.

> [!NOTE]
> Quá trình đóng kết nối bắt đầu bằng một [closing handshake](https://www.rfc-editor.org/rfc/rfc6455.html#section-1.4), và phương thức `close()` không hủy các thông điệp đã gửi trước đó trước khi bắt đầu handshake này; ngay cả khi user agent vẫn đang bận gửi các thông điệp đó, handshake chỉ bắt đầu sau khi các thông điệp được gửi xong.

## Cú pháp

```js-nolint
close()
close(code)
close(code, reason)
```

### Tham số

- `code` {{optional_inline}}
  - : Một giá trị số nguyên [WebSocket connection close code](https://www.rfc-editor.org/rfc/rfc6455.html#section-7.1.5) cho biết lý do đóng:
    - Nếu không chỉ định, mã đóng của kết nối sẽ được đặt tự động: là `1000` cho một lần đóng bình thường, hoặc là [một giá trị chuẩn khác trong khoảng `1001`-`1015`](https://www.rfc-editor.org/rfc/rfc6455.html#section-7.4.1) để chỉ lý do thực tế khiến kết nối bị đóng.
    - Nếu được chỉ định, giá trị của tham số `code` sẽ ghi đè thiết lập tự động của mã đóng cho kết nối và thay vào đó đặt một mã tùy chỉnh.
      Giá trị phải là một số nguyên: hoặc `1000`, hoặc một mã tùy chỉnh do bạn chọn trong khoảng `3000`-`4999`. Nếu bạn chỉ định giá trị `code`, bạn cũng nên chỉ định giá trị [`reason`](#reason).

- `reason` {{optional_inline}}
  - : Một chuỗi cung cấp [WebSocket connection close reason](https://www.rfc-editor.org/rfc/rfc6455.html#section-7.1.6) tùy chỉnh (một lời giải thích ngắn gọn, dễ hiểu bằng văn bản tự nhiên cho việc đóng kết nối). Giá trị này không được dài quá 123 byte (khi mã hóa UTF-8).

    > [!NOTE]
    > Vì [UTF-8 dùng hai đến bốn byte](/en-US/docs/Glossary/UTF-8) để mã hóa bất kỳ ký tự nào không phải [ASCII](/en-US/docs/Glossary/ASCII), một giá trị `reason` dài 123 ký tự nhưng chứa ký tự không phải ASCII sẽ vượt quá giới hạn 123 byte.

    Nếu bạn chỉ định giá trị `reason`, bạn cũng nên chỉ định giá trị [`code`](#code).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu [`code`](#code) không phải là số nguyên bằng `1000` hoặc là số nguyên trong khoảng `3000` đến `4999`.
- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị [`reason`](#reason) sau khi mã hóa UTF-8 dài hơn 123 byte.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [RFC 6455](https://www.rfc-editor.org/rfc/rfc6455.html) (đặc tả giao thức WebSocket)
