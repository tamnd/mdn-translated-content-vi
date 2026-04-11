---
title: "Navigation: thuộc tính transition"
short-title: transition
slug: Web/API/Navigation/transition
page-type: web-api-instance-property
browser-compat: api.Navigation.transition
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`transition`** của giao diện {{domxref("Navigation")}} trả về một đối tượng {{domxref("NavigationTransition")}} đại diện cho trạng thái của một điều hướng đang diễn ra, có thể dùng để theo dõi nó.

## Giá trị

Một đối tượng {{domxref("NavigationTransition")}}, hoặc `null` nếu hiện không có điều hướng nào đang diễn ra.

## Ví dụ

```js
async function handleTransition() {
  if (navigation.transition) {
    showLoadingSpinner();
    await navigation.transition.finished;
    hideLoadingSpinner();
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
