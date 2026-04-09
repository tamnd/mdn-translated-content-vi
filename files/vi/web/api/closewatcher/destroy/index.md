---
title: "CloseWatcher: phương thức destroy()"
short-title: destroy()
slug: Web/API/CloseWatcher/destroy
page-type: web-api-instance-method
browser-compat: api.CloseWatcher.destroy
---

{{APIRef("HTML DOM")}}

Phương thức **`destroy()`** của giao diện {{domxref("CloseWatcher")}} vô hiệu hóa close watcher. Phương thức này được dùng để gọi nếu phần tử UI liên quan bị gỡ bỏ theo cách khác thay vì được đóng.

Sau khi bị vô hiệu hóa, `CloseWatcher` này sẽ không còn nhận các sự kiện `cancel` hoặc `close` nữa, và bạn sẽ có thể tạo các thể hiện `CloseWatcher` độc lập mới.

## Cú pháp

```js-nolint
destroy()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Dùng phương thức `destroy()`

Dùng phương thức `destroy()` để loại bỏ thể hiện watcher trong quá trình dọn dẹp.

```js
watcher.destroy();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
