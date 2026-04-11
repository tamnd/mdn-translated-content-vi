---
title: "Navigation: thuộc tính canGoBack"
short-title: canGoBack
slug: Web/API/Navigation/canGoBack
page-type: web-api-instance-property
browser-compat: api.Navigation.canGoBack
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`canGoBack`** của
giao diện {{domxref("Navigation")}} trả về `true`
nếu có thể điều hướng lùi trong lịch sử điều hướng
(tức là {{domxref("Navigation.currentEntry", "currentEntry")}} không phải là mục đầu tiên trong danh sách mục lịch sử),
và `false` nếu không thể.

## Giá trị

Giá trị boolean: `true` nếu có thể điều hướng lùi trong lịch sử điều hướng, `false` trong trường hợp ngược lại.

## Ví dụ

```js
async function backHandler() {
  if (navigation.canGoBack) {
    await navigation.back().finished;
    // Handle any required clean-up after
    // navigation has finished
  } else {
    displayBanner("You are on the first page");
  }
}

async function forwardHandler() {
  if (navigation.canGoForward) {
    await navigation.forward().finished;
    // Handle any required clean-up after
    // navigation has finished
  } else {
    displayBanner("You are on the last page");
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
