---
title: "Document: phương thức querySelector()"
short-title: querySelector()
slug: Web/API/Document/querySelector
page-type: web-api-instance-method
browser-compat: api.Document.querySelector
---

{{ApiRef("DOM")}}

Phương thức {{domxref("Document")}} **`querySelector()`** trả về {{domxref("Element")}} đầu tiên trong tài liệu khớp với [CSS selector](/en-US/docs/Web/CSS/Guides/Selectors) đã chỉ định, hoặc nhóm các CSS selector. Nếu không tìm thấy kết quả khớp nào, `null` được trả về.

Việc khớp được thực hiện bằng cách duyệt theo thứ tự trước theo chiều sâu của các nút trong tài liệu bắt đầu với phần tử đầu tiên trong đánh dấu tài liệu và lặp qua các nút tuần tự theo thứ tự số lượng nút con.

Nếu selector đã chỉ định khớp với một ID được sử dụng sai nhiều hơn một lần trong tài liệu, phần tử đầu tiên có ID đó được trả về.

[CSS pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) sẽ không bao giờ trả về bất kỳ phần tử nào.

## Cú pháp

```js-nolint
querySelector(selectors)
```

### Tham số

- `selectors`
  - : Một chuỗi chứa một hoặc nhiều selector cần khớp. Chuỗi này phải là một chuỗi CSS selector hợp lệ; nếu không, một ngoại lệ `SyntaxError` sẽ được ném ra.

    Lưu ý rằng đặc tả HTML không yêu cầu giá trị thuộc tính phải là định danh CSS hợp lệ. Nếu giá trị thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) hoặc [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) không phải là định danh CSS hợp lệ, thì bạn phải escape nó trước khi sử dụng trong selector, bằng cách gọi {{domxref("CSS.escape_static", "CSS.escape()")}} trên giá trị, hoặc sử dụng một trong các kỹ thuật được mô tả trong [Escaping characters](/en-US/docs/Web/CSS/Reference/Values/ident#escaping_characters). Xem [Escaping attribute values](#escaping_attribute_values) để biết ví dụ.

### Giá trị trả về

Một đối tượng {{domxref("Element")}} đại diện cho phần tử đầu tiên trong tài liệu khớp với bộ [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) đã chỉ định, hoặc `null` được trả về nếu không có kết quả khớp nào.

Nếu bạn cần danh sách tất cả các phần tử khớp với các selector đã chỉ định, bạn nên sử dụng {{domxref("Document.querySelectorAll", "querySelectorAll()")}} thay thế.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu cú pháp của _selectors_ đã chỉ định không hợp lệ.

## Ví dụ

### Tìm phần tử đầu tiên khớp với một class

Trong ví dụ này, phần tử đầu tiên trong tài liệu có class `myclass` được trả về:

```js
const el = document.querySelector(".myclass");
```

### Các selector phức tạp

Các selector cũng có thể rất mạnh mẽ, như được minh họa trong ví dụ sau. Ở đây, phần tử {{HTMLElement("input")}} đầu tiên có tên "login" (`<input name="login"/>`) nằm bên trong một {{HTMLElement("div")}} có class là "user-panel main" (`<div class="user-panel main">`) trong tài liệu được trả về:

```js
const el = document.querySelector("div.user-panel.main input[name='login']");
```

### Phủ định

Vì tất cả chuỗi CSS selector đều hợp lệ, bạn cũng có thể phủ định các selector:

```js
const el = document.querySelector(
  "div.user-panel:not(.main) input[name='login']",
);
```

Điều này sẽ chọn một input có div cha có class `user-panel` nhưng không có class `main`.

### Escaping các giá trị thuộc tính

Ví dụ này cho thấy nếu một tài liệu HTML chứa một [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) không phải là một [CSS identifier](/en-US/docs/Web/CSS/Reference/Values/ident) hợp lệ, thì chúng ta phải escape giá trị thuộc tính trước khi sử dụng nó trong `querySelector()`.

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
    const element = document.querySelector(`#${id}`);
    const randomColor = `rgb(${random(255)} ${random(255)} ${random(255)})`;
    element.style.backgroundColor = randomColor;
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
- {{domxref("Element.querySelector()")}}
- {{domxref("Document.querySelectorAll()")}}
- {{domxref("Element.querySelectorAll()")}}
