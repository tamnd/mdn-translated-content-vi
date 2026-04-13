---
title: "Document: phương thức querySelectorAll()"
short-title: querySelectorAll()
slug: Web/API/Document/querySelectorAll
page-type: web-api-instance-method
browser-compat: api.Document.querySelectorAll
---

{{APIRef("DOM")}}

Phương thức {{domxref("Document")}} **`querySelectorAll()`** trả về một {{domxref("NodeList")}} tĩnh (không trực tiếp) đại diện cho danh sách các phần tử của tài liệu khớp với nhóm selector đã chỉ định.

## Cú pháp

```js-nolint
querySelectorAll(selectors)
```

### Tham số

- `selectors`
  - : Một chuỗi chứa một hoặc nhiều selector cần khớp. Chuỗi này phải là một chuỗi CSS selector hợp lệ; nếu không, một ngoại lệ `SyntaxError` sẽ được ném ra.

    Lưu ý rằng đặc tả HTML không yêu cầu giá trị thuộc tính phải là định danh CSS hợp lệ. Nếu giá trị thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) hoặc [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) không phải là định danh CSS hợp lệ, thì bạn phải escape nó trước khi sử dụng trong selector, bằng cách gọi {{domxref("CSS.escape_static", "CSS.escape()")}} trên giá trị, hoặc sử dụng một trong các kỹ thuật được mô tả trong [Escaping characters](/en-US/docs/Web/CSS/Reference/Values/ident#escaping_characters). Xem [Escaping attribute values](#escaping_attribute_values) để biết ví dụ.

### Giá trị trả về

Một {{domxref("NodeList")}} không trực tiếp chứa một đối tượng {{domxref("Element")}} cho mỗi phần tử khớp với ít nhất một trong các selector đã chỉ định hoặc một {{domxref("NodeList")}} rỗng trong trường hợp không có kết quả khớp nào. Các phần tử theo thứ tự tài liệu — tức là, cha trước con, anh chị em trước sau.

> [!NOTE]
> Nếu `selectors` đã chỉ định bao gồm một [CSS pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements), danh sách trả về luôn luôn rỗng.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu cú pháp của chuỗi `selectors` đã chỉ định không hợp lệ.

## Ví dụ

### Lấy danh sách kết quả khớp

Để lấy {{domxref("NodeList")}} của tất cả các phần tử {{HTMLElement("p")}} trong tài liệu:

```js
const matches = document.querySelectorAll("p");
```

Ví dụ này trả về danh sách tất cả các phần tử {{HTMLElement("div")}} trong tài liệu có class là `note` hoặc `alert`:

```js
const matches = document.querySelectorAll("div.note, div.alert");
```

Ở đây, chúng ta lấy danh sách các phần tử `<p>` có phần tử cha trực tiếp là một {{HTMLElement("div")}} có class `highlighted` và nằm bên trong một container có ID là `test`.

```js
const container = document.querySelector("#test");
const matches = container.querySelectorAll("div.highlighted > p");
```

Ví dụ này sử dụng một [attribute selector](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) để trả về danh sách các phần tử {{HTMLElement("iframe")}} trong tài liệu có chứa thuộc tính tên `data-src`:

```js
const matches = document.querySelectorAll("iframe[data-src]");
```

Ở đây, một attribute selector được sử dụng để trả về danh sách các mục danh sách chứa trong một danh sách có ID là `user-list` có thuộc tính `data-active` với giá trị là `1`:

```js
const container = document.querySelector("#user-list");
const matches = container.querySelectorAll("li[data-active='1']");
```

### Truy cập kết quả khớp

Khi {{domxref("NodeList")}} của các phần tử khớp được trả về, bạn có thể kiểm tra nó giống như bất kỳ mảng nào. Nếu mảng rỗng (tức là thuộc tính `length` của nó là 0), thì không có kết quả khớp nào được tìm thấy.

Nếu không, bạn có thể sử dụng ký hiệu mảng tiêu chuẩn để truy cập nội dung của danh sách. Bạn có thể sử dụng bất kỳ câu lệnh lặp phổ biến nào, chẳng hạn như:

```js
const highlightedItems = userList.querySelectorAll(".highlighted");

highlightedItems.forEach((userItem) => {
  deleteUser(userItem);
});
```

### Escaping các giá trị thuộc tính

Ví dụ này cho thấy nếu một tài liệu HTML chứa một [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) không phải là một [CSS identifier](/en-US/docs/Web/CSS/Reference/Values/ident) hợp lệ, thì chúng ta phải escape giá trị thuộc tính trước khi sử dụng nó trong `querySelectorAll()`.

#### HTML

Trong đoạn mã sau, một phần tử {{htmlelement("div")}} có `id` là `"this?element"`, không phải là một CSS identifier hợp lệ, vì ký tự `"?"` không được phép trong CSS identifiers.

Chúng ta cũng có ba nút, và một phần tử {{htmlelement("pre")}} để ghi log lỗi.

```html
<div id="this?element"></div>

<button id="no-escape">No escape</button>
<button id="css-escape">CSS.escape()</button>
<button id="manual-escape">Manual escape</button>

<pre id="log"></pre>
```

#### CSS

```css
div {
  background-color: blue;
  margin: 1rem 0;
  height: 100px;
  width: 200px;
}
```

#### JavaScript

Cả ba nút, khi nhấp, cố gắng chọn `<div>`, và sau đó đặt màu nền của nó thành giá trị ngẫu nhiên.

- Nút đầu tiên sử dụng trực tiếp giá trị `"this?element"`.
- Nút thứ hai escape giá trị bằng cách sử dụng {{domxref("CSS.escape_static", "CSS.escape()")}}.
- Nút thứ ba escape rõ ràng ký tự `"?"` bằng dấu gạch chéo ngược. Lưu ý rằng chúng ta cũng phải escape chính dấu gạch chéo ngược, bằng cách sử dụng một dấu gạch chéo ngược khác, như: `"\\?"`.

```js
const log = document.querySelector("#log");

function random(number) {
  return Math.floor(Math.random() * number);
}

function setBackgroundColor(id) {
  log.textContent = "";

  try {
    const elements = document.querySelectorAll(`#${id}`);
    const randomColor = `rgb(${random(255)} ${random(255)} ${random(255)})`;
    elements[0].style.backgroundColor = randomColor;
  } catch (e) {
    log.textContent = e;
  }
}

document.querySelector("#no-escape").addEventListener("click", () => {
  setBackgroundColor("this?element");
});

document.querySelector("#css-escape").addEventListener("click", () => {
  setBackgroundColor(CSS.escape("this?element"));
});

document.querySelector("#manual-escape").addEventListener("click", () => {
  setBackgroundColor("this\\?element");
});
```

#### Kết quả

Nhấp vào nút đầu tiên gây ra lỗi, trong khi nút thứ hai và thứ ba hoạt động bình thường.

{{embedlivesample("escaping_attribute_values", "", 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Selection and traversal on the DOM tree](/en-US/docs/Web/API/Document_Object_Model/Selection_and_traversal_on_the_DOM_tree)
- [Attribute selectors](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) trong CSS Guide
- [Attribute selectors](/en-US/docs/Learn_web_development/Core/Styling_basics/Attribute_selectors) trong MDN Learning Area
- {{domxref("Element.querySelector()")}} và {{domxref("Element.querySelectorAll()")}}
- {{domxref("Document.querySelector()")}}
- {{domxref("DocumentFragment.querySelector()")}} và {{domxref("DocumentFragment.querySelectorAll()")}}
