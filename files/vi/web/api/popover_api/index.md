---
title: Popover API
slug: Web/API/Popover_API
page-type: web-api-overview
browser-compat:
  - api.HTMLElement.popover
  - api.HTMLElement.beforetoggle_event.popover_elements
  - api.HTMLElement.toggle_event.popover_elements
---

{{DefaultAPISidebar("Popover API")}}

**Popover API** cung cấp cho các nhà phát triển một cơ chế tiêu chuẩn, nhất quán, linh hoạt để hiển thị nội dung popover trên các nội dung trang khác. Nội dung popover có thể được kiểm soát bằng các thuộc tính HTML hoặc thông qua JavaScript.

## Khái niệm và cách sử dụng

Một mẫu rất phổ biến trên web là hiển thị nội dung lên trên các nội dung khác, thu hút sự chú ý của người dùng vào thông tin quan trọng cụ thể hoặc các hành động cần thực hiện. Nội dung này có thể có nhiều tên khác nhau: overlay, popup, popover, dialog, v.v. Chúng tôi sẽ gọi chúng là popover trong tài liệu. Nói chung, chúng có thể là:

- **Modal**, nghĩa là trong khi một popover đang hiển thị, phần còn lại của trang được hiển thị ở trạng thái không tương tác cho đến khi popover được hành động theo cách nào đó (ví dụ: một lựa chọn quan trọng được thực hiện).
- **Non-modal**, nghĩa là phần còn lại của trang có thể tương tác trong khi popover đang hiển thị.

Các popover được tạo bằng Popover API luôn là non-modal. Nếu bạn muốn tạo một popover modal, một phần tử {{htmlelement("dialog")}} là cách phù hợp.

Các trường hợp sử dụng điển hình cho popover API bao gồm các phần tử tương tác người dùng như menu hành động, thông báo "toast" tùy chỉnh, gợi ý phần tử form, bộ chọn nội dung hoặc giao diện học tập.

Bạn có thể tạo popover theo nhiều cách:

- Thông qua một tập hợp các thuộc tính HTML mới. Một popover đơn giản với nút chuyển đổi có thể được tạo bằng mã sau:

  ```html
  <button popovertarget="mypopover">Toggle the popover</button>
  <div id="mypopover" popover>Popover content</div>
  ```

- Thông qua JavaScript API. Ví dụ, {{domxref("HTMLElement.togglePopover()")}} có thể được sử dụng để chuyển đổi một popover giữa hiển thị và ẩn.

Popover API cũng cung cấp các sự kiện để phản ứng với một popover được chuyển đổi và các tính năng CSS để hỗ trợ tạo kiểu cho popover. Xem [Sử dụng Popover API](/en-US/docs/Web/API/Popover_API/Using) để biết hướng dẫn chi tiết về API.

## Thuộc tính HTML

- [`interestfor`](/en-US/docs/Web/HTML/Reference/Elements/button#interestfor) {{experimental_inline}}
  - : Định nghĩa một phần tử HTML {{htmlelement("a")}}, {{htmlelement("button")}} hoặc {{htmlelement("area")}}, hoặc phần tử SVG [`<a>`](/en-US/docs/Web/SVG/Reference/Element/a) như một interest invoker.
- [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)
  - : Một thuộc tính toàn cục biến một phần tử thành phần tử popover; nhận một trạng thái popover (`"auto"`, `"hint"` hoặc `"manual"`) làm giá trị.
- [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget)
  - : Biến một phần tử {{htmlelement("button")}} hoặc {{htmlelement("input")}} thành nút kiểm soát popover; nhận ID của phần tử popover cần kiểm soát làm giá trị.
- [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction)
  - : Chỉ định hành động được thực hiện (`"hide"`, `"show"` hoặc `"toggle"`) trên phần tử popover đang được kiểm soát bởi một {{htmlelement("button")}} hoặc {{htmlelement("input")}} kiểm soát.

## Tính năng CSS

- {{cssxref("::backdrop")}}
  - : Pseudo-element `::backdrop` là một phần tử toàn màn hình được đặt trực tiếp phía sau các phần tử popover, cho phép thêm hiệu ứng cho nội dung trang phía sau popover nếu muốn (ví dụ: làm mờ).
- {{cssxref("interest-delay")}}, {{cssxref("interest-delay-start")}}, và {{cssxref("interest-delay-end")}} {{experimental_inline}}
  - : Thuộc tính viết tắt `interest-delay` và các thuộc tính dài hơn liên quan có thể được sử dụng để thêm độ trễ giữa khi người dùng hiển thị hoặc mất quan tâm và trình duyệt hành động dựa trên thay đổi đó.
- {{cssxref(":interest-source")}} và {{cssxref(":interest-target")}}
  - : Các bộ chọn này có thể được sử dụng để áp dụng kiểu cho interest invoker và phần tử mục tiêu liên kết của nó, tương ứng, chỉ khi quan tâm được chỉ ra.
- {{cssxref(":popover-open")}}
  - : Pseudo-class `:popover-open` khớp với một phần tử popover chỉ khi nó ở trạng thái hiển thị.

## Giao diện

- {{domxref("InterestEvent")}} {{experimental_inline}}
  - : Đối tượng sự kiện cho các sự kiện {{domxref("HTMLElement.interest_event", "interest")}} và {{domxref("HTMLElement.loseinterest_event", "loseinterest")}}. Điều này bao gồm thuộc tính `source` chứa tham chiếu đến phần tử interest invoker liên kết.
- {{domxref("ToggleEvent")}}
  - : Đại diện cho một sự kiện kích hoạt khi một phần tử popover được chuyển đổi giữa trạng thái hiển thị và ẩn. Đây là đối tượng sự kiện cho các sự kiện {{domxref("HTMLElement.beforetoggle_event", "beforetoggle")}} và {{domxref("HTMLElement.toggle_event", "toggle")}}.

## Mở rộng cho các giao diện khác

### Thuộc tính phiên bản

- {{domxref("HTMLButtonElement.interestForElement", "interestForElement")}} {{experimental_inline}}
  - : Lấy hoặc đặt một tham chiếu đến phần tử đang được nhắm mục tiêu bởi một interest invoker.
- {{domxref("HTMLElement.popover")}}
  - : Lấy và đặt trạng thái popover của một phần tử thông qua JavaScript (`"auto"`, `"hint"` hoặc `"manual"`), và có thể được sử dụng để phát hiện tính năng.
- {{domxref("HTMLButtonElement.popoverTargetElement")}} và {{domxref("HTMLInputElement.popoverTargetElement")}}
  - : Lấy và đặt phần tử popover đang được kiểm soát bởi nút kiểm soát.
- {{domxref("HTMLButtonElement.popoverTargetAction")}} và {{domxref("HTMLInputElement.popoverTargetAction")}}
  - : Lấy và đặt hành động được thực hiện (`"hide"`, `"show"` hoặc `"toggle"`) trên phần tử popover đang được kiểm soát bởi nút kiểm soát.

### Phương thức phiên bản

- {{domxref("HTMLElement.hidePopover()")}}
  - : Ẩn một phần tử popover bằng cách xóa nó khỏi lớp trên cùng và tạo kiểu với `display: none`.
- {{domxref("HTMLElement.showPopover()")}}
  - : Hiển thị một phần tử popover bằng cách thêm nó vào lớp trên cùng.
- {{domxref("HTMLElement.togglePopover()")}}
  - : Chuyển đổi một phần tử popover giữa trạng thái hiển thị và ẩn.

### Sự kiện

- Sự kiện {{domxref("HTMLElement.beforetoggle_event","beforetoggle")}}
  - : Được kích hoạt ngay trước khi trạng thái của một phần tử popover thay đổi giữa hiển thị và ẩn, hoặc ngược lại.
- Sự kiện {{domxref("HTMLElement.toggle_event", "toggle")}}
  - : Được kích hoạt ngay sau khi trạng thái của một phần tử popover thay đổi giữa hiển thị và ẩn, hoặc ngược lại.
- {{domxref("HTMLElement.interest_event", "interest")}} {{experimental_inline}}
  - : Được kích hoạt trên phần tử mục tiêu của interest invoker khi quan tâm được hiển thị.
- {{domxref("HTMLElement.loseinterest_event", "loseinterest")}} {{experimental_inline}}
  - : Được kích hoạt trên phần tử mục tiêu của interest invoker khi mất quan tâm.

## Ví dụ

- Xem tập hợp [ví dụ Popover API](https://mdn.github.io/dom-examples/popover-api/) của chúng tôi.
- Xem tập hợp [ví dụ interest invoker](https://mdn.github.io/dom-examples/interest-invokers/) của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)
- Thuộc tính HTML [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget)
- Thuộc tính HTML [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction)
- Pseudo-element CSS {{cssxref("::backdrop")}}
- Pseudo-class CSS {{cssxref(":popover-open")}}
