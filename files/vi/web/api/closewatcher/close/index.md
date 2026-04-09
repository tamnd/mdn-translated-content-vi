---
title: "CloseWatcher: phương thức close()"
short-title: close()
slug: Web/API/CloseWatcher/close
page-type: web-api-instance-method
browser-compat: api.CloseWatcher.close
---

{{APIRef("HTML DOM")}}

Phương thức **`close()`** của giao diện {{domxref("CloseWatcher")}} cho phép bạn bỏ qua mọi logic trong trình xử lý sự kiện `cancel` và kích hoạt ngay sự kiện `close`. Sau đó, nó vô hiệu hóa close watcher như thể `destroy()` đã được gọi.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Dùng phương thức `close()`

Dùng phương thức `close()` để vô hiệu hóa close watcher và hủy nó.

```js
watcher.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
