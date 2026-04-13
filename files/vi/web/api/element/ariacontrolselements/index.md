---
title: "Element: thuộc tính ariaControlsElements"
short-title: ariaControlsElements
slug: Web/API/Element/ariaControlsElements
page-type: web-api-instance-property
browser-compat: api.Element.ariaControlsElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaControlsElements`** của giao diện {{domxref("Element")}} là một mảng chứa các phần tử được điều khiển bởi phần tử mà nó được áp dụng. Ví dụ, thuộc tính này có thể được đặt trên một [combobox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role) để chỉ ra phần tử mà nó hiển thị lên, hoặc trên một [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role) để chỉ ra ID của phần tử mà nó điều khiển.

Chủ đề [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) chứa thêm thông tin về cách sử dụng thuộc tính và property này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}, đại diện cho các phần tử được điều khiển bởi phần tử này.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc. Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo đối với mảng không ảnh hưởng đến giá trị của property.

## Mô tả

Property này là một giải pháp thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) để thiết lập các phần tử được điều khiển. Không giống như `aria-controls`, các phần tử được gán cho property này không cần có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Property này phản chiếu thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) khi nó được định nghĩa, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi. Nếu property được thiết lập, thì thuộc tính tương ứng sẽ bị xóa. Để biết thêm thông tin về tham chiếu phần tử được phản chiếu và phạm vi, xem [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính phản chiếu_.

## Ví dụ

### Lấy các phần tử được điều khiển

Ví dụ này cho thấy cách `ariaControlsElements` có thể được sử dụng để lấy các phần tử được điều khiển đã được thiết lập bằng cách sử dụng `aria-controls`.

#### HTML

HTML đầu tiên định nghĩa một phần tử {{htmlelement("button")}} và hai phần tử {{htmlelement("div")}}, `panel1` và `panel2`, mà nó điều khiển. Các tham chiếu đến các panel được điều khiển được liệt kê trong thuộc tính `aria-controls` của nút bấm.

```html
<button id="toggleButton" aria-controls="panel1 panel2" aria-expanded="false">
  Show Details
</button>

<div class="panel" id="panel1" aria-hidden="true">
  <p>Panel1 opened/closed by button.</p>
</div>

<div class="panel" id="panel2" aria-hidden="true">
  <p>Panel2 opened/closed by button.</p>
</div>
```

```css
.panel {
  display: none; /* Initially hidden */
  border: 1px solid #cccccc;
  padding: 5px;
  margin-top: 5px;
}
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

Đoạn mã đầu tiên thiết lập các panel để được bật/tắt ẩn hoặc hiện dựa trên thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) của nút bấm.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const toggleButton = document.querySelector("#toggleButton");
const panel1 = document.querySelector("#panel1");
const panel2 = document.querySelector("#panel2");

toggleButton.addEventListener("click", () => {
  const isExpanded = toggleButton.getAttribute("aria-expanded") === "true";

  toggleButton.setAttribute("aria-expanded", !isExpanded);
  panel1.style.display = isExpanded ? "none" : "block";
  panel1.setAttribute("aria-hidden", isExpanded); // true when hidden, false when shown.

  panel2.style.display = isExpanded ? "none" : "block";
  panel2.setAttribute("aria-hidden", isExpanded); // true when hidden, false when shown.
});
```

Tiếp theo, ví dụ lấy giá trị của thuộc tính `aria-controls` với {{domxref("Element.getAttribute()")}} (một chuỗi liệt kê các giá trị `id` của các phần tử được tham chiếu). Sau đó kiểm tra xem property `ariaControlsElements` có được hỗ trợ không, và nếu có, ghi lại giá trị của nó. Cuối cùng trả về và ghi lại văn bản bên trong cho mỗi phần tử được điều khiển.

```js
log(`aria-controls: ${toggleButton.getAttribute("aria-controls")}`);
// Feature test for ariaControlsElements
if ("ariaControlsElements" in Element.prototype) {
  // Get ariaControlsElements
  const controlledElements = toggleButton.ariaControlsElements;
  log(`ariaControlsElements: ${controlledElements}`);

  // List innerText for each of the ariaControlsElements
  controlledElements.forEach((controlled) => {
    log(` Controlled element text: ${controlled.textContent.trim()}`);
  });
} else {
  log("element.ariaControlsElements: not supported by browser");
}
```

#### Kết quả

Nhấp vào nút bấm bên dưới để hiển thị và ẩn các panel. Nhật ký cho thấy các tham chiếu phần tử ban đầu, các phần tử liên kết/được trả về và văn bản bên trong của mỗi phần tử.

{{EmbedLiveSample("Get the controlled elements","100%","280px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls)
- {{domxref("ElementInternals.ariaControlsElements")}}
- [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản chiếu thuộc tính_
