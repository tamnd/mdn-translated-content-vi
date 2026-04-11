---
title: "ElementInternals: ariaLabelledByElements property"
short-title: ariaLabelledByElements
slug: Web/API/ElementInternals/ariaLabelledByElements
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaLabelledByElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaLabelledByElements`** của giao diện {{domxref("ElementInternals")}} là một mảng chứa phần tử (hoặc các phần tử) cung cấp tên truy cập cho phần tử được áp dụng.

Thuộc tính này chủ yếu dùng để cung cấp nhãn cho các phần tử không có phương pháp tiêu chuẩn để xác định tên truy cập của chúng.
Ví dụ, thuộc tính này có thể được sử dụng để đặt tên cho phần tử vùng chứa thông thường, chẳng hạn như {{htmlelement("div")}} hoặc {{htmlelement("span")}}, hoặc một nhóm phần tử như hình ảnh có thanh trượt có thể được sử dụng để thay đổi độ mờ của nó.
Thuộc tính này được ưu tiên hơn các cơ chế khác để cung cấp tên truy cập cho các phần tử, và do đó cũng có thể được sử dụng để đặt tên cho các phần tử thường lấy tên từ nội dung bên trong hoặc từ phần tử liên quan như nhãn.

Chủ đề [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) chứa thông tin bổ sung về cách sử dụng thuộc tính và thuộc tính này.

## Giá trị

Một mảng các phần tử.
Văn bản bên trong của các phần tử này có thể được nối với dấu cách để lấy tên truy cập.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc.
Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo cho mảng không ảnh hưởng đến giá trị của thuộc tính.

## Mô tả

Thuộc tính là một thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) để đặt tên truy cập.
Không giống như `aria-labelledby`, các phần tử được gán cho thuộc tính này không nhất thiết phải có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Thuộc tính phản ánh thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) của phần tử khi được xác định, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi.
Nếu thuộc tính được đặt, thuộc tính tương ứng sẽ bị xóa.
Để biết thêm thông tin về tham chiếu phần tử được phản ánh và phạm vi, xem [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính được phản ánh_.

## Ví dụ

### Lấy tên truy cập

Ví dụ này cho thấy cách `ariaLabelledByElements` có thể được sử dụng để lấy nhãn được xác định bằng `aria-labelledby` trong shadow root theo cách lập trình.

#### HTML

HTML định nghĩa hai phần tử {{htmlelement("span")}} và tham chiếu các id của chúng trong thuộc tính `aria-labelledby` của một {{htmlelement("input")}}.
Tên truy cập của `<input>` do đó là sự nối của văn bản bên trong của hai phần tử được tham chiếu.

```html
<div id="host">
  <template shadowrootmode="open">
    <span id="label_1">Street name</span>
    <input aria-labelledby="label_1 label_2" />
    <span id="label_2">(just the name, no "Street" or "Road" or "Place")</span>
  </template>
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

Mã bên dưới trước tiên kiểm tra xem `ariaLabelledByElements` có được hỗ trợ hay không và nếu không, ghi kết quả và thoát.
Nếu thuộc tính được hỗ trợ, trước tiên nó ghi giá trị của thuộc tính.
Sau đó nó lặp qua các phần tử được trả về, nối văn bản bên trong của chúng, và ghi tên truy cập kết quả của phần tử.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
// Get access to the input within shadowRoot
const hostElement = document.getElementById("host");
const shadowRoot = hostElement.shadowRoot;
const inputElement = shadowRoot.querySelector("input");

// Feature test for ariaLabelledByElements
if ("ariaLabelledByElements" in ElementInternals.prototype) {
  // Get and log attribute that provides the accessible name
  log(`aria-labelledby: ${inputElement.getAttribute("aria-labelledby")}`);

  // Get and log elements that provide the accessible name
  const labelElements = inputElement.ariaLabelledByElements;
  log(`ariaLabelledByElements: ${labelElements}`);

  // Log inner text of elements to get accessible name
  const text = labelElements.map((e) => e.textContent.trim()).join(" ");
  log(`Accessible name: ${text.trim()}`);
} else {
  log("ariaLabelledByElements not supported by browser");
}
```

#### Kết quả

Nhật ký bên dưới hiển thị đầu ra của mã trên.
Kết quả này sẽ hiển thị mảng các phần tử {{domxref("HTMLSpanElement")}} được tham chiếu và tên truy cập kết quả từ văn bản bên trong của chúng.

{{EmbedLiveSample("Get the accessible name","100%","150px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
- {{domxref("Element.ariaLabelledByElements")}}
- [Tham chiếu phần tử được phản ánh](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản ánh thuộc tính_.
