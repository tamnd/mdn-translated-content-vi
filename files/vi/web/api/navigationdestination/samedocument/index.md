---
title: "NavigationDestination: thuộc tính sameDocument"
short-title: sameDocument
slug: Web/API/NavigationDestination/sameDocument
page-type: web-api-instance-property
browser-compat: api.NavigationDestination.sameDocument
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`sameDocument`** của giao diện {{domxref("NavigationDestination")}} trả về `true` nếu điều hướng đến cùng `document` như giá trị {{domxref("Document")}} hiện tại, hoặc `false` nếu không.

Điều này hữu ích để kiểm tra xem điều hướng là same-document hay cross-document.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
navigation.addEventListener("navigate", (event) => {
  console.log(event.destination.sameDocument);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
