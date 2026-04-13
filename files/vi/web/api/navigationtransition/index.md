---
title: NavigationTransition
slug: Web/API/NavigationTransition
page-type: web-api-interface
browser-compat: api.NavigationTransition
---

{{APIRef("Navigation API")}}

Giao diện **`NavigationTransition`** của {{domxref("Navigation API", "Navigation API", "", "nocode")}} đại diện cho một điều hướng đang diễn ra, tức là điều hướng chưa đạt đến giai đoạn {{domxref("Navigation/navigatesuccess_event", "navigatesuccess")}} hoặc {{domxref("Navigation/navigateerror_event", "navigateerror")}}.

Nó được truy cập thông qua thuộc tính {{domxref("Navigation.transition")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("NavigationTransition.finished", "finished")}} {{ReadOnlyInline}}
  - : Trả về {{jsxref("Promise")}} hoàn thành cùng lúc với sự kiện {{domxref("Navigation/navigatesuccess_event", "navigatesuccess")}} kích hoạt, hoặc từ chối cùng lúc với sự kiện {{domxref("Navigation/navigateerror_event", "navigateerror")}} kích hoạt.
- {{domxref("NavigationTransition.from", "from")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("NavigationHistoryEntry")}} mà quá trình chuyển đổi đang đến từ đó.
- {{domxref("NavigationTransition.navigationType", "navigationType")}} {{ReadOnlyInline}}
  - : Trả về loại điều hướng đang diễn ra.

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
- [Navigation API live demo](https://mdn.github.io/dom-examples/navigation-api/) ([view demo source](https://github.com/mdn/dom-examples/tree/main/navigation-api))
