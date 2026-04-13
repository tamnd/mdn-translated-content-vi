---
title: "Document: phương thức getElementsByTagNameNS()"
short-title: getElementsByTagNameNS()
slug: Web/API/Document/getElementsByTagNameNS
page-type: web-api-instance-method
browser-compat: api.Document.getElementsByTagNameNS
---

{{APIRef("DOM")}}

Trả về danh sách các phần tử có tên thẻ đã cho thuộc namespace đã cho. Toàn bộ tài liệu được tìm kiếm, bao gồm cả nút gốc.

## Cú pháp

```js-nolint
getElementsByTagNameNS(namespace, name)
```

### Tham số

- `namespace`
  - : URI namespace của các phần tử cần tìm (xem {{domxref("Element.namespaceURI", "element.namespaceURI")}}).
- `name`
  - : Tên cục bộ của các phần tử cần tìm hoặc giá trị đặc biệt `*`, khớp với tất cả các phần tử (xem {{domxref("Element.localName", "element.localName")}}).

    > [!NOTE]
    > Không giống như {{domxref("document.getElementsByTagName()")}}, các tham số cho `getElementsByTagNameNS()` có phân biệt chữ hoa chữ thường.

### Giá trị trả về

Một {{DOMxRef("HTMLCollection")}} trực tiếp gồm các phần tử được tìm thấy theo thứ tự xuất hiện trong cây.

## Ví dụ

Trong ví dụ sau `getElementsByTagNameNS` bắt đầu từ một phần tử cha cụ thể, và tìm kiếm đệ quy từ trên xuống qua DOM từ phần tử cha đó, tìm kiếm các phần tử con khớp với tham số `name` của thẻ.

Lưu ý rằng khi nút mà `getElementsByTagName` được gọi không phải là nút `document`, thực tế phương thức {{domxref("element.getElementsByTagNameNS")}} được sử dụng.

Để sử dụng ví dụ sau, chỉ cần sao chép/dán vào một tệp mới lưu với phần mở rộng .xhtml.

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

<button id="btn1">Show all p elements in document</button>
<br />
<button id="btn2">Show all p elements in div1 element</button>
<br />
<button id="btn3">Show all p elements in div2 element</button>
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
  const allParas = document.getElementsByTagNameNS(
    "http://www.w3.org/1999/xhtml",
    "p",
  );
  const num = allParas.length;
  alert(`There are ${num} &lt;p&gt; elements in this document`);
}

function div1ParaElems() {
  const div1 = document.getElementById("div1");
  const div1Paras = div1.getElementsByTagNameNS(
    "http://www.w3.org/1999/xhtml",
    "p",
  );
  const num = div1Paras.length;
  alert(`There are ${num} &lt;p&gt; elements in div1 element`);
}

function div2ParaElems() {
  const div2 = document.getElementById("div2");
  const div2Paras = div2.getElementsByTagNameNS(
    "http://www.w3.org/1999/xhtml",
    "p",
  );
  const num = div2Paras.length;
  alert(`There are ${num} &lt;p&gt; elements in div2 element`);
}

document.getElementById("btn1").addEventListener("click", getAllParaElems);
document.getElementById("btn2").addEventListener("click", div1ParaElems);
document.getElementById("btn3").addEventListener("click", div2ParaElems);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Element.getElementsByTagNameNS()")}}
