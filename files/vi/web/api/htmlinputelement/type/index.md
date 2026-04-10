---
title: "HTMLInputElement: thuộc tính type"
short-title: type
slug: Web/API/HTMLInputElement/type
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.type
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`type`** của giao diện {{domxref("HTMLInputElement")}} cho biết loại dữ liệu được phép trong phần tử {{HTMLElement("input")}}, ví dụ: một số, một ngày hoặc một email. Trình duyệt sẽ chọn widget và hành vi phù hợp để giúp người dùng nhập giá trị hợp lệ.

Nó phản ánh thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) của phần tử {{HTMLElement("input")}}.

## Giá trị

Một chuỗi đại diện cho loại.

Các giá trị có thể được liệt kê trong phần [các loại đầu vào](/en-US/docs/Web/HTML/Reference/Elements/input#input_types) của thuộc tính.

## Ví dụ

### HTML

```html
<input id="input1" type="date" />
```

### JavaScript

```js
const inputElement = document.querySelector("#input1");
console.log(inputElement.type); // Kết quả: "date"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLTextAreaElement.type")}}
- Thuộc tính {{domxref("HTMLButtonElement.type")}}
