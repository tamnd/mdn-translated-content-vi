---
title: Hướng dẫn dùng Fullscreen API
slug: Web/API/Fullscreen_API/Guide
page-type: guide
---

{{DefaultAPISidebar("Fullscreen API")}}

Bài viết này minh họa cách dùng [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API) để đưa một phần tử cụ thể vào chế độ toàn màn hình, cũng như cách phát hiện khi trình duyệt vào hoặc thoát khỏi chế độ toàn màn hình.

## Kích hoạt chế độ toàn màn hình

Với một phần tử bạn muốn trình bày ở chế độ toàn màn hình, chẳng hạn một {{HTMLElement("video")}}, bạn có thể đưa nó vào chế độ toàn màn hình bằng cách gọi phương thức {{DOMxRef("Element.requestFullscreen", "requestFullscreen()")}} của nó.

Hãy xét phần tử {{HTMLElement("video")}} này:

```html
<video controls id="my-video">
  <source src="somevideo.webm" />
  <source src="somevideo.mp4" />
</video>
```

Ta có thể đưa video đó vào chế độ toàn màn hình như sau:

```js
const elem = document.getElementById("my-video");
if (elem.requestFullscreen) {
  elem.requestFullscreen();
}
```

Đoạn mã này kiểm tra sự tồn tại của phương thức `requestFullscreen()` trước khi gọi nó.

Khi một phần tử ở chế độ toàn màn hình, nó sẽ khớp với {{cssxref(":fullscreen")}}, nhờ đó nhận một số kiểu mặc định như chiếm toàn bộ màn hình. Nó cũng được đưa vào {{glossary("top layer")}}.

Nếu có nhiều phần tử được yêu cầu hiển thị ở chế độ toàn màn hình, tất cả chúng đều khớp với {{cssxref(":fullscreen")}} và đều nằm trong top layer. Chúng xếp chồng lên nhau, phần tử được yêu cầu gần đây nhất nằm trên các phần tử cũ hơn. Phần tử được yêu cầu gần đây nhất sẽ được hiển thị và được trả về bởi {{domxref("Document.fullscreenElement")}}.

### Thông báo

Khi chế độ toàn màn hình được kích hoạt thành công, tài liệu chứa phần tử sẽ nhận một sự kiện {{domxref("Element/fullscreenchange_event", "fullscreenchange")}}. Khi thoát khỏi chế độ toàn màn hình, tài liệu lại nhận sự kiện {{domxref("Document/fullscreenchange_event", "fullscreenchange")}}. Lưu ý rằng sự kiện {{domxref("Document/fullscreenchange_event", "fullscreenchange")}} không tự cung cấp thông tin nào về việc tài liệu đang vào hay ra khỏi chế độ toàn màn hình, nhưng nếu tài liệu có {{DOMxRef("document.fullscreenElement", "fullscreenElement")}} khác `null`, thì bạn biết mình đang ở chế độ toàn màn hình.

### Khi yêu cầu toàn màn hình thất bại

Không có gì đảm bảo rằng bạn sẽ có thể chuyển sang chế độ toàn màn hình. Ví dụ, các phần tử {{HTMLElement("iframe")}} có thuộc tính [`allowfullscreen`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowfullscreen) để cho phép nội dung bên trong được hiển thị ở chế độ toàn màn hình. Ngoài ra, một số loại nội dung nhất định, như plug-in có cửa sổ riêng, không thể trình bày ở chế độ toàn màn hình. Việc cố gắng đưa một phần tử không thể hiển thị ở chế độ toàn màn hình vào đó, hoặc phần tử cha/con của phần tử như vậy, sẽ không hoạt động. Thay vào đó, phần tử đã yêu cầu toàn màn hình sẽ nhận sự kiện `fullscreenerror`. Khi yêu cầu toàn màn hình thất bại, Firefox sẽ ghi một thông báo lỗi vào Web Console giải thích lý do thất bại. Tuy nhiên, trong Chrome và các phiên bản Opera mới hơn, sẽ không có cảnh báo như vậy.

> [!NOTE]
> Yêu cầu toàn màn hình phải được gọi từ bên trong một bộ xử lý sự kiện, nếu không chúng sẽ bị từ chối.

## Thoát khỏi chế độ toàn màn hình

Người dùng luôn có thể tự thoát khỏi chế độ toàn màn hình; xem [Những điều người dùng của bạn muốn biết](#things_your_users_want_to_know). Bạn cũng có thể làm việc đó bằng chương trình bằng cách gọi phương thức {{DOMxRef("Document.exitFullscreen()")}}.

Nếu có nhiều phần tử ở chế độ toàn màn hình, việc gọi `exitFullscreen()` chỉ thoát phần tử ở trên cùng, để lộ phần tử tiếp theo bên dưới. Nhấn <kbd>Esc</kbd> hoặc <kbd>F11</kbd> sẽ thoát tất cả phần tử toàn màn hình.

## Thông tin khác

{{DOMxRef("Document")}} cung cấp thêm một số thông tin có thể hữu ích khi phát triển ứng dụng web toàn màn hình:

- {{DOMxRef("Document.fullscreenElement")}} / {{DOMxRef("ShadowRoot.fullscreenElement")}}
  - : Thuộc tính `fullscreenElement` cho biết {{DOMxRef("Element")}} nào hiện đang được hiển thị toàn màn hình. Nếu giá trị khác `null`, tài liệu (hoặc shadow DOM) đang ở chế độ toàn màn hình. Nếu giá trị là `null`, tài liệu (hoặc shadow DOM) không ở chế độ toàn màn hình.
- {{DOMxRef("Document.fullscreenEnabled")}}
  - : Thuộc tính `fullscreenEnabled` cho biết liệu tài liệu hiện có ở trạng thái cho phép yêu cầu chế độ toàn màn hình hay không.

### Tỷ lệ khung nhìn trong trình duyệt di động

Một số trình duyệt di động khi ở chế độ toàn màn hình sẽ bỏ qua cài đặt thẻ meta viewport và chặn việc phóng to/thu nhỏ của người dùng; ví dụ, cử chỉ "pinch to zoom" có thể không hoạt động trên trang được trình bày ở chế độ toàn màn hình, ngay cả khi trang đó có thể được phóng to/thu nhỏ bằng pinch khi không ở chế độ toàn màn hình.

## Những điều người dùng của bạn muốn biết

Bạn nên bảo đảm người dùng biết rằng họ có thể nhấn phím <kbd>Esc</kbd> (hoặc <kbd>F11</kbd>) để thoát khỏi chế độ toàn màn hình.

Ngoài ra, việc điều hướng sang trang khác, đổi thẻ hoặc chuyển sang ứng dụng khác (ví dụ bằng <kbd>Alt</kbd>-<kbd>Tab</kbd>) khi ở chế độ toàn màn hình cũng sẽ thoát khỏi chế độ đó.

## Ví dụ

[Kho GitHub mdn/dom-examples](https://github.com/mdn/) có một ví dụ hoàn chỉnh cho Fullscreen API.

[Chạy ví dụ](https://mdn.github.io/dom-examples/fullscreen-api/index.html) và [xem mã nguồn](https://github.com/mdn/dom-examples/tree/main/fullscreen-api).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng chế độ toàn màn hình](/en-US/docs/Web/API/Fullscreen_API)
- {{DOMxRef("Element.requestFullscreen()")}}
- {{DOMxRef("Document.exitFullscreen()")}}
- {{DOMxRef("Document.fullscreen")}}
- {{DOMxRef("Document.fullscreenElement")}}
- {{CSSxRef(":fullscreen")}}, {{CSSxRef("::backdrop")}}
- [`allowfullscreen`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowfullscreen)
