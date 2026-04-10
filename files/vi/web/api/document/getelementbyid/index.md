---
title: "Document: phương thức getElementById()"
short-title: getElementById()
slug: Web/API/Document/getElementById
page-type: web-api-instance-method
browser-compat: api.Document.getElementById
---

{{ ApiRef("DOM") }}

Phương thức **`getElementById()`** của giao diện {{domxref("Document")}} trả về một đối tượng {{domxref("Element")}} đại diện cho phần tử có thuộc tính {{domxref("Element.id", "id")}} khớp với chuỗi đã chỉ định. Vì ID phần tử được yêu cầu phải là duy nhất nếu được chỉ định, chúng là một cách hữu ích để truy cập nhanh một phần tử cụ thể.

Nếu bạn cần truy cập một phần tử không có ID, bạn có thể sử dụng {{domxref("Document.querySelector", "querySelector()")}} để tìm phần tử bằng bất kỳ {{Glossary("CSS selector", "bộ chọn CSS")}} nào.

> [!NOTE]
> ID phải là duy nhất bên trong một tài liệu. Nếu hai hoặc nhiều phần tử trong tài liệu có cùng ID, phương thức này trả về phần tử đầu tiên được tìm thấy.

## Cú pháp

```js-nolint
getElementById(id)
```

> [!NOTE]
> Việc viết hoa `"Id"` trong tên của phương thức này _phải_ chính xác để mã hoạt động; `getElementByID()` _không_ hợp lệ và sẽ không hoạt động, dù có tự nhiên đến đâu.

### Tham số

- `id`
  - : ID của phần tử cần xác định vị trí. ID là một chuỗi có phân biệt chữ hoa chữ thường và là duy nhất trong tài liệu; chỉ một phần tử nên có bất kỳ ID nào.

### Giá trị trả về

Một đối tượng {{domxref("Element")}} mô tả đối tượng phần tử DOM khớp với ID đã chỉ định, hoặc `null` nếu không tìm thấy phần tử khớp nào trong tài liệu.

## Ví dụ

### HTML

```html
<p id="para">Some text here</p>
<button>xanh dương</button>
<button>đỏ</button>
```

### JavaScript

```js
function changeColor(newColor) {
  const elem = document.getElementById("para");
  elem.style.color = newColor;
}

document.querySelectorAll("button").forEach((button) => {
  button.addEventListener("click", (event) => {
    changeColor(event.target.textContent.toLowerCase());
  });
});
```

### Kết quả

{{ EmbedLiveSample('Examples', 250, 120) }}

## Ghi chú sử dụng

Không giống một số phương thức tra cứu phần tử khác như {{domxref("Document.querySelector()")}} và {{domxref("Document.querySelectorAll()")}}, `getElementById()` chỉ khả dụng như một phương thức của đối tượng `document` toàn cục, và _không_ khả dụng như một phương thức trên tất cả các đối tượng phần tử trong DOM. Vì giá trị ID phải là duy nhất trong toàn bộ tài liệu, không cần các phiên bản "cục bộ" của hàm.

### Ví dụ

```html
<div id="parent-id">
  <p>hello word1</p>
  <p id="test1">hello word2</p>
  <p>hello word3</p>
  <p>hello word4</p>
</div>
```

```js
const parentDOM = document.getElementById("parent-id");
const test1 = parentDOM.getElementById("test1");
```

Nếu không có phần tử nào có `id` đã cho, hàm này trả về `null`. Lưu ý rằng tham số `id` có phân biệt chữ hoa chữ thường, vì vậy `document.getElementById("Main")` sẽ trả về `null` thay vì phần tử `<div id="main">` vì "M" và "m" khác nhau đối với mục đích của phương thức này.

Các phần tử không nằm trong tài liệu không được `getElementById()` tìm kiếm. Khi tạo một phần tử và gán ID cho nó, bạn phải chèn phần tử vào cây tài liệu bằng {{domxref("Node.insertBefore()")}} hoặc một phương thức tương tự trước khi có thể truy cập nó bằng `getElementById()`:

```js
const element = document.createElement("div");
element.id = "test";
const el = document.getElementById("test"); // el sẽ là null!
```

Trong các tài liệu không phải HTML, việc triển khai DOM phải có thông tin về thuộc tính nào có kiểu ID. Các thuộc tính có tên "id" không có kiểu ID trừ khi được định nghĩa như vậy trong DTD của tài liệu. Thuộc tính `id` được định nghĩa có kiểu ID trong các trường hợp phổ biến của [XHTML](/en-US/docs/Glossary/XHTML), XUL và các trường hợp khác. Các triển khai không biết liệu thuộc tính có kiểu ID hay không dự kiến sẽ trả về `null`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tham chiếu {{domxref("Document")}} cho các phương thức và thuộc tính khác bạn có thể sử dụng để lấy tham chiếu đến các phần tử trong tài liệu.
- {{domxref("Document.querySelector()")}} cho các bộ chọn qua truy vấn như `'div.myclass'`
- {{domxref("Document.evaluate()")}} - có một phương thức tiện ích để chọn theo `xml:id` trong tài liệu {{glossary("XML")}}
