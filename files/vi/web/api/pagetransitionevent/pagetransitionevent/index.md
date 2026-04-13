---
title: "PageTransitionEvent: hàm khởi tạo PageTransitionEvent()"
short-title: PageTransitionEvent()
slug: Web/API/PageTransitionEvent/PageTransitionEvent
page-type: web-api-constructor
browser-compat: api.PageTransitionEvent.PageTransitionEvent
---

{{APIRef("HTML DOM")}}

Hàm khởi tạo **`PageTransitionEvent()`** tạo một đối tượng {{domxref("PageTransitionEvent")}} mới, được sử dụng bởi các sự kiện {{domxref("Window/pageshow_event", "pageshow")}} hoặc {{domxref("Window/pagehide_event", "pagehide")}}, được kích hoạt tại đối tượng {{domxref("window")}} khi một trang được tải hoặc dỡ tải.

> [!NOTE]
> Một nhà phát triển web thường không cần gọi hàm khởi tạo này, vì trình duyệt tự tạo các đối tượng này khi kích hoạt các sự kiện {{domxref("Window/pageshow_event", "pageshow")}} hoặc {{domxref("Window/pagehide_event", "pagehide")}}.

## Cú pháp

```js-nolint
new PageTransitionEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt đặt là `pageshow` hoặc `pagehide`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thuộc tính sau:
    - `persisted` {{optional_inline}}
      - : Một giá trị boolean chỉ ra liệu tài liệu có đang được tải từ bộ nhớ cache hay không.

### Giá trị trả về

Một đối tượng {{domxref("PageTransitionEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện [`pageshow`](/en-US/docs/Web/API/Window/pageshow_event)
- Sự kiện [`pagehide`](/en-US/docs/Web/API/Window/pagehide_event)
