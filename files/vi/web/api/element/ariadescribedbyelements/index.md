---
title: "Element: thuộc tính ariaDescribedByElements"
short-title: ariaDescribedByElements
slug: Web/API/Element/ariaDescribedByElements
page-type: web-api-instance-property
browser-compat: api.Element.ariaDescribedByElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaDescribedByElements`** của giao diện {{domxref("Element")}} là một mảng chứa (các) phần tử cung cấp mô tả dễ tiếp cận cho phần tử mà nó được áp dụng. Mô tả dễ tiếp cận tương tự như nhãn dễ tiếp cận (xem {{domxref("Element/ariaLabelledByElements","ariaLabelledByElements")}}), nhưng cung cấp thông tin chi tiết hơn.

Chủ đề [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) chứa thêm thông tin về cách sử dụng thuộc tính và property này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}. Văn bản bên trong của các phần tử này có thể được nối với nhau bằng dấu cách để lấy mô tả dễ tiếp cận.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc. Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo đối với mảng không ảnh hưởng đến giá trị của property.

## Mô tả

Property này là một giải pháp thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) để thiết lập mô tả dễ tiếp cận. Không giống như `aria-describedby`, các phần tử được gán cho property này không cần có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Property này phản chiếu thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) của phần tử khi nó được định nghĩa, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi. Nếu property được thiết lập, thì thuộc tính tương ứng sẽ bị xóa. Để biết thêm thông tin về tham chiếu phần tử được phản chiếu và phạm vi, xem [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính phản chiếu_.

## Ví dụ

### Lấy mô tả dễ tiếp cận

Ví dụ này cho thấy cách `ariaDescribedByElements` có thể được sử dụng để lấy mô tả dễ tiếp cận được định nghĩa bằng cách sử dụng `aria-describedby`.

#### HTML

HTML định nghĩa hai phần tử {{htmlelement("span")}} và tham chiếu id của chúng trong thuộc tính `aria-describedby` của một {{htmlelement("button")}}.

```html
<button aria-describedby="trash-desc1 trash-desc2">Move to trash</button>
…
<span id="trash-desc1">Trash will be permanently removed after 30 days.</span>
<span id="trash-desc2">Or Else!</span>
```

```html hidden
<pre id="log"></pre>
```

#### CSS

Ở đây chúng ta sẽ ẩn các phần tử `<span>` chứa văn bản dễ tiếp cận.

```css
span {
  display: none;
}
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

Đoạn mã dưới đây trước tiên ghi lại giá trị của thuộc tính `aria-describedby` từ {{domxref("Element.getAttribute()")}} (một chuỗi liệt kê các giá trị `id` của các phần tử được tham chiếu). Sau đó kiểm tra xem `ariaDescribedByElements` có được hỗ trợ không, và nếu có, ghi lại giá trị của nó. Cuối cùng trả về chuỗi dễ tiếp cận, được tính bằng cách lặp qua các phần tử được trả về và nối văn bản bên trong của chúng.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const buttonElement = document.querySelector("button");
log(`aria-describedby: ${buttonElement.getAttribute("aria-describedby")}`);
// Feature test for ariaDescribedByElements
if ("ariaDescribedByElements" in Element.prototype) {
  // Get ariaDescribedByElements
  const buttonElements = buttonElement.ariaDescribedByElements;
  log(`ariaDescribedByElements: ${buttonElements}`);

  // Accessible description from the elements
  const text = buttonElements.map((e) => e.textContent.trim()).join(" ");
  log(`Accessible description: ${text.trim()}`);
} else {
  log("element.ariaDescribedByElements: not supported by browser");
}
```

#### Kết quả

Nhật ký dưới đây cho thấy các tham chiếu phần tử ban đầu, các phần tử liên kết/được trả về và mô tả dễ tiếp cận.

{{EmbedLiveSample("Get the accessible description","100%","150px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
- {{domxref("ElementInternals.ariaDescribedByElements")}}
- [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản chiếu thuộc tính_
