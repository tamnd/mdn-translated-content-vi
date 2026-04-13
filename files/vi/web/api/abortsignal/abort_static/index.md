---
title: "AbortSignal: phương thức tĩnh abort()"
short-title: abort()
slug: Web/API/AbortSignal/abort_static
page-type: web-api-static-method
browser-compat: api.AbortSignal.abort_static
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức tĩnh **`AbortSignal.abort()`** trả về một {{domxref("AbortSignal")}} đã được đặt sẵn ở trạng thái bị hủy, và tín hiệu này sẽ không kích hoạt sự kiện {{domxref("AbortSignal/abort_event", "abort")}}.

Đây là cách viết rút gọn của đoạn mã sau:

```js
const controller = new AbortController();
controller.abort();
return controller.signal;
```

Ví dụ, bạn có thể truyền tín hiệu này vào một phương thức fetch để chạy logic hủy của nó. Điều này có thể hữu ích khi mã được tổ chức theo cách mà logic hủy vẫn nên được chạy ngay cả khi thao tác fetch dự định chưa bắt đầu.

> [!NOTE]
> Phương thức này có mục đích tương tự {{JSxRef("Promise.reject")}}.

## Cú pháp

```js-nolint
AbortSignal.abort()
AbortSignal.abort(reason)
```

### Tham số

- `reason`
  - : Lý do khiến thao tác bị hủy, có thể là bất kỳ giá trị JavaScript nào.
    Nếu không được chỉ định, lý do sẽ được đặt thành {{domxref("DOMException")}} `"AbortError"`.

### Giá trị trả về

Một thể hiện `AbortSignal` với thuộc tính {{domxref("AbortSignal.aborted")}} được đặt thành `true`, và {{domxref("AbortSignal.reason")}} được đặt thành giá trị lý do đã chỉ định hoặc giá trị mặc định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
