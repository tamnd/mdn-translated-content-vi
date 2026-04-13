---
title: "Element: thuộc tính ariaActiveDescendantElement"
short-title: ariaActiveDescendantElement
slug: Web/API/Element/ariaActiveDescendantElement
page-type: web-api-instance-property
browser-compat: api.Element.ariaActiveDescendantElement
---

{{APIRef("DOM")}}

Thuộc tính **`ariaActiveDescendantElement`** của giao diện {{domxref("Element")}} đại diện cho phần tử đang hoạt động hiện tại khi tiêu điểm nằm trên widget [`composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role), [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role), [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role), [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role), hoặc [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role).

Chủ đề [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant) chứa thêm thông tin về cách sử dụng thuộc tính và property này.

## Giá trị

Một lớp con của {{domxref("HTMLElement")}} đại diện cho phần tử con đang hoạt động, hoặc `null` nếu không có phần tử con đang hoạt động.

## Mô tả

Property này là một giải pháp thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant). Không giống như `aria-activedescendant`, phần tử được gán cho property này không cần có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Property này phản chiếu thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage) của phần tử khi nó được định nghĩa, nhưng chỉ cho các giá trị `id` tham chiếu khớp với các phần tử hợp lệ trong phạm vi. Nếu property được thiết lập, thì thuộc tính tương ứng sẽ bị xóa. Để biết thêm thông tin về tham chiếu phần tử được phản chiếu và phạm vi, xem [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính phản chiếu_.

## Ví dụ

### Lấy phần tử đang hoạt động

Ví dụ này cho thấy cách `ariaActiveDescendantElement` có thể được sử dụng để lấy phần tử đang hoạt động hiện tại.

#### HTML

HTML định nghĩa một listbox để chọn các loại đường khác nhau, bao gồm một phần tử {{htmlelement("div")}} với [vai trò `listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role) và các `<div>` lồng nhau cho từng tùy chọn. Phần tử đang hoạt động ban đầu được đặt thành phần tử có `id` là `avenue` bằng cách sử dụng `aria-activedescendant`.

```html
<div id="streetType" role="listbox" aria-activedescendant="avenue">
  <div>Street</div>
  <div id="avenue">Avenue</div>
  <div>Lane</div>
</div>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 70px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

Đoạn mã dưới đây trước tiên kiểm tra xem `ariaActiveDescendantElement` có được hỗ trợ không. Nếu property được hỗ trợ, đoạn mã sẽ ghi lại giá trị của `aria-activedescendant` (`id` của phần tử được tham chiếu) bằng cách sử dụng {{domxref("Element.getAttribute()")}}, phần tử property và nội dung văn bản của phần tử.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
// Feature test for ariaActiveDescendantElement
if ("ariaActiveDescendantElement" in Element.prototype) {
  log(`getAttribute(): ${streetType.getAttribute("aria-activedescendant")}`);
  log(`ariaActiveDescendantElement: ${streetType.ariaActiveDescendantElement}`);
  log(`text: ${streetType.ariaActiveDescendantElement?.textContent.trim()}`);
} else {
  log("ariaActiveDescendantElement not supported by browser");
}
```

#### Kết quả

Nhật ký dưới đây cho thấy kết quả của đoạn mã trên. Giá trị trả về từ thuộc tính `aria-activedescendant` phải là `"avenue"`, phần tử liên quan phải là một phần tử `HTMLDivElement`, và văn bản trong phần tử đó phải là `Avenue`.

{{EmbedLiveSample("Get the active descendant","100%","190px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
- {{domxref("ElementInternals.ariaActiveDescendantElement")}}
- [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản chiếu thuộc tính_.
