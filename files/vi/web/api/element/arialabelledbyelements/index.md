---
title: "Element: thuộc tính ariaLabelledByElements"
short-title: ariaLabelledByElements
slug: Web/API/Element/ariaLabelledByElements
page-type: web-api-instance-property
browser-compat: api.Element.ariaLabelledByElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaLabelledByElements`** của giao diện {{domxref("Element")}} là một mảng chứa (các) phần tử cung cấp tên dễ tiếp cận cho phần tử mà nó được áp dụng.

Property này chủ yếu được sử dụng để cung cấp nhãn cho các phần tử không có phương pháp tiêu chuẩn để định nghĩa tên dễ tiếp cận của chúng. Ví dụ, property này có thể được sử dụng để đặt tên cho một phần tử vùng chứa chung, chẳng hạn như {{htmlelement("div")}} hoặc {{htmlelement("span")}}, hoặc một nhóm các phần tử, chẳng hạn như một hình ảnh với thanh trượt có thể được sử dụng để thay đổi độ mờ của nó. Property này được ưu tiên hơn các cơ chế khác để cung cấp tên dễ tiếp cận cho các phần tử, và do đó cũng có thể được sử dụng để cung cấp tên cho các phần tử thường lấy tên từ nội dung bên trong hoặc từ một phần tử liên kết như nhãn.

Chủ đề [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) chứa thêm thông tin về cách sử dụng thuộc tính và property này.

## Giá trị

Một mảng các phần tử. Văn bản bên trong của các phần tử này có thể được nối với nhau bằng dấu cách để lấy tên dễ tiếp cận.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc. Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo đối với mảng không ảnh hưởng đến giá trị của property.

## Mô tả

Property này là một giải pháp thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) để thiết lập tên dễ tiếp cận. Không giống như `aria-labelledby`, các phần tử được gán cho property này không cần có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Property này phản chiếu thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) của phần tử khi nó được định nghĩa, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi. Nếu property được thiết lập, thì thuộc tính tương ứng sẽ bị xóa. Để biết thêm thông tin về tham chiếu phần tử được phản chiếu và phạm vi, xem [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính phản chiếu_.

## Ví dụ

### Lấy tên dễ tiếp cận

Ví dụ này cho thấy cách `ariaLabelledByElements` có thể được sử dụng để lấy nhãn ARIA được định nghĩa bằng cách sử dụng `aria-labelledby`.

#### HTML

HTML định nghĩa hai phần tử {{htmlelement("span")}} và tham chiếu id của chúng trong thuộc tính `aria-labelledby` của một {{htmlelement("input")}}. Tên dễ tiếp cận của `<input>` là sự nối liền của văn bản bên trong của hai phần tử được tham chiếu, phân tách bằng dấu cách.

```html
<span id="label_1">Street name</span>
<input aria-labelledby="label_1 label_2" />
<span id="label_2">(just the name, no "Street" or "Road" or "Place")</span>
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

Đoạn mã dưới đây trước tiên ghi lại giá trị của thuộc tính `aria-labelledby` từ {{domxref("Element.getAttribute()")}} (một chuỗi liệt kê các giá trị `id` của các phần tử được tham chiếu). Sau đó kiểm tra xem `ariaLabelledByElements` có được hỗ trợ không, và nếu có, ghi lại giá trị của nó. Cuối cùng trả về chuỗi dễ tiếp cận, được tính bằng cách lặp qua các phần tử và nối văn bản bên trong của chúng.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const inputElement = document.querySelector("input");
log(`aria-labelledby: ${inputElement.getAttribute("aria-labelledby")}`);
// Feature test for ariaLabelledByElements
if ("ariaLabelledByElements" in Element.prototype) {
  // Get ariaLabelledByElements
  const labelElements = inputElement.ariaLabelledByElements;
  log(`ariaLabelledByElements: ${labelElements}`);

  // Log inner text of elements to get accessible name
  const text = labelElements.map((e) => e.textContent.trim()).join(" ");
  log(`Accessible name: ${text.trim()}`);
} else {
  log("element.ariaLabelledByElements: not supported by browser");
}
```

#### Kết quả

Nhật ký dưới đây cho thấy các tham chiếu phần tử ban đầu, các phần tử liên kết/được trả về và tên dễ tiếp cận. Lưu ý rằng ví dụ không làm gì với văn bản được nhập vào `<input>` tên đường phố.

{{EmbedLiveSample("Get the accessible name","100%","150px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
- {{domxref("ElementInternals.ariaLabelledByElements")}}
- [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản chiếu thuộc tính_.
