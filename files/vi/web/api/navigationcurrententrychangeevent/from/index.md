---
title: "NavigationCurrentEntryChangeEvent: from property"
short-title: from
slug: Web/API/NavigationCurrentEntryChangeEvent/from
page-type: web-api-instance-property
browser-compat: api.NavigationCurrentEntryChangeEvent.from
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`from`** của giao diện {{domxref("NavigationCurrentEntryChangeEvent")}} trả về {{domxref("NavigationHistoryEntry")}} đã được điều hướng từ đó.

## Giá trị

Một đối tượng {{domxref("NavigationHistoryEntry")}}.

## Ví dụ

```js
navigation.addEventListener("currententrychange", (event) => {
  console.log(event.from);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
