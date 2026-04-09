---
title: "ARIA: thuộc tính aria-pressed"
short-title: aria-pressed
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-pressed
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-pressed
sidebar: accessibilitysidebar
---

Thuộc tính `aria-pressed` cho biết trạng thái "được nhấn" hiện tại của một nút bật tắt.

## Mô tả

Thêm `aria-pressed` vào một phần tử có vai trò [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role) sẽ biến nút đó thành một toggle button. Thuộc tính `aria-pressed` chỉ có ý nghĩa với các nút bật tắt. Nó biểu thị trạng thái "được nhấn" hiện tại của nút.

Giá trị là "tri-state", nghĩa là nó có thể được đặt thành `true`, `false`, `mixed` hoặc `undefined`. Với `aria-pressed`, giống như hầu hết các kiểu giá trị ba trạng thái khác, giá trị mặc định là `undefined`.

Nút bật tắt cần một chu kỳ nhấn và thả hoàn chỉnh để thay đổi giá trị của nó. Nhấn và thả một lần sẽ đổi giá trị thành `true`. Nếu nhấn và thả lại lần nữa, giá trị sẽ đổi trở lại `false`.

Giá trị `mixed` nghĩa là giá trị của nhiều mục được nút điều khiển không còn giống nhau.

Đừng thay đổi nội dung của nhãn trên nút bật tắt khi trạng thái thay đổi. Nếu nhãn nút là "pause", đừng đổi nó thành "play" khi được nhấn. Trong ví dụ này, khi trạng thái được nhấn là true, nhãn vẫn là "Pause" để bộ đọc màn hình có thể đọc kiểu như "Pause toggle button pressed".

```html
<button aria-pressed="false">Pause</button>
```

Nếu bạn muốn nhãn thay đổi giữa "Paused" và "Play", đừng dùng `aria-pressed`.

Quy tắc đầu tiên khi dùng ARIA là: "nếu bạn có thể dùng một tính năng gốc đã có sẵn ngữ nghĩa và hành vi mà bạn cần, thay vì tái sử dụng một phần tử rồi thêm vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có trợ năng, thì hãy làm như vậy." Nếu chúng ta dùng ngữ nghĩa HTML gốc với {{HTMLElement('button')}}, chúng ta có thể thay đổi nhãn thay vì thay đổi trạng thái pressed, nên không cần thuộc tính `aria-pressed`.

## Giá trị

- `false`
  - : Nút hỗ trợ trạng thái được nhấn nhưng hiện chưa được nhấn.
- `mixed`
  - : Cho biết một giá trị chế độ hỗn hợp cho nút bật tắt ba trạng thái.
- `true`
  - : Nút đang được nhấn.
- `undefined` (mặc định)
  - : Phần tử không hỗ trợ trạng thái được nhấn.

## Giao diện liên quan

- {{domxref("Element.ariaPressed")}}
  - : Thuộc tính [`ariaPressed`](/en-US/docs/Web/API/Element/ariaPressed), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-pressed`.
- {{domxref("ElementInternals.ariaPressed")}}
  - : Thuộc tính [`ariaPressed`](/en-US/docs/Web/API/ElementInternals/ariaPressed), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-pressed`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`<input type="button">`](/en-US/docs/Web/HTML/Reference/Elements/input/button)
- [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit)
- {{HTMLElement('button')}}
- [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked)
- [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)
