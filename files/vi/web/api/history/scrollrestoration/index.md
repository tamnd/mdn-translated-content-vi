---
title: "History: thuộc tính scrollRestoration"
short-title: scrollRestoration
slug: Web/API/History/scrollRestoration
page-type: web-api-instance-property
browser-compat: api.History.scrollRestoration
---

{{APIRef("History API")}}

Thuộc tính **`scrollRestoration`** của giao diện {{DOMxRef("History")}} cho phép ứng dụng web đặt rõ ràng hành vi khôi phục vị trí cuộn mặc định khi điều hướng lịch sử.

## Giá trị

Một trong các giá trị sau:

- `auto`
  - : Vị trí trên trang mà người dùng đã cuộn tới sẽ được khôi phục.
- `manual`
  - : Vị trí trên trang sẽ không được khôi phục. Người dùng sẽ phải tự cuộn tới vị trí đó.

## Ví dụ

### Truy vấn hành vi khôi phục vị trí cuộn hiện tại

```js
const scrollRestoration = history.scrollRestoration;
if (scrollRestoration === "manual") {
  console.log(
    "The location on the page is not restored, user will need to scroll manually.",
  );
}
```

### Ngăn việc tự động khôi phục vị trí trên trang

```js
history.scrollRestoration = "manual";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
