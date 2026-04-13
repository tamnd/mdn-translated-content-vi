---
title: "Element: thuộc tính ariaErrorMessageElements"
short-title: ariaErrorMessageElements
slug: Web/API/Element/ariaErrorMessageElements
page-type: web-api-instance-property
browser-compat: api.Element.ariaErrorMessageElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaErrorMessageElements`** của giao diện {{domxref("Element")}} là một mảng chứa (các) phần tử cung cấp thông báo lỗi cho phần tử mà nó được áp dụng.

Chủ đề [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage) chứa thêm thông tin về cách sử dụng thuộc tính và property này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}. Văn bản bên trong của các phần tử này có thể được nối với nhau bằng dấu cách để lấy thông báo lỗi.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc. Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo đối với mảng không ảnh hưởng đến giá trị của property.

## Mô tả

Property này là một giải pháp thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage) để thiết lập thông báo lỗi cho một phần tử. Không giống như `aria-errormessage`, các phần tử được gán cho property này không cần có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Property này phản chiếu thuộc tính [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage) của phần tử khi nó được định nghĩa, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi. Nếu property được thiết lập, thì thuộc tính tương ứng sẽ bị xóa. Để biết thêm thông tin về tham chiếu phần tử được phản chiếu và phạm vi, xem [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính phản chiếu_.

## Ví dụ

### Đầu vào email với thông báo lỗi

Ví dụ này cho thấy cách chúng ta sử dụng `aria-errormessage` để thiết lập thông báo lỗi cho việc báo cáo nhập địa chỉ email không hợp lệ, và minh họa cách chúng ta có thể lấy và thiết lập thông báo bằng cách sử dụng `ariaErrorMessageElements`.

#### HTML

Đầu tiên chúng ta định nghĩa một đầu vào email HTML, thiết lập thuộc tính `aria-errormessage` của nó để tham chiếu đến phần tử có `id` là `err1`. Sau đó chúng ta định nghĩa một phần tử `<span>` có id này và chứa thông báo lỗi.

```html
<p>
  <label for="email">Email address:</label>
  <input type="email" name="email" id="email" aria-errormessage="err1" />
  <span id="err1" class="errormessage">Error: Enter a valid email address</span>
</p>
```

#### CSS

Chúng ta tạo một số kiểu để ẩn thông báo lỗi theo mặc định, nhưng hiển thị nó và styled như một lỗi khi `aria-invalid` được thiết lập trên phần tử.

```css
.errormessage {
  visibility: hidden;
}

[aria-invalid="true"] {
  outline: 2px solid red;
}

[aria-invalid="true"] ~ .errormessage {
  visibility: visible;
}
```

#### JavaScript

Sau đó chúng ta kiểm tra đầu vào và thiết lập {{domxref("Element/ariaInvalid", "ariaInvalid")}} thành `true` hoặc `false` dựa trên vi phạm ràng buộc [`typeMismatch`](/en-US/docs/Web/API/ValidityState/typeMismatch). `ariaInvalid` lần lượt được phản chiếu trong thuộc tính `aria-invalid`, thuộc tính này ẩn và hiển thị lỗi khi cần.

```js
const email = document.querySelector("#email");

email.addEventListener("input", (event) => {
  if (email.validity.typeMismatch) {
    email.ariaInvalid = true;
  } else {
    email.ariaInvalid = false;
  }
});
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

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Sau đó chúng ta ghi lại giá trị của thuộc tính `aria-errormessage`, `ariaErrorMessageElements` và văn bản bên trong của `ariaErrorMessageElements`

```js
log(`aria-errormessage: ${email.getAttribute("aria-errormessage")}`);
// Feature test for ariaErrorMessageElements
if ("ariaErrorMessageElements" in Element.prototype) {
  // Get ariaErrorMessageElements
  const propElements = email.ariaErrorMessageElements;
  log(`ariaErrorMessageElements: ${propElements}`);

  // Accessible text from element inner text
  const text = propElements.map((e) => e.textContent.trim()).join(" ");
  log(`Error message details: ${text}`);
} else {
  log("element.ariaErrorMessageElements: not supported by browser");
}
```

#### Kết quả

Khi bạn nhập địa chỉ email, văn bản lỗi sẽ được hiển thị cho đến khi địa chỉ email hợp lệ. Lưu ý rằng nhật ký cho thấy tham chiếu thông báo lỗi đọc từ thuộc tính, phần tử từ `ariaErrorMessageElements`, và văn bản bên trong của phần tử, đây là thông báo lỗi của nó.

{{EmbedLiveSample("Email input with error message","100%","180px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)
- {{domxref("ElementInternals.ariaErrorMessageElements")}}
- [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản chiếu thuộc tính_.
