---
title: "PopStateEvent: PopStateEvent() constructor"
short-title: PopStateEvent()
slug: Web/API/PopStateEvent/PopStateEvent
page-type: web-api-constructor
browser-compat: api.PopStateEvent.PopStateEvent
---

{{APIRef("History API")}}

Hàm khởi tạo **`PopStateEvent()`** tạo một đối tượng {{domxref("PopStateEvent")}} mới.

> [!NOTE]
> Nhà phát triển web thường không cần gọi hàm khởi tạo này vì trình duyệt tự tạo các đối tượng này khi kích hoạt sự kiện {{domxref("Window/popstate_event", "popstate")}}.

## Cú pháp

```js-nolint
new PopStateEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt đặt giá trị là `popstate`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thuộc tính sau:
    - `state` {{optional_inline}}
      - : Một đối tượng đại diện cho trạng thái. Thực tế là giá trị được cung cấp bởi lệnh gọi {{domxref("history.pushState()")}} hoặc {{domxref("history.replaceState()")}}. Nếu không đặt, mặc định là `null`.

### Giá trị trả về

Một đối tượng {{domxref("PopStateEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("history.pushState()")}}
- {{domxref("history.replaceState()")}}
- Sự kiện {{domxref("Window/popstate_event", "popstate")}}
