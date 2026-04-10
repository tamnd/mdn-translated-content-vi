---
title: "HTMLInputElement: thuộc tính popoverTargetAction"
short-title: popoverTargetAction
slug: Web/API/HTMLInputElement/popoverTargetAction
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.popoverTargetAction
---

{{APIRef("Popover API")}}

Thuộc tính **`popoverTargetAction`** của giao diện {{domxref("HTMLInputElement")}} lấy và đặt hành động sẽ được thực hiện (`"hide"`, `"show"`, hoặc `"toggle"`) trên một phần tử popover được điều khiển bởi phần tử {{htmlelement("input")}} loại `type="button"`.

Nó phản ánh giá trị của thuộc tính HTML [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction).

## Giá trị

Một giá trị liệt kê. Các giá trị có thể là:

- `"hide"`
  - : Nút sẽ ẩn một popover đang hiển thị. Nếu bạn cố ẩn một popover đã ẩn, không có hành động nào được thực hiện.
- `"show"`
  - : Nút sẽ hiển thị một popover đang ẩn. Nếu bạn cố hiển thị một popover đang hiển thị, không có hành động nào được thực hiện.
- `"toggle"`
  - : Nút sẽ chuyển đổi một popover giữa trạng thái hiển thị và ẩn. Nếu popover đang ẩn, nó sẽ được hiển thị; nếu popover đang hiển thị, nó sẽ bị ẩn. Nếu `popoverTargetAction` không được đặt, `"toggle"` là hành động mặc định sẽ được thực hiện bởi nút điều khiển.

## Ví dụ

### Hành động bật/tắt popover với auto popover

Ví dụ này cho thấy cách sử dụng cơ bản của popover API với giá trị "toggle" được đặt cho thuộc tính `popoverTargetAction`.
Thuộc tính `popover` được đặt thành [`"auto"`](/en-US/docs/Web/API/Popover_API/Using#auto_state_and_light_dismiss), nên popover có thể được đóng ("light-dismissed") bằng cách nhấp chuột bên ngoài vùng popover.

Đầu tiên chúng ta định nghĩa một [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input/button) loại `type="button"` sẽ dùng để hiển thị và ẩn popover, và một `<div>` sẽ là popover.
Trong trường hợp này chúng ta không đặt thuộc tính HTML [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction) trên nút hoặc thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) trên `<div>`, vì chúng ta sẽ làm điều đó bằng lập trình.

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
Nếu popover API không được hỗ trợ, chúng ta thay đổi nội dung văn bản của phần tử `<div>` để thông báo điều này và ẩn nút bật/tắt.

```js
if (supportsPopover()) {
  // Đặt phần tử <div> thành auto popover
  popover.popover = "auto";
  // Đặt nút làm mục tiêu popover cho popover
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
Popover "auto" cũng có thể được đóng bằng cách chọn bên ngoài giới hạn của văn bản popover.

{{EmbedLiveSample("Toggle popover action with an auto popover", "100%")}}

### Hành động hiển thị/ẩn popover với manual popover

Ví dụ này cho thấy cách sử dụng các giá trị `"show"` và `"hide"` của thuộc tính `popoverTargetAction`.

Mã gần giống hệt với ví dụ trước, ngoại trừ việc có hai phần tử `<button>`, và popover được đặt thành [`"manual"`](/en-US/docs/Web/API/Popover_API/Using#using_manual_popover_state).
Popover `manual` phải được đóng rõ ràng và không thể "light dismissed" bằng cách chọn bên ngoài vùng popover.

```html
<input id="showBtn" type="button" value="Hiện popover" />
<input id="hideBtn" type="button" value="Ẩn popover" />
<div id="mypopover">Đây là nội dung popover!</div>
```

```js
function supportsPopover() {
  return Object.hasOwn(HTMLElement.prototype, "popover");
}

const popover = document.getElementById("mypopover");
const showBtn = document.getElementById("showBtn");
const hideBtn = document.getElementById("hideBtn");

const popoverSupported = supportsPopover();

if (supportsPopover()) {
  // Đặt phần tử <div> thành manual popover
  popover.popover = "manual";

  // Đặt mục tiêu của nút là popover
  showBtn.popoverTargetElement = popover;
  hideBtn.popoverTargetElement = popover;

  // Đặt hành động mục tiêu là show/hide
  showBtn.popoverTargetAction = "show";
  hideBtn.popoverTargetAction = "hide";
} else {
  popover.textContent = "Popover API không được hỗ trợ.";
  showBtn.hidden = true;
  hideBtn.hidden = true;
}
```

Popover có thể được hiển thị bằng cách chọn nút "Hiện popover", và đóng bằng nút "Ẩn popover".

{{EmbedLiveSample("Show/hide popover action with a manual popover", "100%")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)
- [Popover API](/en-US/docs/Web/API/Popover_API)
