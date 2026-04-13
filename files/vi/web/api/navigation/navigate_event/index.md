---
title: "Navigation: sự kiện navigate"
short-title: navigate
slug: Web/API/Navigation/navigate_event
page-type: web-api-event
browser-compat: api.Navigation.navigate_event
---

{{APIRef("Navigation API")}}

Sự kiện **`navigate`** của giao diện {{domxref("Navigation")}} được phát ra khi [bất kỳ loại điều hướng nào](https://github.com/WICG/navigation-api#appendix-types-of-navigations) được khởi tạo, cho phép bạn chặn khi cần.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("navigate", (event) => { })

onnavigate = (event) => { }
```

## Loại sự kiện

Một {{domxref("NavigateEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("NavigateEvent")}}

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

> [!NOTE]
> Trước khi Navigation API có sẵn, để làm điều gì đó tương tự, bạn phải lắng nghe tất cả sự kiện click trên liên kết, chạy `event.preventDefault()`, thực hiện cuộc gọi {{domxref("History.pushState()")}} phù hợp, rồi thiết lập view trang dựa trên URL mới. Và cách này không xử lý tất cả các điều hướng, chỉ những click liên kết do người dùng khởi tạo.

### Xử lý cuộn bằng `scroll()`

Trong ví dụ chặn điều hướng này, hàm `handler()` bắt đầu bằng cách tải và hiển thị một số nội dung bài viết, nhưng sau đó tải và hiển thị một số nội dung phụ. Việc cuộn trang đến nội dung bài viết chính ngay khi nó có sẵn để người dùng có thể tương tác với nó là điều hợp lý, thay vì chờ cho đến khi nội dung phụ cũng được hiển thị. Để đạt được điều này, chúng ta đã thêm một cuộc gọi {{domxref("NavigateEvent.scroll", "scroll()")}} giữa hai phần.

```js
navigation.addEventListener("navigate", (event) => {
  if (shouldNotIntercept(navigateEvent)) {
    return;
  }
  const url = new URL(event.destination.url);

  if (url.pathname.startsWith("/articles/")) {
    event.intercept({
      async handler() {
        const articleContent = await getArticleContent(url.pathname);
        renderArticlePage(articleContent);

        event.scroll();

        const secondaryContent = await getSecondaryContent(url.pathname);
        addSecondaryContent(secondaryContent);
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
