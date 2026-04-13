---
title: "Element: thuộc tính ariaDetailsElements"
short-title: ariaDetailsElements
slug: Web/API/Element/ariaDetailsElements
page-type: web-api-instance-property
browser-compat: api.Element.ariaDetailsElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaDetailsElements`** của giao diện {{domxref("Element")}} là một mảng chứa (các) phần tử cung cấp chi tiết dễ tiếp cận cho phần tử mà nó được áp dụng. Chi tiết dễ tiếp cận tương tự như mô tả dễ tiếp cận (xem {{domxref("Element/ariaDescribedByElements","ariaDescribedByElements")}}), nhưng cung cấp thông tin chi tiết hơn.

Chủ đề [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) chứa thêm thông tin về cách sử dụng thuộc tính và property này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}. Văn bản bên trong của các phần tử này có thể được nối với nhau bằng dấu cách để lấy chi tiết dễ tiếp cận.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc. Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo đối với mảng không ảnh hưởng đến giá trị của property.

## Mô tả

Property này là một giải pháp thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) để thiết lập thông tin chi tiết dễ tiếp cận. Không giống như `aria-details`, các phần tử được gán cho property này không cần có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Property này phản chiếu thuộc tính [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) của phần tử khi nó được định nghĩa, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi. Nếu property được thiết lập, thì thuộc tính tương ứng sẽ bị xóa. Để biết thêm thông tin về tham chiếu phần tử được phản chiếu và phạm vi, xem [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính phản chiếu_.

## Ví dụ

### Lấy chi tiết dễ tiếp cận

Ví dụ này cho thấy cách `ariaDetailsElements` có thể được sử dụng để lấy thông tin được định nghĩa bằng thuộc tính `aria-details` trong HTML.

#### HTML

HTML định nghĩa hai phần tử {{htmlelement("span")}} và tham chiếu id của chúng trong thuộc tính `aria-details` của một {{htmlelement("button")}}.

```html
<button aria-details="details1 details2">Button text</button>
…
<span id="details1">Details 1 information about the element.</span>
<span id="details2">Details 2 information about the element.</span>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 70px;
  overflow-x: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

Đoạn mã dưới đây trước tiên ghi lại giá trị của thuộc tính `aria-details` từ {{domxref("Element.getAttribute()")}} (một chuỗi liệt kê các giá trị `id` của các phần tử được tham chiếu). Sau đó kiểm tra xem `ariaDetailsElements` có được hỗ trợ không, và nếu có, ghi lại giá trị của nó. Cuối cùng trả về chuỗi dễ tiếp cận, được tính bằng cách lặp qua các phần tử được trả về và nối văn bản bên trong của chúng.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const buttonElement = document.querySelector("button");
log(`aria-details: ${buttonElement.getAttribute("aria-details")}`);
// Feature test for ariaDetailsElements
if ("ariaDetailsElements" in Element.prototype) {
  // Get ariaDetailsElements
  const buttonElements = buttonElement.ariaDetailsElements;
  log(`ariaDetailsElements: ${buttonElements}`);

  // Accessible details from ariaDetailsElements
  const text = buttonElements.map((e) => e.textContent.trim()).join(" ");
  log(`Accessible details: ${text.trim()}`);
} else {
  log("element.ariaDetailsElements: not supported by browser");
}
```

#### Kết quả

Nhật ký dưới đây cho thấy các tham chiếu phần tử ban đầu, các phần tử liên kết/được trả về và chi tiết dễ tiếp cận.

{{EmbedLiveSample("Get the accessible details","100%","150px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details)
- {{domxref("ElementInternals.ariaDetailsElements")}}
- [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản chiếu thuộc tính_.
