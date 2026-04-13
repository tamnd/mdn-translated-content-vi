---
title: "NavigateEvent: hàm khởi tạo NavigateEvent()"
short-title: NavigateEvent()
slug: Web/API/NavigateEvent/NavigateEvent
page-type: web-api-constructor
browser-compat: api.NavigateEvent.NavigateEvent
---

{{APIRef("Navigation API")}}

Hàm khởi tạo **`NavigateEvent()`** tạo một đối tượng {{domxref("NavigateEvent")}} mới.

## Cú pháp

```js-nolint
new NavigateEvent(type, init)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại sự kiện.
- `init`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có các thuộc tính sau:
    - `canIntercept` {{optional_inline}}
      - : Một giá trị boolean xác định liệu navigation có thể bị chặn hay không (ví dụ: bạn không thể chặn navigation cross-origin). Mặc định là `false`.
    - `destination`
      - : Một đối tượng {{domxref("NavigationDestination")}} đại diện cho vị trí đang được điều hướng đến.
    - `downloadRequest` {{optional_inline}}
      - : Tên tệp của tệp được yêu cầu tải xuống, trong trường hợp navigation tải xuống (ví dụ: phần tử {{htmlelement("a")}} hoặc {{htmlelement("area")}} có thuộc tính `download`). Mặc định là `null`.
    - `formData` {{optional_inline}}
      - : Đối tượng {{domxref("FormData")}} đại diện cho dữ liệu được gửi trong trường hợp gửi biểu mẫu `POST`. Mặc định là `null`.
    - `hashChange` {{optional_inline}}
      - : Một giá trị boolean xác định liệu navigation có phải là navigation fragment (tức là đến một định danh fragment trong cùng tài liệu) hay không. Mặc định là `false`.
    - `hasUAVisualTransition` {{optional_inline}}
      - : Một giá trị boolean xác định liệu tác nhân người dùng có thực hiện quá trình chuyển tiếp trực quan cho navigation này trước khi gửi sự kiện này hay không. Mặc định là `false`.
    - `info` {{optional_inline}}
      - : Giá trị dữ liệu `info` được truyền bởi thao tác navigation khởi đầu (ví dụ: {{domxref("Navigation.back()")}} hoặc {{domxref("Navigation.navigate()")}}).
    - `navigationType` {{optional_inline}}
      - : Loại navigation. Các giá trị có thể là `push`, `reload`, `replace` và `traverse`. Mặc định là `push`.
    - `signal`
      - : Một {{domxref("AbortSignal")}}, sẽ bị hủy nếu navigation bị hủy (ví dụ: do người dùng nhấn nút "Stop" của trình duyệt, hoặc navigation khác bắt đầu và hủy navigation đang diễn ra).
    - `sourceElement` {{optional_inline}}
      - : Một đối tượng {{domxref("Element")}} đại diện cho phần tử khởi đầu trong trường hợp navigation được khởi đầu bởi một phần tử, hoặc `null` nếu navigation không được khởi đầu bởi phần tử. Mặc định là `null`.
    - `userInitiated` {{optional_inline}}
      - : Một giá trị boolean xác định liệu navigation có được khởi đầu bởi người dùng hay không (ví dụ: bằng cách nhấp vào liên kết, gửi biểu mẫu, hoặc nhấn các nút "Back"/"Forward" của trình duyệt). Mặc định là `false`.

### Giá trị trả về

Một đối tượng {{domxref("NavigateEvent")}} mới.

## Ví dụ

Nhà phát triển sẽ không sử dụng hàm khởi tạo này theo cách thủ công. Một đối tượng `NavigateEvent` mới được xây dựng khi một trình xử lý được gọi do sự kiện {{domxref("Navigation.navigate_event", "navigate")}} kích hoạt.

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
