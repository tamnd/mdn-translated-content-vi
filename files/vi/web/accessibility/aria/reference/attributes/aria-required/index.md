---
title: "ARIA: thuộc tính aria-required"
short-title: aria-required
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-required
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-required
sidebar: accessibilitysidebar
---

Thuộc tính `aria-required` cho biết rằng người dùng phải nhập dữ liệu vào phần tử đó trước khi có thể gửi biểu mẫu.

## Mô tả

Khi một {{htmlelement("input")}}, {{htmlelement("select")}} hoặc {{htmlelement("textarea")}} HTML ngữ nghĩa phải có giá trị, nó nên được gán thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required). Thuộc tính HTML `required` sẽ ngăn gửi biểu mẫu trừ khi các form control bắt buộc có giá trị hợp lệ, đồng thời bảo đảm những người điều hướng bằng công nghệ hỗ trợ hiểu được form control ngữ nghĩa nào cần có nội dung hợp lệ.

Khi form control được tạo bằng các phần tử không ngữ nghĩa, chẳng hạn một {{HTMLElement('div')}} có [role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) là [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role), thì nên thêm thuộc tính `aria-required` với giá trị `true` để báo cho công nghệ hỗ trợ biết rằng người dùng phải nhập dữ liệu vào phần tử đó thì biểu mẫu mới có thể được gửi. Thuộc tính `aria-required` có thể dùng với các phần tử form HTML; nó không chỉ giới hạn cho các phần tử đã được gán vai trò ARIA.

Tương tự như thuộc tính HTML `required` được đặt trên các form control HTML ngữ nghĩa, thuộc tính `aria-required` truyền đạt rõ ràng cho công nghệ hỗ trợ rằng phần tử này là bắt buộc trước khi biểu mẫu có thể được gửi. Thuộc tính `required` trên một form control HTML ngữ nghĩa sẽ ngăn form control đó được gửi nếu không có giá trị, đồng thời cung cấp thông báo lỗi gốc trong một số trình duyệt nếu giá trị bắt buộc không hợp lệ khi người dùng cố gửi biểu mẫu. Thuộc tính `aria-required`, giống như mọi trạng thái và thuộc tính ARIA khác, không ảnh hưởng đến chức năng của phần tử. Chức năng và hành vi phải được thêm bằng JavaScript.

> [!NOTE]
> ARIA chỉ sửa đổi cây trợ năng, tức là chỉ thay đổi cách công nghệ hỗ trợ trình bày nội dung cho người dùng. ARIA không thay đổi bất kỳ chức năng hay hành vi nào của phần tử. Khi không dùng phần tử HTML ngữ nghĩa cho đúng mục đích và chức năng mặc định của chúng, bạn phải dùng JavaScript để quản lý hành vi, focus và các trạng thái ARIA.

Các pseudoclass CSS {{CSSXRef(':required')}} và {{CSSXRef(':optional')}} khớp với các phần tử {{htmlelement("input")}}, {{htmlelement("select")}} và {{htmlelement("textarea")}} dựa trên việc chúng là bắt buộc hay tùy chọn. Khi dùng các phần tử không ngữ nghĩa làm form control, bạn sẽ không có lợi thế từ bộ chọn pseudoclass CSS này. Tuy nhiên, bạn có thể dùng bộ chọn thuộc tính nếu thuộc tính có mặt: `[aria-required="true"]` hoặc `[aria-required="false"]`.

Nếu một biểu mẫu chứa cả các phần tử bắt buộc và tùy chọn, các phần tử bắt buộc nên được thể hiện bằng một cách trực quan không chỉ dựa vào màu sắc để truyền đạt ý nghĩa. Thông thường, văn bản mô tả và/hoặc biểu tượng được dùng.

> [!NOTE]
> Người dùng ở mọi nhóm đều phải nhận biết được phần tử nào là bắt buộc. Hãy bảo đảm cách trình bày trực quan cho biết form control là bắt buộc theo cách nhất quán, dễ thấy, và nhớ rằng màu sắc là chưa đủ để truyền đạt thông tin.

## Ví dụ

Thuộc tính này nên được thêm vào vai trò form-control. Nếu người dùng cần điền vào một [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role) địa chỉ email, hãy thêm `aria-required="true"` vào textbox.

```html
<div id="tbLabel">Email Address *</div>
<div
  role="textbox"
  contenteditable
  aria-labelledby="tblabel"
  aria-required="true"
  id="email1"></div>
```

> [!NOTE]
> Nếu nhãn của trường đã chứa từ "required", thì khuyến nghị bỏ thuộc tính `aria-required`. Điều này giúp tránh việc bộ đọc màn hình đọc từ "required" hai lần.

Trong ví dụ này, JavaScript phải được dùng để ngăn biểu mẫu chứa nó bị gửi nếu textbox không có nội dung.

Việc này có thể được viết theo cách ngữ nghĩa, không cần JavaScript:

```html
<label for="email1">Email Address (required)</label>
<input type="email" id="email1" required />
```

## Giá trị

- `true`
  - : Phần tử cần có giá trị hoặc phải được chọn thì biểu mẫu mới có thể gửi.
- `false`
  - : Phần tử không bắt buộc.

## Giao diện liên quan

- {{domxref("Element.ariaRequired")}}
  - : Thuộc tính [`ariaRequired`](/en-US/docs/Web/API/Element/ariaRequired), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-required`.
- {{domxref("ElementInternals.ariaRequired")}}
  - : Thuộc tính [`ariaRequired`](/en-US/docs/Web/API/ElementInternals/ariaRequired), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-required`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
- [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
- [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)
- [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
- [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role)

Kế thừa vào các vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
- [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)
- [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Thuộc tính HTML [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required)
- [`:optional` pseudoclass](/en-US/docs/Web/CSS/Reference/Selectors/:optional)
- [`:required` pseudoclass](/en-US/docs/Web/CSS/Reference/Selectors/:required)
- [`aria-invalid` attribute](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid)
- [MDN Understanding WCAG, giải thích Hướng dẫn 3.3](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable#guideline_3.3_%e2%80%94_input_assistance_help_users_avoid_and_correct_mistakes)
- [Understanding Success Criterion 3.3.2 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/minimize-error-cues.html)
