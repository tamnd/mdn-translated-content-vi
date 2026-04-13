---
title: "HTMLInputElement: thuộc tính name"
short-title: name
slug: Web/API/HTMLInputElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.name
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`name`** của giao diện {{domxref("HTMLInputElement")}} cho biết tên của phần tử {{HTMLElement("input")}}. Nó phản ánh thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) của phần tử.

## Giá trị

Một chuỗi đại diện cho tên của phần tử.

## Ví dụ

Cho đoạn HTML sau:

```html
<p>
  <label for="planet">Bạn được sinh ra trên hành tinh nào?</label>
  <input id="planet" type="text" name="origin" />
</p>
```

Bạn có thể sử dụng thuộc tính `name` để lấy ra hoặc đặt tên của `<input>`:

```js
const inputElement = document.querySelector("#planet");
console.log(`Tên của phần tử: ${inputElement.name}`); // "Tên của phần tử: origin"
inputElement.name = "planet"; // cập nhật tên của phần tử
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.value")}}
- {{domxref("HTMLInputElement.type")}}
