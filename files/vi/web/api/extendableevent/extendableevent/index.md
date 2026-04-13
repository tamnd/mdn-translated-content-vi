---
title: "ExtendableEvent: hàm khởi tạo ExtendableEvent()"
short-title: ExtendableEvent()
slug: Web/API/ExtendableEvent/ExtendableEvent
page-type: web-api-constructor
browser-compat: api.ExtendableEvent.ExtendableEvent
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Hàm khởi tạo **`ExtendableEvent()`** tạo một đối tượng {{domxref("ExtendableEvent")}} mới.

## Cú pháp

```js-nolint
new ExtendableEvent(type)
new ExtendableEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Phân biệt chữ hoa chữ thường.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được xác định trong {{domxref("Event/Event", "Event()")}}_, có thể chứa bất kỳ cài đặt tùy chỉnh nào bạn muốn áp dụng cho đối tượng sự kiện.
    Hiện tại không có tùy chọn bắt buộc nào, nhưng điều này đã được xác định để tương thích ngược với các sự kiện dẫn xuất khác nhau.

### Giá trị trả về

Một đối tượng {{domxref("ExtendableEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Service workers basic code example](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Using web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
