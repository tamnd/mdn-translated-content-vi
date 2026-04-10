---
title: "Document: phương thức getElementsByTagName()"
short-title: getElementsByTagName()
slug: Web/API/Document/getElementsByTagName
page-type: web-api-instance-method
browser-compat: api.Document.getElementsByTagName
---

{{APIRef("DOM")}}

Phương thức **`getElementsByTagName`** của giao diện {{domxref("Document")}} trả về một {{domxref("HTMLCollection")}} gồm các phần tử có tên thẻ đã cho.

Toàn bộ tài liệu được tìm kiếm, bao gồm cả nút gốc. `HTMLCollection` trả về là trực tiếp, nghĩa là nó tự động cập nhật để đồng bộ với cây DOM mà không cần phải gọi `document.getElementsByTagName()` lại.

## Cú pháp

```js-nolint
getElementsByTagName(name)
```

### Tham số

- `name`
  - : Một chuỗi đại diện cho tên của các phần tử. Chuỗi đặc biệt `*` đại diện cho tất cả các phần tử.

### Giá trị trả về

Một {{domxref("HTMLCollection")}} trực tiếp gồm các phần tử được tìm thấy theo thứ tự xuất hiện trong cây.

## Ví dụ

Trong ví dụ sau, `getElementsByTagName()` bắt đầu từ một phần tử cha cụ thể và tìm kiếm đệ quy từ trên xuống qua DOM từ phần tử cha đó, xây dựng một bộ sưu tập gồm tất cả các phần tử hậu duệ khớp với tham số `name` của thẻ.

Nhấp vào các nút sử dụng `getElementsByTagName()` để đếm các phần tử đoạn văn hậu duệ của một phần tử cha cụ thể (hoặc chính tài liệu hoặc một trong hai phần tử {{HTMLElement("div")}} lồng nhau).

```html
<p>Some outer text</p>
<p>Some outer text</p>

<div id="div1">
  <p>Some div1 text</p>
  <p>Some div1 text</p>
  <p>Some div1 text</p>

  <div id="div2">
    <p>Some div2 text</p>
    <p>Some div2 text</p>
  </div>
</div>

<p>Some outer text</p>
<p>Some outer text</p>

<button id="btn1">Hiển thị tất cả phần tử p trong tài liệu</button>
<br />
<button id="btn2">Hiển thị tất cả phần tử p trong phần tử div1</button>
<br />
<button id="btn3">Hiển thị tất cả phần tử p trong phần tử div2</button>
```

```css
body {
  border: solid green 3px;
}

#div1 {
  border: solid blue 3px;
}

#div2 {
  border: solid red 3px;
}
```

```js
function getAllParaElems() {
  const allParas = document.getElementsByTagName("p");
  const num = allParas.length;
  alert(`Có ${num} đoạn văn trong tài liệu này`);
}

function div1ParaElems() {
  const div1 = document.getElementById("div1");
  const div1Paras = div1.getElementsByTagName("p");
  const num = div1Paras.length;
  alert(`Có ${num} đoạn văn trong #div1`);
}

function div2ParaElems() {
  const div2 = document.getElementById("div2");
  const div2Paras = div2.getElementsByTagName("p");
  const num = div2Paras.length;
  alert(`Có ${num} đoạn văn trong #div2`);
}

document.getElementById("btn1").addEventListener("click", getAllParaElems);
document.getElementById("btn2").addEventListener("click", div1ParaElems);
document.getElementById("btn3").addEventListener("click", div2ParaElems);
```

## Ghi chú

Khi được gọi trên tài liệu HTML, `getElementsByTagName()` chuyển đối số thành chữ thường trước khi tiếp tục. Điều này không mong muốn khi cố khớp các phần tử SVG {{Glossary("camel_case", "camel case")}} trong cây con của tài liệu HTML.
{{Domxref("document.getElementsByTagNameNS()")}} hữu ích trong trường hợp đó. Xem thêm [Firefox bug 499656](https://bugzil.la/499656).

`document.getElementsByTagName()` tương tự như {{domxref("Element.getElementsByTagName()")}}, ngoại trừ việc tìm kiếm bao quát toàn bộ tài liệu.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.getElementsByTagName()")}}
- {{domxref("document.getElementById()")}} để trả về tham chiếu đến một phần tử theo `id` của nó
- {{domxref("document.getElementsByName()")}} để trả về tham chiếu đến một phần tử theo `name` của nó
- {{domxref("document.querySelector()")}} cho các bộ chọn mạnh mẽ qua truy vấn như `'div.myclass'`
