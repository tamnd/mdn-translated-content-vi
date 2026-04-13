---
title: "NavigationDestination: thuộc tính key"
short-title: key
slug: Web/API/NavigationDestination/key
page-type: web-api-instance-property
browser-compat: api.NavigationDestination.key
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`key`** của giao diện {{domxref("NavigationDestination")}} trả về giá trị {{domxref("NavigationHistoryEntry.key", "key")}} của {{domxref("NavigationHistoryEntry")}} đích nếu {{domxref("NavigateEvent.navigationType")}} là `traverse`, hoặc một chuỗi rỗng nếu không.

`key` là một giá trị duy nhất do UA tạo ra, đại diện cho vị trí của mục lịch sử trong danh sách mục lịch sử, được sử dụng để điều hướng đến vị trí này trong lịch sử thông qua {{domxref("Navigation.traverseTo()")}}. Nó sẽ được tái sử dụng bởi các mục khác thay thế mục trong danh sách (tức là nếu {{domxref("NavigateEvent.navigationType")}} là `replace`).

## Giá trị

Một chuỗi đại diện cho `key` của {{domxref("NavigationHistoryEntry")}} đích, hoặc một chuỗi rỗng.

## Ví dụ

```js
navigation.addEventListener("navigate", (event) => {
  console.log(event.destination.key);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
