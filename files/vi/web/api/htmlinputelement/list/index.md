---
title: "HTMLInputElement: thuộc tính list"
short-title: list
slug: Web/API/HTMLInputElement/list
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.list
---

{{ApiRef("HTML DOM")}}

Thuộc tính chỉ đọc **`list`** của giao diện {{domxref("HTMLInputElement")}} trả về {{domxref("HTMLDataListElement")}} được trỏ bởi thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list) của phần tử, hoặc `null` nếu thuộc tính `list` không được định nghĩa hoặc giá trị của thuộc tính `list` không được liên kết với bất kỳ `<datalist>` nào trong cùng cây.

> [!NOTE]
> Đây là thuộc tính chỉ đọc. Để liên kết một `<datalist>` với một phần tử, hãy đặt giá trị của thuộc tính `list` bằng {{domxref("Element.setAttribute", "setAttribute()")}}.

## Giá trị

Một {{domxref("HTMLDataListElement")}} hoặc `null`.

## Ví dụ

Cho đoạn HTML sau:

```html
<label for="planet">Bạn đến từ hành tinh nào?</label>
<input id="planet" type="text" list="superhero" />
<datalist id="superhero">
  <option value="Azarath"></option>
  <option value="Krypton"></option>
  <option value="Tamaran"></option>
</datalist>
```

Bạn có thể lấy phần tử `<datalist>` được liên kết với `<input>`:

```js
const inputElement = document.querySelector("#planet");
console.log(inputElement.list); // trả về HTMLDatalistElement superhero
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.value")}}
- {{domxref("HTMLInputElement.type")}}
- {{domxref("HTMLDataListElement")}}
- {{domxref("HTMLOptionElement")}}
- {{domxref("HTMLCollection")}}
- {{htmlelement("input")}}
- {{htmlelement("datalist")}}
- {{htmlelement("option")}}
