---
title: "ARIA: thuộc tính aria-checked"
short-title: aria-checked
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-checked
page-type: aria-attribute
spec-urls:
  - https://w3c.github.io/aria/#aria-checked
  - https://www.w3.org/WAI/ARIA/apg/patterns/checkbox/examples/checkbox/
sidebar: accessibilitysidebar
---

Thuộc tính `aria-checked` chỉ ra trạng thái "đã chọn" hiện tại của hộp kiểm, nút chọn và các widget khác.

> [!NOTE]
> Khi có thể, hãy dùng phần tử HTML {{htmlelement("input")}} với `type="checkbox"` và `type="radio"` vì chúng đã có ngữ nghĩa sẵn và không cần thuộc tính ARIA.

## Mô tả

Thuộc tính `aria-checked` cho biết phần tử đang được chọn (`true`), chưa được chọn (`false`), hoặc trạng thái được chọn là không xác định (`mixed`), nghĩa là nó không phải đã chọn cũng không phải chưa chọn. Giá trị `mixed` được hỗ trợ bởi các vai trò đầu vào ba trạng thái của [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role) và [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role).

Giá trị `mixed` không được hỗ trợ trên [`radio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role), [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role), hoặc [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role) và các phần tử kế thừa từ chúng. Giá trị sẽ là false nếu `mixed` được đặt khi không được hỗ trợ.

```html
<span
  role="checkbox"
  id="checkBoxInput"
  aria-checked="false"
  tabindex="0"
  aria-labelledby="chk15-label"></span>
<label id="chk15-label">Đăng ký nhận bản tin</label>
```

Thuộc tính `tabindex` là bắt buộc để cho phép nhận tiêu điểm. JavaScript là bắt buộc để chuyển đổi trạng thái `aria-checked`. Và nếu checkbox này là một phần của biểu mẫu có thể gửi, cần thêm JavaScript để đặt tên và giá trị.

Đoạn trên có thể được viết lại thành:

```html
<input type="checkbox" id="chk15-label" name="Subscribe" />
<label for="chk15-label">Đăng ký nhận bản tin</label>
```

Bằng cách dùng phần tử {{htmlelement("input")}} với `type="checkbox"` thay vì ARIA, bạn không cần JavaScript nào.

## Giá trị

- false
  - : Phần tử hỗ trợ được chọn nhưng hiện chưa được chọn.
- true
  - : Phần tử đã được chọn.
- mixed
  - : Chỉ dành cho [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role) và [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role), tương đương với `indeterminate`, biểu thị giá trị hỗn hợp, không phải đã chọn cũng không phải chưa chọn.
- undefined (mặc định)
  - : Phần tử không hỗ trợ được chọn.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
- [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role)
- [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
- [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
- [`radio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role)
- [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role)

## Giao diện liên quan

- {{domxref("Element.ariaChecked")}}
  - : Thuộc tính [`ariaChecked`](/en-US/docs/Web/API/Element/ariaChecked), là một phần của giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-checked`.
- {{domxref("ElementInternals.ariaChecked")}}
  - : Thuộc tính [`ariaChecked`](/en-US/docs/Web/API/ElementInternals/ariaChecked), là một phần của giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-checked`.

```js
myHTMLElement.ariaChecked = true;
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)
- [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio)
- [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed)
- [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)
- [Ví dụ checkbox hai trạng thái](https://www.w3.org/WAI/ARIA/apg/example-index/checkbox/checkbox.html) - w3.org
- [Ví dụ checkbox ba trạng thái](https://www.w3.org/WAI/ARIA/apg/example-index/checkbox/checkbox-mixed.html) - w3.org
