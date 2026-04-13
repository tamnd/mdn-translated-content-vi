---
title: "Element: thuộc tính ariaInvalid"
short-title: ariaInvalid
slug: Web/API/Element/ariaInvalid
page-type: web-api-instance-property
browser-compat: api.Element.ariaInvalid
---

{{APIRef("DOM")}}

Thuộc tính **`ariaInvalid`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-invalid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid). Liên quan đến các vai trò [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role), [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role), [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role), [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role), [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role), [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role), [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role), [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role), và [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role), nó cho biết API hỗ trợ tiếp cận liệu giá trị đã nhập có không phù hợp với định dạng mà ứng dụng mong đợi hay không.

Nếu thuộc tính không có mặt, hoặc được đặt thành chuỗi rỗng, công nghệ hỗ trợ sẽ xử lý giá trị như thể nó được đặt thành `false`. Nếu thuộc tính có mặt nhưng được đặt thành giá trị khác `false`, `grammar`, `spelling` hoặc chuỗi rỗng (`""`), công nghệ hỗ trợ xử lý giá trị như `true`. Property phản chiếu giá trị thuộc tính đã được thiết lập, không phải cách xử lý bởi công nghệ hỗ trợ.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử không hợp lệ.
- `"false"` (mặc định)
  - : Phần tử không ở trạng thái không hợp lệ.
- `"grammar"`
  - : Phần tử ở trạng thái không hợp lệ vì lỗi ngữ pháp được phát hiện.
- `"spelling"`
  - : Phần tử ở trạng thái không hợp lệ vì lỗi chính tả được phát hiện.

## Ví dụ

Trong ví dụ này, thuộc tính [`aria-invalid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid) trên phần tử có ID `quote` bị bỏ qua, trả về `null` và được xử lý như `false`. Sử dụng `ariaInvalid` chúng ta cập nhật giá trị thành `grammar` (vì có hai lỗi).

```html
<div id="quote" role="textbox" contenteditable>you are your best thing..</div>
```

```html hidden
<hr />
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const el = document.getElementById("quote");
log(`Initial value: ${el.ariaInvalid}`);
el.ariaInvalid = "grammar";
log(`Updated value: ${el.ariaInvalid}`);
```

{{EmbedLiveSample("Examples", "", "100")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.ariaRequired")}}
- [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required)
- [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)
- {{domxref("Element.ariaErrorMessageElements")}}
