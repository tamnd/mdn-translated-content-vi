---
title: NavigationDestination
slug: Web/API/NavigationDestination
page-type: web-api-interface
browser-compat: api.NavigationDestination
---

{{APIRef("Navigation API")}}

Giao diện **`NavigationDestination`** của {{domxref("Navigation API", "Navigation API", "", "nocode")}} đại diện cho đích đến đang được điều hướng đến trong quá trình điều hướng hiện tại.

Nó được truy cập thông qua thuộc tính {{domxref("NavigateEvent.destination")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("NavigationDestination.id", "id")}} {{ReadOnlyInline}}
  - : Trả về giá trị {{domxref("NavigationHistoryEntry.id", "id")}} của {{domxref("NavigationHistoryEntry")}} đích nếu {{domxref("NavigateEvent.navigationType")}} là `traverse`, hoặc một chuỗi rỗng nếu không.
- {{domxref("NavigationDestination.index", "index")}} {{ReadOnlyInline}}
  - : Trả về giá trị {{domxref("NavigationHistoryEntry.index", "index")}} của {{domxref("NavigationHistoryEntry")}} đích nếu {{domxref("NavigateEvent.navigationType")}} là `traverse`, hoặc `-1` nếu không.
- {{domxref("NavigationDestination.key", "key")}} {{ReadOnlyInline}}
  - : Trả về giá trị {{domxref("NavigationHistoryEntry.key", "key")}} của {{domxref("NavigationHistoryEntry")}} đích nếu {{domxref("NavigateEvent.navigationType")}} là `traverse`, hoặc một chuỗi rỗng nếu không.
- {{domxref("NavigationDestination.sameDocument", "sameDocument")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu điều hướng đến cùng `document` như giá trị {{domxref("Document")}} hiện tại, hoặc `false` nếu không.
- {{domxref("NavigationDestination.url", "url")}} {{ReadOnlyInline}}
  - : Trả về URL đang được điều hướng đến.

## Phương thức phiên bản

- {{domxref("NavigationDestination.getState", "getState()")}}
  - : Trả về một bản sao của trạng thái có sẵn liên quan đến {{domxref("NavigationHistoryEntry")}} đích, hoặc thao tác điều hướng (ví dụ, {{domxref("Navigation.navigate()", "navigate()")}}) khi thích hợp.

## Ví dụ

```js
navigation.addEventListener("navigate", (event) => {
  // Exit early if this navigation shouldn't be intercepted,
  // e.g. if the navigation is cross-origin, or a download request
  if (shouldNotIntercept(event)) {
    return;
  }

  // Returns a URL() object constructed from the
  // NavigationDestination.url value
  const url = new URL(event.destination.url);

  if (url.pathname.startsWith("/articles/")) {
    event.intercept({
      async handler() {
        // The URL has already changed, so show a placeholder while
        // fetching the new content, such as a spinner or loading page
        renderArticlePagePlaceholder();

        // Fetch the new content and display when ready
        const articleContent = await getArticleContent(url.pathname);
        renderArticlePage(articleContent);
      },
    });
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
- [Navigation API live demo](https://mdn.github.io/dom-examples/navigation-api/) ([view demo source](https://github.com/mdn/dom-examples/tree/main/navigation-api))
