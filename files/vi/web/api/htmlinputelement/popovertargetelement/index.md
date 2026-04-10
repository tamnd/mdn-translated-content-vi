---
title: "HTMLInputElement: thuộc tính popoverTargetElement"
short-title: popoverTargetElement
slug: Web/API/HTMLInputElement/popoverTargetElement
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.popoverTargetElement
---

{{APIRef("Popover API")}}

Thuộc tính **`popoverTargetElement`** của giao diện {{domxref("HTMLInputElement")}} lấy và đặt phần tử popover để điều khiển thông qua phần tử {{htmlelement("input")}} loại `type="button"`.

Nó là tương đương JavaScript của thuộc tính HTML [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget).

Thiết lập mối quan hệ giữa popover và nút gọi của nó bằng thuộc tính `popoverTargetElement` có hai hiệu quả hữu ích bổ sung:

- Trình duyệt tạo mối quan hệ [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) và [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) ngầm định giữa popover và nút gọi, và đặt popover vào vị trí hợp lý trong thứ tự điều hướng bàn phím khi hiển thị. Điều này làm cho popover dễ tiếp cận hơn với người dùng bàn phím và công nghệ hỗ trợ (AT) (xem thêm [Tính năng trợ năng của Popover](/en-US/docs/Web/API/Popover_API/Using#popover_accessibility_features)).
- Trình duyệt tạo tham chiếu neo ngầm định giữa hai phần tử, giúp định vị popover tương đối so với điều khiển của chúng bằng [định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning) rất thuận tiện. Xem [Định vị neo Popover](/en-US/docs/Web/API/Popover_API/Using#popover_anchor_positioning) để biết thêm chi tiết.

## Giá trị

Một tham chiếu đến phần tử popover trong DOM.

## Ví dụ

```js
function supportsPopover() {
  return Object.hasOwn(HTMLElement.prototype, "popover");
}

const popover = document.getElementById("mypopover");
const toggleBtn = document.getElementById("toggleBtn");

const popoverSupported = supportsPopover();

if (popoverSupported) {
  popover.popover = "auto";
  toggleBtn.popoverTargetElement = popover;
  toggleBtn.popoverTargetAction = "toggle";
} else {
  console.log("Popover API không được hỗ trợ.");
}
```

### Hành động bật/tắt popover với auto popover

Ví dụ này cho thấy cách sử dụng cơ bản của popover API, đặt một phần tử `<div>` làm popover, và sau đó đặt nó làm `popoverTargetElement` của một [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input/button) loại `type="button"`.
Thuộc tính `popover` được đặt thành [`"auto"`](/en-US/docs/Web/API/Popover_API/Using#auto_state_and_light_dismiss), nên popover có thể được đóng ("light-dismissed") bằng cách nhấp chuột bên ngoài vùng popover.

Đầu tiên chúng ta định nghĩa một `<input>` sẽ dùng để hiển thị và ẩn popover, và một `<div>` sẽ là popover.
Trong trường hợp này chúng ta không đặt thuộc tính HTML [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction) trên `<input>` hoặc thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) trên `<div>`, vì chúng ta sẽ làm điều đó bằng lập trình.

```html
<input id="toggleBtn" type="button" value="Bật/tắt popover" />
<div id="mypopover">Đây là nội dung popover!</div>
```

Mã JavaScript đầu tiên lấy tham chiếu đến các phần tử `<div>` và `<input>`.
Sau đó định nghĩa một hàm để kiểm tra hỗ trợ popover.

```js
const popover = document.getElementById("mypopover");
const toggleBtn = document.getElementById("toggleBtn");

// Kiểm tra hỗ trợ popover API.
function supportsPopover() {
  return Object.hasOwn(HTMLElement.prototype, "popover");
}
```

Nếu popover API được hỗ trợ, mã đặt thuộc tính `popover` của phần tử `<div>` thành `"auto"` và biến nó thành mục tiêu popover của nút bật/tắt.
Sau đó chúng ta đặt `popoverTargetAction` của nút thành `"toggle"`.
Nếu popover API không được hỗ trợ, chúng ta thay đổi nội dung văn bản của phần tử `<div>` để thông báo điều này và ẩn phần tử input.

```js
if (supportsPopover()) {
  // Đặt phần tử <div> thành auto popover
  popover.popover = "auto";

  // Đặt mục tiêu popover của nút là popover
  toggleBtn.popoverTargetElement = popover;

  // Đặt nút bật/tắt khả năng hiển thị popover
  toggleBtn.popoverTargetAction = "toggle";
} else {
  popover.textContent = "Popover API không được hỗ trợ.";
  toggleBtn.hidden = true;
}
```

> [!NOTE]
> Phần tử popover bị ẩn theo mặc định, nhưng nếu API không được hỗ trợ, phần tử của bạn sẽ hiển thị "bình thường".

Bạn có thể thử ví dụ dưới đây.
Hiển thị và ẩn popover bằng cách bật/tắt nút.
Popover "auto" cũng có thể được light dismissed bằng cách chọn bên ngoài giới hạn của văn bản popover.

{{EmbedLiveSample("Toggle popover action with an auto popover", "100%")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)
- [Popover API](/en-US/docs/Web/API/Popover_API)
