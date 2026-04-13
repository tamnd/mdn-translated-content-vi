---
title: "NavigationDestination: thuộc tính url"
short-title: url
slug: Web/API/NavigationDestination/url
page-type: web-api-instance-property
browser-compat: api.NavigationDestination.url
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("NavigationDestination")}} trả về URL đang được điều hướng đến.

## Giá trị

Một chuỗi.

## Ví dụ

### Xử lý điều hướng bằng `intercept()`

```js
navigation.addEventListener("navigate", (event) => {
  // Exit early if this navigation shouldn't be intercepted,
  // e.g. if the navigation is cross-origin, or a download request
  if (shouldNotIntercept(event)) {
    return;
  }

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
