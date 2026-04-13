---
title: "EyeDropper: phương thức open()"
short-title: open()
slug: Web/API/EyeDropper/open
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.EyeDropper.open
---

{{securecontext_header}}{{APIRef("EyeDropper API")}}{{SeeCompatTable}}

Phương thức **`EyeDropper.open()`** bắt đầu chế độ eyedropper, trả về một promise được hoàn thành khi người dùng đã chọn một màu và thoát chế độ eyedropper.

## Cú pháp

```js-nolint
open()
open(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn để truyền tín hiệu {{domxref("AbortSignal")}}:
    - `signal` {{optional_inline}}
      - : Một {{domxref("AbortSignal")}}. Chế độ eyedropper sẽ bị hủy khi phương thức {{domxref("AbortController/abort()", "abort()")}} của `AbortSignal` được gọi.

### Giá trị trả về

Một {{jsxref("Promise")}} cuối cùng giải quyết khi người dùng chọn màu pixel từ màn hình.

Promise giải quyết thành một đối tượng với thuộc tính sau:

- `sRGBHex`
  - : Một chuỗi đại diện cho màu được chọn, ở định dạng hex sRGB (`#aabbcc`).

### Ngoại lệ

Các ngoại lệ không được ném ra mà được trả về khi {{jsxref("Promise")}} bị từ chối.

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `open()` không được gọi thông qua [transient user activation](/en-US/docs/Glossary/Transient_activation).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu một eyedropper khác đã được mở.
- `AbortError` {{domxref("DOMException")}}
  - : Được ném ra nếu người dùng hủy việc chọn bằng cách nhấn phím <kbd>Esc</kbd> hoặc nếu việc chọn bị hủy bởi một {{domxref("AbortController")}} được truyền làm đối số cho `open()`.
- `OperationError` {{domxref("DOMException")}}
  - : Được ném ra nếu việc chọn thất bại vì các lý do khác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EyeDropper")}} mà nó thuộc về.
