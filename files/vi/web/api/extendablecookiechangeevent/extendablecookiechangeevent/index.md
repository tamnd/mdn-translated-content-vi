---
title: "ExtendableCookieChangeEvent: ExtendableCookieChangeEvent() constructor"
short-title: ExtendableCookieChangeEvent()
slug: Web/API/ExtendableCookieChangeEvent/ExtendableCookieChangeEvent
page-type: web-api-constructor
browser-compat: api.ExtendableCookieChangeEvent.ExtendableCookieChangeEvent
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("service")}}

Hàm khởi tạo **`ExtendableCookieChangeEvent()`** tạo một đối tượng {{domxref("ExtendableCookieChangeEvent")}} mới, là loại sự kiện được truyền vào sự kiện {{domxref("ServiceWorkerGlobalScope/cookiechange_event", "cookiechange")}} được kích hoạt tại {{domxref("ServiceWorkerGlobalScope")}} khi xảy ra bất kỳ thay đổi cookie nào khớp với danh sách đăng ký thay đổi cookie của service worker. Hàm khởi tạo này được trình duyệt gọi khi xảy ra sự kiện thay đổi.

> [!NOTE]
> Hàm khởi tạo sự kiện này thường không cần thiết cho các trang web sản xuất. Mục đích chính của nó là cho các bài kiểm tra yêu cầu một phiên bản của sự kiện này.

## Cú pháp

```js-nolint
new ExtendableCookieChangeEvent(type)
new ExtendableCookieChangeEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt là `cookiechange`.
- `options` {{optional_inline}}
  - : Đối tượng có, _ngoài các thuộc tính được định nghĩa trong {{domxref("ExtendableEvent/ExtendableEvent", "ExtendableEvent()")}}_, có thể có các thuộc tính sau:
    - `changed` {{optional_inline}}
      - : Mảng chứa một cookie đã thay đổi.
    - `deleted` {{optional_inline}}
      - : Mảng chứa một cookie đã bị xóa.

### Giá trị trả về

Một đối tượng {{domxref("ExtendableCookieChangeEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
