---
title: "NavigationTransition: finished property"
short-title: finished
slug: Web/API/NavigationTransition/finished
page-type: web-api-instance-property
browser-compat: api.NavigationTransition.finished
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`finished`** của giao diện {{domxref("NavigationTransition")}} trả về {{jsxref("Promise")}} hoàn thành cùng lúc với sự kiện {{domxref("Navigation/navigatesuccess_event", "navigatesuccess")}} kích hoạt, hoặc từ chối cùng lúc với sự kiện {{domxref("Navigation/navigateerror_event", "navigateerror")}} kích hoạt.

## Giá trị

Một {{jsxref("Promise")}} phân giải thành `undefined`.

## Ví dụ

```js
async function cleanupNavigation() {
  await navigation.transition.finished;
  // Navigation has completed successfully
  // Cleanup any ongoing monitoring
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
