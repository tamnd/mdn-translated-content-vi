---
title: "SerialPort: phương thức open()"
short-title: open()
slug: Web/API/SerialPort/open
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.SerialPort.open
---

{{SecureContext_Header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`open()`** của giao diện {{domxref("SerialPort")}} trả về một {{jsxref("Promise")}} phân giải khi cổng được mở. Mặc định cổng được mở với 8 bit dữ liệu, 1 bit dừng và không kiểm tra chẵn lẻ. Tham số `baudRate` là bắt buộc.

## Cú pháp

```js-nolint
open(options)
```

### Tham số

- `options`
  - : Một đối tượng với bất kỳ giá trị nào sau đây:
    - `baudRate`
      - : Một giá trị dương, khác không cho biết tốc độ baud mà giao tiếp nối tiếp nên được thiết lập.
    - `bufferSize` {{Optional_Inline}}
      - : Một số nguyên dài không dấu cho biết kích thước của bộ đệm đọc và ghi cần được thiết lập. Nếu không được truyền, mặc định là 255.
    - `dataBits` {{Optional_Inline}}
      - : Một giá trị số nguyên là 7 hoặc 8 cho biết số bit dữ liệu mỗi khung. Nếu không được truyền, mặc định là 8.
    - `flowControl` {{Optional_Inline}}
      - : Loại kiểm soát luồng, có thể là `"none"` hoặc `"hardware"`. Giá trị mặc định là `"none"`.
    - `parity` {{Optional_Inline}}
      - : Chế độ chẵn lẻ, có thể là `"none"`, `"even"`, hoặc `"odd"`. Giá trị mặc định là `"none"`.
    - `stopBits` {{Optional_Inline}}
      - : Một giá trị số nguyên là 1 hoặc 2 cho biết số bit dừng ở cuối khung. Nếu không được truyền, mặc định là 1.

### Giá trị trả về

Một {{jsxref("Promise")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Trả về nếu cổng đã mở.
- `NetworkError` {{domxref("DOMException")}}
  - : Trả về nếu nỗ lực mở cổng thất bại.

## Ví dụ

Trước khi giao tiếp trên một cổng nối tiếp, cổng đó phải được mở. Mở cổng cho phép trang web chỉ định các tham số cần thiết kiểm soát cách dữ liệu được truyền và nhận. Nhà phát triển nên kiểm tra tài liệu của thiết bị đang kết nối để biết các tham số phù hợp.

```js
await port.open({ baudRate: 9600 /* pick your baud rate */ });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
