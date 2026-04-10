---
title: Fullscreen API
slug: Web/API/Fullscreen_API
page-type: web-api-overview
browser-compat:
  - api.Document.fullscreenElement
  - api.Document.fullscreenEnabled
  - api.Document.exitFullscreen
  - api.Element.requestFullscreen
---

{{DefaultAPISidebar("Fullscreen API")}}

**Fullscreen API** thêm các phương thức để hiển thị một {{DOMxRef("Element")}} cụ thể cùng các phần tử con của nó ở chế độ toàn màn hình, và để thoát khỏi chế độ toàn màn hình khi không còn cần nữa. Nhờ đó, có thể trình bày nội dung mong muốn, chẳng hạn một trò chơi trực tuyến, trên toàn bộ màn hình của người dùng, loại bỏ mọi thành phần giao diện của trình duyệt và các ứng dụng khác khỏi màn hình cho đến khi chế độ toàn màn hình bị tắt.

Xem bài viết [Hướng dẫn dùng Fullscreen API](/en-US/docs/Web/API/Fullscreen_API/Guide) để biết chi tiết về cách sử dụng API này.

## Giao diện

_Fullscreen API không có giao diện riêng. Thay vào đó, nó mở rộng một số giao diện khác để thêm các phương thức, thuộc tính và trình xử lý sự kiện cần thiết cho chức năng toàn màn hình. Các mục đó được liệt kê trong các phần sau._

## Phương thức thể hiện

Fullscreen API thêm các phương thức vào các giao diện {{DOMxRef("Document")}} và {{DOMxRef("Element")}} để cho phép bật và tắt chế độ toàn màn hình.

### Phương thức thể hiện trên giao diện Document

- {{DOMxRef("Document.exitFullscreen()")}}
  - : Yêu cầu {{Glossary("user agent")}} chuyển từ chế độ toàn màn hình về chế độ cửa sổ. Phương thức trả về một {{jsxref("Promise")}} sẽ được giải quyết khi chế độ toàn màn hình đã tắt hoàn toàn.

### Phương thức thể hiện trên giao diện Element

- {{DOMxRef("Element.requestFullscreen()")}}
  - : Yêu cầu user agent đưa phần tử được chỉ định, và theo đó là các phần tử con của nó, vào chế độ toàn màn hình, đồng thời loại bỏ mọi thành phần giao diện của trình duyệt cũng như mọi ứng dụng khác khỏi màn hình. Phương thức trả về một {{jsxref("Promise")}} sẽ được giải quyết khi chế độ toàn màn hình đã được kích hoạt.

## Thuộc tính thể hiện

- {{DOMxRef("Document.fullscreenElement")}} / {{DOMxRef("ShadowRoot.fullscreenElement")}}
  - : Thuộc tính `fullscreenElement` cho biết {{DOMxRef("Element")}} nào hiện đang được hiển thị ở chế độ toàn màn hình trên DOM (hoặc shadow DOM). Nếu giá trị là `null`, tài liệu (hoặc shadow DOM) không ở chế độ toàn màn hình.
- {{DOMxRef("Document.fullscreenEnabled")}}
  - : Thuộc tính `fullscreenEnabled` cho biết liệu có thể vào chế độ toàn màn hình hay không. Giá trị là `false` nếu chế độ toàn màn hình không khả dụng vì bất kỳ lý do nào, chẳng hạn tính năng `"fullscreen"` không được phép hoặc không được hỗ trợ.

### Thuộc tính lỗi thời

- {{DOMxRef("Document.fullscreen")}} {{Deprecated_Inline}}
  - : Một giá trị Boolean là `true` nếu tài liệu có phần tử hiện đang được hiển thị ở chế độ toàn màn hình; ngược lại trả về `false`.

    > [!NOTE]
    > Hãy dùng thuộc tính {{DOMxRef("Document.fullscreenElement", "fullscreenElement")}} trên {{DOMxRef("Document")}} hoặc {{DOMxRef("ShadowRoot")}}; nếu giá trị của nó không phải `null`, thì đó là {{DOMxRef("Element")}} hiện đang được hiển thị ở chế độ toàn màn hình.

## Sự kiện

- {{domxref("Element/fullscreenchange_event", "fullscreenchange")}}
  - : Được gửi tới một {{DOMxRef("Element")}} khi nó chuyển vào hoặc ra khỏi chế độ toàn màn hình.
- {{domxref("Element/fullscreenerror_event", "fullscreenerror")}}
  - : Được gửi tới một `Element` nếu xảy ra lỗi trong lúc cố gắng chuyển nó vào hoặc ra khỏi chế độ toàn màn hình.

## Kiểm soát quyền truy cập

Khả năng dùng chế độ toàn màn hình có thể được kiểm soát bằng [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy). Tính năng chế độ toàn màn hình được nhận diện bằng chuỗi `"fullscreen"`, với giá trị danh sách cho phép mặc định là `"self"`, nghĩa là chế độ toàn màn hình được phép trong ngữ cảnh tài liệu cấp cao nhất, cũng như trong các ngữ cảnh duyệt web lồng nhau được tải từ cùng origin với tài liệu ở mức cao nhất.

## Lưu ý khi dùng

Người dùng có thể thoát khỏi chế độ toàn màn hình bằng cách nhấn phím <kbd>ESC</kbd> (hoặc <kbd>F11</kbd>) thay vì chờ site hoặc ứng dụng thực hiện việc đó bằng chương trình. Hãy bảo đảm bạn cung cấp, ở đâu đó trong giao diện người dùng, các thành phần phù hợp để cho người dùng biết rằng tùy chọn này có sẵn.

> [!NOTE]
> Điều hướng sang trang khác, đổi thẻ, hoặc chuyển sang ứng dụng khác bằng bộ chuyển ứng dụng bất kỳ (hoặc <kbd>Alt</kbd>-<kbd>Tab</kbd>) cũng sẽ thoát khỏi chế độ toàn màn hình.

## Ví dụ

### Cách dùng fullscreen đơn giản

Trong ví dụ này, một video được trình bày trong trang web. Nhấn phím <kbd>Enter</kbd> cho phép người dùng chuyển đổi giữa chế độ cửa sổ và chế độ toàn màn hình của video.

[Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/fullscreen-api/index.html)

#### Theo dõi phím Enter

Khi trang được tải, mã này được chạy để thiết lập trình nghe sự kiện theo dõi phím <kbd>Enter</kbd>.

```js
const video = document.getElementById("video");

// Khi nhấn ENTER, gọi phương thức toggleFullScreen
document.addEventListener("keydown", (e) => {
  if (e.key === "Enter") {
    toggleFullScreen(video);
  }
});
```

#### Chuyển đổi chế độ toàn màn hình

Mã này được bộ xử lý sự kiện ở trên gọi khi người dùng nhấn phím <kbd>Enter</kbd>.

```js
function toggleFullScreen(video) {
  if (!document.fullscreenElement) {
    // Nếu tài liệu không ở chế độ toàn màn hình
    // hãy đưa video vào chế độ toàn màn hình
    video.requestFullscreen();
  } else {
    // Ngược lại, thoát khỏi chế độ toàn màn hình
    document.exitFullscreen?.();
  }
}
```

Đoạn mã này bắt đầu bằng cách xem giá trị của thuộc tính `fullscreenElement` của {{DOMxRef("Document", "document")}}. Nếu giá trị là `null`, tài liệu hiện đang ở chế độ cửa sổ, vì vậy cần chuyển sang chế độ toàn màn hình; nếu không, đó là phần tử hiện đang ở chế độ toàn màn hình. Việc chuyển sang chế độ toàn màn hình được thực hiện bằng cách gọi {{DOMxRef("Element.requestFullscreen()")}} trên phần tử {{HTMLElement("video")}}.

Nếu chế độ toàn màn hình đã kích hoạt (`fullscreenElement` không phải `null`), chúng ta gọi {{DOMxRef("Document.exitFullscreen", "exitFullscreen()")}} trên `document` để tắt chế độ toàn màn hình.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Element.requestFullscreen()")}}
- {{DOMxRef("Document.exitFullscreen()")}}
- {{DOMxRef("Document.fullscreen")}}
- {{DOMxRef("Document.fullscreenElement")}}
- {{CSSxRef(":fullscreen")}}, {{CSSxRef("::backdrop")}}
- [`allowfullscreen`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowfullscreen)
