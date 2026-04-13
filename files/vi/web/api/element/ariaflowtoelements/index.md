---
title: "Element: thuộc tính ariaFlowToElements"
short-title: ariaFlowToElements
slug: Web/API/Element/ariaFlowToElements
page-type: web-api-instance-property
browser-compat: api.Element.ariaFlowToElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaFlowToElements`** của giao diện {{domxref("Element")}} là một mảng chứa (các) phần tử cung cấp thứ tự đọc nội dung thay thế, ghi đè thứ tự đọc mặc định chung theo ý muốn của người dùng. Nếu chỉ cung cấp một phần tử thì đây là phần tử tiếp theo theo thứ tự đọc. Nếu cung cấp nhiều phần tử, thì mỗi phần tử đại diện cho một đường dẫn có thể được cung cấp cho người dùng để lựa chọn.

Chủ đề [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto) chứa thêm thông tin về cách sử dụng thuộc tính và property này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc. Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo đối với mảng không ảnh hưởng đến giá trị của property.

## Mô tả

Property này là một giải pháp thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto) để thiết lập thứ tự đọc thay thế. Không giống như `aria-flowto`, các phần tử được gán cho property này không cần có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Property này phản chiếu thuộc tính [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto) của phần tử khi nó được định nghĩa, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi. Nếu property được thiết lập, thì thuộc tính tương ứng sẽ bị xóa. Để biết thêm thông tin về tham chiếu phần tử được phản chiếu và phạm vi, xem [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính phản chiếu_.

## Ví dụ

### Lấy phần tử flow-to

Ví dụ này minh họa luồng bình thường qua ba phần tử `section1`, `section2`, `section3` theo thứ tự, và một thứ tự thay thế nhảy từ `section1` đến `section3`, và quay lại. Lưu ý rằng ví dụ này chỉ mang tính minh họa trừ khi bạn đang chạy công cụ hỗ trợ tiếp cận: chúng ta không thực sự đi theo đường dẫn thay thế này.

#### HTML

HTML định nghĩa ba phần tử {{htmlelement("div")}} định nghĩa các section, với class `"section"`, và các giá trị `id`: `section1`, `section2`, và `section3`. Mỗi section có một luồng bình thường được xác định bởi thứ tự của nó, bắt đầu từ `section1` và kết thúc ở `section3`. Một luồng thay thế được định nghĩa trong các section 1 và 3 bằng cách sử dụng thuộc tính `aria-flowto`.

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 200px;
  overflow: scroll;
  padding: 0.5rem;
  margin: 5px;
  border: 1px solid black;
}
```

```html
<div id="section1" class="section" aria-flowto="section3">
  <h2>Section 1</h2>
  <p>First section in normal flow. Section 3 is alternate flow.</p>
  <a href="#section2">Jump to Section 2 (normal flow)</a>
</div>

<div id="section2" class="section">
  <h2>Section 2</h2>
  <p>Second section in normal flow.</p>
  <a href="#section3">Jump to Section 3 (normal flow)</a>
</div>

<div id="section3" class="section" aria-flowto="section1">
  <h2>Section 3</h2>
  <p>
    Third section in normal flow (end of flow). Section 1 is alternate flow.
  </p>
</div>
```

#### JavaScript

Đoạn mã trước tiên kiểm tra xem `ariaFlowToElements` có được hỗ trợ không, và nếu có, ghi lại giá trị của nó. Sau đó lặp qua các section, ghi lại `id` của section, giá trị thuộc tính `aria-flowto`, và giá trị property `ariaFlowToElements`.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
// Feature test for ariaFlowToElements
if ("ariaFlowToElements" in Element.prototype) {
  const sections = document.querySelectorAll(".section");
  sections.forEach((sectionDivElement) => {
    log(`${sectionDivElement.id}`);
    log(` aria-flowto: ${sectionDivElement.getAttribute("aria-flowto")}`);
    log(" ariaFlowToElements:");
    // Get the ids of each of the elements in the array
    sectionDivElement.ariaFlowToElements?.forEach((elem) => {
      log(`  id: ${elem.id}`);
    });
  });
} else {
  log("element.ariaFlowToElements: not supported by browser");
}
```

#### Kết quả

Nhật ký dưới đây cho thấy mỗi section (được xác định bằng `id`) và các id phần tử flow-to tương ứng có thể được chọn bởi công cụ hỗ trợ tiếp cận. Chúng ta lưu ý ở đây rằng thuộc tính và property xác định cùng các phần tử flow-to.

{{EmbedLiveSample("Get the flow-to element","100%","570px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto)
- {{domxref("ElementInternals.ariaFlowToElements")}}
- [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản chiếu thuộc tính_.
