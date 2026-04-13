---
title: "ElementInternals: ariaInvalid property"
short-title: ariaInvalid
slug: Web/API/ElementInternals/ariaInvalid
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaInvalid
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaInvalid`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-invalid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid). Liên quan đến các vai trò [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role), [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role), [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role), [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role), [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role), [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role), [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role), [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role) và [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role), nó thông báo cho API truy cập liệu giá trị đã nhập có phù hợp với định dạng mà ứng dụng mong đợi hay không.

> [!NOTE]
> Việc đặt thuộc tính ARIA trên `ElementInternals` cho phép xác định ngữ nghĩa mặc định trên một phần tử tùy chỉnh. Chúng có thể bị ghi đè bởi các thuộc tính do tác giả định nghĩa, nhưng đảm bảo rằng ngữ nghĩa mặc định được duy trì trong trường hợp tác giả xóa các thuộc tính đó, hoặc không thêm chúng vào. Để biết thêm thông tin, xem [giải thích về Mô hình Đối tượng Truy cập](https://wicg.github.io/aom/explainer.html#default-semantics-for-custom-elements-via-the-elementinternals-object).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử không hợp lệ.
- `"false"` (mặc định)
  - : Phần tử không ở trạng thái không hợp lệ.
- `"grammar"`
  - : Phần tử ở trạng thái không hợp lệ do phát hiện lỗi ngữ pháp.
- `"spelling"`
  - : Phần tử ở trạng thái không hợp lệ do phát hiện lỗi chính tả.

## Ví dụ

Trong ví dụ này, chúng ta định nghĩa và tạo một phần tử `<custom-text>`, sau đó lấy giá trị của `ariaInvalid` từ phần tử `<custom-text>` đầu tiên trong tài liệu.

```js
class CustomControl extends HTMLElement {
  constructor() {
    super();
    this._internals = this.attachInternals();
    this._internals.ariaInvalid = "false";
  }
  // …
}

window.customElements.define("custom-text", CustomControl);

const element = document.querySelector("custom-text");
console.log(element._internals.ariaInvalid);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ElementInternals.ariaRequired")}}
- [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required)
- [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)
