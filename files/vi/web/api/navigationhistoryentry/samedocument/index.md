---
title: "NavigationHistoryEntry: sameDocument property"
short-title: sameDocument
slug: Web/API/NavigationHistoryEntry/sameDocument
page-type: web-api-instance-property
browser-compat: api.NavigationHistoryEntry.sameDocument
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`sameDocument`** của giao diện {{domxref("NavigationHistoryEntry")}} trả về `true` nếu mục lịch sử này thuộc cùng `document` với giá trị {{domxref("Document")}} hiện tại và tài liệu hiện tại đang hoạt động đầy đủ, ngược lại trả về `false`.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
const current = navigation.currentEntry;
console.log(current.sameDocument);
// Sẽ luôn trả về true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
