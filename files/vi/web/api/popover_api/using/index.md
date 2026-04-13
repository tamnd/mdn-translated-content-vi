---
title: Sử dụng Popover API
slug: Web/API/Popover_API/Using
page-type: guide
---

{{DefaultAPISidebar("Popover API")}}

**Popover API** cung cấp cho các nhà phát triển một cơ chế tiêu chuẩn, nhất quán, linh hoạt để hiển thị nội dung popover trên các nội dung trang khác. Nội dung popover có thể được kiểm soát theo cách khai báo bằng các thuộc tính HTML hoặc thông qua JavaScript. Bài viết này cung cấp hướng dẫn chi tiết về cách sử dụng tất cả các tính năng của nó.

## Tạo popover khai báo

Ở dạng đơn giản nhất, một popover được tạo bằng cách thêm thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) vào phần tử mà bạn muốn chứa nội dung popover. Cũng cần có `id` để liên kết popover với các điều khiển của nó.

```html
<div id="mypopover" popover>Popover content</div>
```

> [!NOTE]
> Đặt thuộc tính `popover` không có giá trị tương đương với đặt `popover="auto"`.

Thêm thuộc tính này khiến phần tử bị ẩn khi tải trang bằng cách đặt {{cssxref("display", "display: none")}} trên nó. Để hiển thị/ẩn popover, bạn cần thêm ít nhất một nút điều khiển (còn được gọi là **invoker** của popover). Bạn có thể đặt {{htmlelement("button")}} (hoặc {{htmlelement("input")}} với `type="button"`) làm nút điều khiển popover bằng cách cấp cho nó thuộc tính [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget), giá trị của thuộc tính này phải là ID của popover cần kiểm soát:

```html
<button popovertarget="mypopover">Toggle the popover</button>
<div id="mypopover" popover>Popover content</div>
```

Hành vi mặc định là nút là một nút chuyển đổi — nhấn nhiều lần sẽ chuyển đổi popover giữa hiển thị và ẩn.

Nếu bạn muốn thay đổi hành vi đó, bạn có thể sử dụng thuộc tính [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction) — nhận giá trị `"hide"`, `"show"` hoặc `"toggle"`. Ví dụ, để tạo các nút hiển thị và ẩn riêng biệt:

```html
<button popovertarget="mypopover" popovertargetaction="show">
  Show popover
</button>
<button popovertarget="mypopover" popovertargetaction="hide">
  Hide popover
</button>
<div id="mypopover" popover>Popover content</div>
```

### `command` và `commandfor`

Các thuộc tính [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor) và [`command`](/en-US/docs/Web/HTML/Reference/Elements/button#command) cung cấp chức năng rất giống với `popovertarget` và `popovertargetaction`, nhưng với thiết kế tổng quát hơn hướng đến việc cung cấp các chức năng khác ngoài các lệnh popover.

```html live-sample___command-commandfor
<button commandfor="mypopover" command="show-popover">Show popover</button>
<button commandfor="mypopover" command="hide-popover">Hide popover</button>
<div id="mypopover" popover>Popover content</div>
```

{{EmbedLiveSample("command-commandfor", "100%", "100")}}

## Trạng thái auto và "light dismiss"

Khi một phần tử popover được đặt với `popover` hoặc `popover="auto"`, nó được cho là có **trạng thái auto**. Hai hành vi quan trọng cần lưu ý về trạng thái auto là:

- Popover có thể được "light dismissed" — điều này có nghĩa là bạn có thể ẩn popover bằng cách nhấp bên ngoài nó.
- Popover cũng có thể được đóng, sử dụng các cơ chế đặc thù của trình duyệt như nhấn phím <kbd>Esc</kbd>.
- Thông thường, chỉ có một popover `auto` có thể được hiển thị tại một thời điểm.

## Khả năng tiếp cận của Popover

Khi mối quan hệ được thiết lập giữa một popover và điều khiển của nó (invoker) thông qua thuộc tính `popovertarget`, API tự động thực hiện hai thay đổi khác cho môi trường để cho phép người dùng bàn phím và công nghệ hỗ trợ (AT) tương tác dễ dàng hơn với popover:

- Khi popover được hiển thị, thứ tự điều hướng tiêu điểm bàn phím được cập nhật để popover là tiếp theo trong chuỗi.
- Để cho phép AT hiểu được mối quan hệ giữa invoker và popover, một mối quan hệ ngầm định [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) và [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) được thiết lập giữa chúng.

## Sử dụng trạng thái popover thủ công

Một lựa chọn thay thế cho trạng thái auto là **trạng thái manual**, đạt được bằng cách đặt `popover="manual"` trên phần tử popover của bạn:

```html
<div id="mypopover" popover="manual">Popover content</div>
```

Trong trạng thái này:

- Popover không thể được "light dismissed".
- Có thể hiển thị nhiều popover độc lập cùng một lúc.

## Các sự kiện `beforetoggle` và `toggle`

Bạn có thể phản ứng với việc popover được hiển thị hoặc ẩn bằng cách sử dụng các sự kiện [`beforetoggle`](/en-US/docs/Web/API/HTMLElement/beforetoggle_event) và [`toggle`](/en-US/docs/Web/API/HTMLElement/toggle_event):

```js
const popover = document.getElementById("mypopover");

popover.addEventListener("toggle", (e) => {
  console.log(e.newState);
});
```

## Hiển thị popover qua JavaScript

Bạn cũng có thể kiểm soát popover bằng JavaScript API:

- {{domxref("HTMLElement.showPopover()")}} để hiển thị một popover.
- {{domxref("HTMLElement.hidePopover()")}} để ẩn một popover.
- {{domxref("HTMLElement.togglePopover()")}} để chuyển đổi một popover.

## Các popover lồng nhau

Có một ngoại lệ cho quy tắc về việc không hiển thị nhiều popover auto cùng một lúc — khi chúng được lồng vào nhau. Trong những trường hợp như vậy, nhiều popover được phép mở cùng một lúc, do mối quan hệ của chúng với nhau.

## Sử dụng trạng thái popover "hint"

Có một loại popover thứ ba bạn có thể tạo, được chỉ định bằng cách đặt `popover="hint"` trên phần tử popover của bạn. Các popover `hint` không đóng các popover `auto` khi chúng được hiển thị, nhưng sẽ đóng các popover `hint` khác.

## Tạo kiểu cho popover

Phần này đề cập đến một số kỹ thuật chọn CSS và định vị liên quan đến popover.

### Chọn popover

Bạn có thể chọn tất cả các popover bằng một bộ chọn thuộc tính đơn giản:

```css
[popover] {
  /* Declarations here */
}
```

Bạn có thể chọn chỉ các popover đang hiển thị bằng pseudo-class {{cssxref(":popover-open")}}:

```css
:popover-open {
  /* Declarations here */
}
```

### Tạo kiểu backdrop của popover

Pseudo-element {{cssxref("::backdrop")}} là một phần tử toàn màn hình được đặt trực tiếp phía sau các phần tử popover đang hiển thị trong {{glossary("top layer")}}.

### Định vị popover

Khi nhìn vào một vài ví dụ đầu tiên, bạn có thể nhận thấy rằng các popover xuất hiện ở giữa viewport. Đây là kiểu mặc định, đạt được bằng cách sử dụng quy tắc sau trong stylesheet UA:

```css
[popover] {
  position: fixed;
  inset: 0;
  width: fit-content;
  height: fit-content;
  margin: auto;
  border: solid;
  padding: 0.25em;
  overflow: auto;
  color: CanvasText;
  background-color: Canvas;
}
```

## Hoạt hình popover

Popover được đặt thành `display: none;` khi ẩn và `display: block;` khi hiển thị. Để các popover có thể được hoạt hình, thuộc tính {{cssxref("display")}} cần có khả năng hoạt hình.

### Chuyển đổi một popover

Khi hoạt hình popover với các chuyển đổi CSS, các tính năng sau đây là bắt buộc:

- {{CSSxRef("@starting-style")}} at-rule
- {{CSSxRef("display")}} property
- {{CSSxRef("overlay")}} property
- {{cssxref("transition-behavior")}} property

#### Kết quả

{{ EmbedLiveSample("Transitioning a popover", "100%", "200") }}

### Hoạt hình keyframe của popover

Khi hoạt hình một popover với các hoạt hình keyframe CSS, có một vài điểm khác biệt cần lưu ý.

#### Kết quả

{{ EmbedLiveSample("A popover keyframe animation", "100%", "200") }}

## Xem thêm

- Tập hợp [ví dụ Popover API](https://mdn.github.io/dom-examples/popover-api/)
