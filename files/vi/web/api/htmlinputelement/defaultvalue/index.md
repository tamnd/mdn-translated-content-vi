---
title: "HTMLInputElement: thuộc tính defaultValue"
short-title: defaultValue
slug: Web/API/HTMLInputElement/defaultValue
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.defaultValue
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`defaultValue`** của giao diện {{domxref("HTMLInputElement")}} cho biết giá trị ban đầu (hoặc mặc định) của phần tử {{HTMLElement("input")}}. Nó phản ánh thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử.

## Giá trị

Một chuỗi đại diện cho giá trị mặc định hoặc ban đầu của phần tử `<input>`.

## Ví dụ

Cho đoạn HTML sau:

```html
<label for="planet">Bạn được sinh ra trên hành tinh nào?</label>
<input id="planet" type="text" value="Azarath" />
```

Đoạn mã sau sẽ cung cấp cùng kết quả, bất kể người dùng nhập gì vào đầu vào văn bản.

```js
const inputElement = document.querySelector("#planet");
console.log(`Giá trị ban đầu: ${inputElement.defaultValue}`); // "Giá trị ban đầu: Azarath"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.value")}}
- {{domxref("HTMLInputElement.type")}}
