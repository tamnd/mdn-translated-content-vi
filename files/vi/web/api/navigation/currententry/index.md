---
title: "Navigation: thuộc tính currentEntry"
short-title: currentEntry
slug: Web/API/Navigation/currentEntry
page-type: web-api-instance-property
browser-compat: api.Navigation.currentEntry
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`currentEntry`** của
giao diện {{domxref("Navigation")}} trả về một đối tượng {{domxref("NavigationHistoryEntry")}} đại diện cho vị trí mà người dùng hiện đang được điều hướng tới ngay lúc này.

## Giá trị

Một đối tượng {{domxref("NavigationHistoryEntry")}}.

## Ví dụ

```js
function initHomeBtn() {
  // Get the key of the first loaded entry
  // so the user can always go back to this view.
  const { key } = navigation.currentEntry;
  backToHomeButton.onclick = () => {
    navigation.traverseTo(key);
  };
}
// Intercept navigate events, such as link clicks, and
// replace them with single-page navigations
navigation.addEventListener("navigate", (event) => {
  event.intercept({
    async handler() {
      // Navigate to a different view,
      // but the "home" button will always work.
    },
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
