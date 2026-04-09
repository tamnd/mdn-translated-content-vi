---
title: HTML id global attribute
short-title: id
slug: Web/HTML/Reference/Global_attributes/id
page-type: html-attribute
browser-compat: html.global_attributes.id
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`id`** xác định một định danh (ID) phải là duy nhất trong toàn bộ tài liệu.

{{InteractiveExample("HTML Demo: id", "tabbed-shorter")}}

```html interactive-example
<p>A normal, boring paragraph. Try not to fall asleep.</p>

<p id="exciting">The most exciting paragraph on the page. One of a kind!</p>
```

```css interactive-example
#exciting {
  background: linear-gradient(to bottom, #ffe8d4, #f69d3c);
  border: 1px solid dimgrey;
  padding: 10px;
  border-radius: 10px;
  box-shadow: 2px 2px 1px black;
}

#exciting::before {
  content: "ℹ️";
  margin-right: 5px;
}
```

## Cú pháp

Giá trị của thuộc tính ID không được chứa các ký tự [khoảng trắng ASCII](/en-US/docs/Glossary/Whitespace#in_html). Các trình duyệt xử lý các ID không hợp lệ có chứa khoảng trắng như thể khoảng trắng là một phần của ID. Trái với thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) cho phép các giá trị phân tách bằng dấu cách, các phần tử chỉ có thể có một giá trị ID duy nhất.

Về mặt kỹ thuật, giá trị của thuộc tính ID có thể chứa bất kỳ ký tự Unicode nào khác. Tuy nhiên, khi được sử dụng trong các bộ chọn CSS, từ JavaScript bằng các API như {{domxref("Document.querySelector()")}} hoặc trong các stylesheet CSS, các giá trị thuộc tính ID phải là [định danh CSS](/en-US/docs/Web/CSS/Reference/Values/ident) hợp lệ. Điều này có nghĩa là nếu giá trị thuộc tính ID không phải là định danh CSS hợp lệ (ví dụ: `my?id` hoặc `1234`), thì nó phải được thoát trước khi sử dụng trong bộ chọn, sử dụng phương thức {{domxref("CSS.escape_static", "CSS.escape()")}} hoặc [thủ công](/en-US/docs/Web/CSS/Reference/Values/ident#escaping_characters).

Vì lý do này, các nhà phát triển nên chọn các giá trị cho thuộc tính ID là định danh CSS hợp lệ không cần thoát.

Ngoài ra, không phải tất cả các giá trị thuộc tính ID hợp lệ đều là định danh JavaScript hợp lệ. Ví dụ, `1234` là giá trị thuộc tính hợp lệ nhưng không phải là định danh JavaScript hợp lệ. Điều này có nghĩa là giá trị không phải là tên biến hợp lệ, vì vậy bạn không thể truy cập phần tử bằng mã như `window.1234`. Tuy nhiên, bạn có thể truy cập nó bằng `window["1234"]`.

## Mô tả

Mục đích của thuộc tính ID là xác định một phần tử duy nhất khi liên kết (sử dụng [định danh phân đoạn](/en-US/docs/Web/URI/Reference/Fragment)), viết script, hoặc tạo kiểu (với {{glossary("CSS")}}).

Bạn có thể truy cập các phần tử có thuộc tính ID như các thuộc tính toàn cục của đối tượng `window`, trong đó tên thuộc tính là giá trị ID, và giá trị thuộc tính là phần tử tương ứng. Ví dụ, với markup này:

```html
<p id="preamble"></p>
```

Bạn có thể truy cập phần tử đoạn văn này trong JavaScript bằng đoạn mã sau:

```js
const content = window.preamble.textContent;
```

> [!WARNING]
> Việc dựa vào mẫu `window["id-value"]` hoặc `window.idValue` là nguy hiểm và không được khuyến khích vì nó có thể dẫn đến các xung đột không mong muốn với các API hiện có hoặc tương lai trong trình duyệt.
> Ví dụ, nếu một trình duyệt giới thiệu một thuộc tính toàn cục tích hợp có tên `preamble` trong tương lai, mã của bạn có thể không còn truy cập được phần tử HTML nữa.
> Để tránh những xung đột như vậy, hãy luôn sử dụng phương thức {{domxref("Document.getElementById()")}} hoặc {{domxref("Document.querySelector()")}} để truy cập các phần tử theo ID.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- {{domxref("Element.id")}} phản ánh thuộc tính này.
- Phương thức {{domxref("Document.getElementById")}}.
- [Bộ chọn ID](/en-US/docs/Web/CSS/Reference/Selectors/ID_selectors) trong CSS.
