---
title: "Document: phương thức getElementsByClassName()"
short-title: getElementsByClassName()
slug: Web/API/Document/getElementsByClassName
page-type: web-api-instance-method
browser-compat: api.Document.getElementsByClassName
---

{{APIRef("DOM")}}

Phương thức **`getElementsByClassName`** của giao diện {{domxref("Document")}} trả về một đối tượng giống mảng gồm tất cả các phần tử con có tất cả các tên lớp đã cho.

Khi được gọi trên đối tượng {{domxref("document")}}, toàn bộ tài liệu được tìm kiếm, bao gồm cả nút gốc. Bạn cũng có thể gọi {{domxref("Element.getElementsByClassName", "getElementsByClassName()")}} trên bất kỳ phần tử nào; nó sẽ chỉ trả về các phần tử là hậu duệ của phần tử gốc đã chỉ định với (các) tên lớp đã cho.

> [!WARNING]
> Đây là một {{domxref("HTMLCollection")}} trực tiếp. Các thay đổi trong DOM sẽ được phản ánh trong mảng khi thay đổi xảy ra. Nếu một phần tử được chọn bởi mảng này không còn đủ điều kiện cho bộ chọn, nó sẽ tự động bị loại bỏ. Hãy lưu ý điều này cho mục đích lặp.

## Cú pháp

```js-nolint
getElementsByClassName(names)
```

### Tham số

- `names`
  - : Một chuỗi đại diện cho (các) tên lớp cần khớp; nhiều tên lớp được phân tách bằng khoảng trắng.

### Giá trị trả về

Một {{domxref("HTMLCollection")}} trực tiếp gồm các phần tử được tìm thấy.

## Ví dụ

Lấy tất cả các phần tử có lớp 'test':

```js
document.getElementsByClassName("test");
```

Lấy tất cả các phần tử có cả hai lớp 'red' và 'test':

```js
document.getElementsByClassName("red test");
```

Lấy tất cả các phần tử có lớp 'test', bên trong một phần tử có ID là 'main':

```js
document.getElementById("main").getElementsByClassName("test");
```

Lấy phần tử đầu tiên có lớp 'test', hoặc `undefined` nếu không có phần tử khớp:

```js
document.getElementsByClassName("test")[0];
```

Chúng ta cũng có thể sử dụng các phương thức của Array.prototype trên bất kỳ {{domxref("HTMLCollection")}} nào bằng cách truyền `HTMLCollection` làm giá trị _this_ của phương thức. Ở đây chúng ta sẽ tìm tất cả các phần tử div có lớp 'test':

```js
const testElements = document.getElementsByClassName("test");
const testDivs = Array.prototype.filter.call(
  testElements,
  (testElement) => testElement.nodeName === "DIV",
);
```

### Lấy phần tử đầu tiên có lớp là 'test'

Đây là phương thức hoạt động được sử dụng phổ biến nhất.

```html
<div id="parent-id">
  <p>hello world 1</p>
  <p class="test">hello world 2</p>
  <p>hello world 3</p>
  <p>hello world 4</p>
</div>
```

```js
const parentDOM = document.getElementById("parent-id");

const test = parentDOM.getElementsByClassName("test"); // một danh sách các phần tử khớp, *không phải* chính phần tử
console.log(test); // HTMLCollection[1]

const testTarget = parentDOM.getElementsByClassName("test")[0]; // phần tử đầu tiên, như chúng ta muốn
console.log(testTarget); // <p class="test">hello world 2</p>
```

### Ví dụ nhiều lớp

`document.getElementsByClassName` hoạt động rất giống với `document.querySelector` và `document.querySelectorAll`. Chỉ các phần tử có TẤT CẢ các tên lớp được chỉ định mới được chọn.

#### HTML

```html
<span class="orange fruit">Cam trái cây</span>
<span class="orange juice">Nước cam</span>
<span class="apple juice">Nước táo</span>
<span class="foo bar">Cái gì đó ngẫu nhiên</span>
<textarea id="resultArea"></textarea>
```

```css hidden
#resultArea {
  width: 98%;
  height: 7em;
}
```

#### JavaScript

```js
// getElementsByClassName chỉ chọn các phần tử có cả hai lớp đã cho
const allOrangeJuiceByClass = document.getElementsByClassName("orange juice");
let result = "document.getElementsByClassName('orange juice')";
for (const el of allOrangeJuiceByClass) {
  result += `\n  ${el.textContent}`;
}

// querySelector chỉ chọn các khớp đầy đủ hoàn chỉnh
const allOrangeJuiceQuery = document.querySelectorAll(".orange.juice");
result += "\n\ndocument.querySelectorAll('.orange.juice')";
for (const el of allOrangeJuiceQuery) {
  result += `\n  ${el.textContent}`;
}

document.getElementById("resultArea").value = result;
```

#### Kết quả

{{EmbedLiveSample('Multiple_Classes_Example', '100%', 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
