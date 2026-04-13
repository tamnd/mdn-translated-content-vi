---
title: "NavigationCurrentEntryChangeEvent: NavigationCurrentEntryChangeEvent() constructor"
short-title: NavigationCurrentEntryChangeEvent()
slug: Web/API/NavigationCurrentEntryChangeEvent/NavigationCurrentEntryChangeEvent
page-type: web-api-constructor
browser-compat: api.NavigationCurrentEntryChangeEvent.NavigationCurrentEntryChangeEvent
---

{{APIRef("Navigation API")}}

Hàm khởi tạo **`NavigationCurrentEntryChangeEvent()`** tạo một đối tượng {{domxref("NavigationCurrentEntryChangeEvent")}} mới.

## Cú pháp

```js-nolint
new NavigationCurrentEntryChangeEvent(type, init)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại sự kiện.
- `init`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có các thuộc tính sau:
    - `from`
      - : Một đối tượng {{domxref("NavigationHistoryEntry")}} đại diện cho vị trí đang được điều hướng đến.
    - `navigationType` {{optional_inline}}
      - : Loại điều hướng đã dẫn đến thay đổi. Các giá trị có thể là `push`, `reload`, `replace`, và `traverse`. Mặc định là `null`.

### Giá trị trả về

Một đối tượng {{domxref("NavigationCurrentEntryChangeEvent")}} mới.

## Ví dụ

Nhà phát triển thường không sử dụng hàm khởi tạo này theo cách thủ công. Một đối tượng `NavigationCurrentEntryChangeEvent` mới được tạo khi một hàm xử lý được gọi do sự kiện {{domxref("Navigation.currententrychange_event", "currententrychange")}} kích hoạt.

```js
navigation.addEventListener("currententrychange", (event) => {
  console.log(event.navigationType);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
