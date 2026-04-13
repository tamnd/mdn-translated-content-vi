---
title: NavigateEvent
slug: Web/API/NavigateEvent
page-type: web-api-interface
browser-compat: api.NavigateEvent
---

{{APIRef("Navigation API")}}

Giao diện **`NavigateEvent`** của {{domxref("Navigation API", "Navigation API", "", "nocode")}} là đối tượng sự kiện cho sự kiện {{domxref("Navigation/navigate_event", "navigate")}}, được kích hoạt khi [bất kỳ loại điều hướng nào](https://github.com/WICG/navigation-api#appendix-types-of-navigations) được khởi tạo (bao gồm cả việc dùng các tính năng của {{domxref("History API", "History API", "", "nocode")}} như {{domxref("History.go()")}}). `NavigateEvent` cung cấp quyền truy cập vào thông tin về điều hướng đó, đồng thời cho phép nhà phát triển chặn và kiểm soát cách xử lý điều hướng.

{{InheritanceDiagram}}

## Constructor

- {{domxref("NavigateEvent.NavigateEvent", "NavigateEvent()")}}
  - : Tạo một thực thể `NavigateEvent` mới.

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("Event")}}._

- {{domxref("NavigateEvent.canIntercept", "canIntercept")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu điều hướng có thể bị chặn, ngược lại trả về `false` (ví dụ: bạn không thể chặn một điều hướng xuyên nguồn gốc).
- {{domxref("NavigateEvent.destination", "destination")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("NavigationDestination")}} đại diện cho đích đến mà điều hướng đang hướng tới.
- {{domxref("NavigateEvent.downloadRequest", "downloadRequest")}} {{ReadOnlyInline}}
  - : Trả về tên tệp được yêu cầu tải xuống, trong trường hợp là điều hướng tải xuống (ví dụ: một phần tử {{htmlelement("a")}} hoặc {{htmlelement("area")}} có thuộc tính `download`), hoặc `null` trong các trường hợp khác.
- {{domxref("NavigateEvent.formData", "formData")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("FormData")}} đại diện cho dữ liệu đã gửi trong trường hợp gửi biểu mẫu `POST`, hoặc `null` trong các trường hợp khác.
- {{domxref("NavigateEvent.hashChange", "hashChange")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu điều hướng là một điều hướng fragment, tức là tới một định danh fragment trong cùng tài liệu, ngược lại trả về `false`.
- {{domxref("NavigateEvent.hasUAVisualTransition", "hasUAVisualTransition")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu tác nhân người dùng đã thực hiện một chuyển tiếp trực quan cho điều hướng này trước khi phát sự kiện, ngược lại trả về `false`.
- {{domxref("NavigateEvent.info", "info")}} {{ReadOnlyInline}}
  - : Trả về giá trị dữ liệu `info` được truyền bởi thao tác điều hướng khởi tạo (ví dụ: {{domxref("Navigation.back()")}} hoặc {{domxref("Navigation.navigate()")}}), hoặc `undefined` nếu không có dữ liệu `info` nào được truyền.
- {{domxref("NavigateEvent.navigationType", "navigationType")}} {{ReadOnlyInline}}
  - : Trả về kiểu điều hướng: `push`, `reload`, `replace`, hoặc `traverse`.
- {{domxref("NavigateEvent.signal", "signal")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("AbortSignal")}}, sẽ bị hủy nếu điều hướng bị hủy (ví dụ: khi người dùng nhấn nút "Stop" của trình duyệt, hoặc khi một điều hướng khác bắt đầu và hủy điều hướng hiện tại).
- {{domxref("NavigateEvent.sourceElement", "sourceElement")}} {{ReadOnlyInline}}
  - : Khi điều hướng được khởi tạo bởi một phần tử (ví dụ khi nhấp vào một liên kết), trả về đối tượng {{domxref("Element")}} đại diện cho phần tử khởi tạo.
- {{domxref("NavigateEvent.userInitiated", "userInitiated")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu điều hướng được khởi tạo bởi người dùng (ví dụ: nhấp vào liên kết, gửi biểu mẫu, hoặc nhấn các nút "Back"/"Forward" của trình duyệt), ngược lại trả về `false`.

## Phương thức thể hiện

_Kế thừa các phương thức từ giao diện cha, {{DOMxRef("Event")}}._

- {{domxref("NavigateEvent.intercept", "intercept()")}}
  - : Chặn điều hướng này, biến nó thành điều hướng cùng tài liệu đến URL {{domxref("NavigationDestination.url", "destination")}}. Nó có thể nhận các hàm xử lý định nghĩa hành vi xử lý điều hướng, cùng với các tùy chọn `focusReset` và `scroll` để bật hoặc tắt hành vi mặc định của trình duyệt về tiêu điểm và cuộn theo ý muốn.
- {{domxref("NavigateEvent.scroll", "scroll()")}}
  - : Có thể được gọi để kích hoạt thủ công hành vi cuộn do trình duyệt điều khiển xảy ra để phản hồi điều hướng, nếu bạn muốn việc đó diễn ra trước khi quá trình xử lý điều hướng hoàn tất.

## Ví dụ

### Xử lý điều hướng bằng `intercept()`

```js
navigation.addEventListener("navigate", (event) => {
  // Thoát sớm nếu điều hướng này không nên bị chặn,
  // ví dụ: nếu điều hướng là xuyên nguồn gốc hoặc là yêu cầu tải xuống
  if (shouldNotIntercept(event)) return;

  const url = new URL(event.destination.url);

  if (url.pathname.startsWith("/articles/")) {
    event.intercept({
      async handler() {
        // URL đã thay đổi, nên hiển thị placeholder trong khi
        // tìm nạp nội dung mới, chẳng hạn như spinner hoặc trang đang tải
        renderArticlePagePlaceholder();

        // Tìm nạp nội dung mới và hiển thị khi sẵn sàng
        const articleContent = await getArticleContent(url.pathname);
        renderArticlePage(articleContent);
      },
    });
  }
});
```

> [!NOTE]
> Trước khi Navigation API khả dụng, để làm điều tương tự, bạn phải lắng nghe tất cả sự kiện nhấp chuột trên liên kết, chạy `e.preventDefault()`, thực hiện lời gọi {{domxref("History.pushState()")}} phù hợp, rồi thiết lập chế độ xem trang dựa trên URL mới. Và cách đó cũng không xử lý được tất cả các điều hướng, mà chỉ các lượt nhấp liên kết do người dùng khởi tạo.

### Xử lý cuộn bằng `scroll()`

Trong ví dụ này về việc chặn điều hướng, hàm `handler()` bắt đầu bằng cách tìm nạp và hiển thị một số nội dung bài viết, rồi sau đó mới tìm nạp và hiển thị thêm nội dung phụ. Sẽ hợp lý hơn nếu cuộn trang đến phần nội dung chính ngay khi nó có sẵn để người dùng có thể tương tác, thay vì đợi đến khi nội dung phụ cũng được hiển thị xong. Để làm vậy, chúng ta thêm lời gọi {{domxref("NavigateEvent.scroll", "scroll()")}} ở giữa.

```js
navigation.addEventListener("navigate", (event) => {
  if (shouldNotIntercept(event)) return;
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
- [Navigation API live demo](https://mdn.github.io/dom-examples/navigation-api/) ([xem mã nguồn demo](https://github.com/mdn/dom-examples/tree/main/navigation-api))
