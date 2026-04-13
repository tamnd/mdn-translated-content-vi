---
title: "ScreenOrientation: phương thức unlock()"
short-title: unlock()
slug: Web/API/ScreenOrientation/unlock
page-type: web-api-instance-method
browser-compat: api.ScreenOrientation.unlock
---

{{APIRef("Screen Orientation")}}

Phương thức **`unlock()`** của giao diện {{domxref("ScreenOrientation")}} mở khóa hướng của tài liệu chứa, thực chất là khóa nó về hướng màn hình mặc định.

## Cú pháp

```js-nolint
unlock()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu tài liệu không hoàn toàn hoạt động.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái hiển thị của tài liệu bị ẩn hoặc nếu tài liệu bị cấm sử dụng tính năng (ví dụ: bằng cách bỏ qua từ khóa `allow-orientation-lock` của thuộc tính `sandbox` của phần tử `iframe`).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
