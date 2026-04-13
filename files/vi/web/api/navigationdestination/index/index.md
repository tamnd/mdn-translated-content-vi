---
title: "NavigationDestination: thuộc tính index"
short-title: index
slug: Web/API/NavigationDestination/index
page-type: web-api-instance-property
browser-compat: api.NavigationDestination.index
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`index`** của giao diện {{domxref("NavigationDestination")}} trả về giá trị {{domxref("NavigationHistoryEntry.index", "index")}} của {{domxref("NavigationHistoryEntry")}} đích nếu {{domxref("NavigateEvent.navigationType")}} là `traverse`, hoặc `-1` nếu không.

## Giá trị

Một số đại diện cho `index` của {{domxref("NavigationHistoryEntry")}} đích, hoặc -1.

## Ví dụ

```js
navigation.addEventListener("navigate", (event) => {
  console.log(event.destination.index);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
