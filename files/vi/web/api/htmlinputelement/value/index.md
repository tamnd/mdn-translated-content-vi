---
title: "HTMLInputElement: thuộc tính value"
short-title: value
slug: Web/API/HTMLInputElement/value
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.value
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`value`** của giao diện {{DOMxRef("HTMLInputElement")}} đại diện cho giá trị hiện tại của phần tử {{htmlelement("input")}} dưới dạng chuỗi.

Thuộc tính này cũng có thể được đặt trực tiếp, ví dụ: để đặt giá trị mặc định dựa trên một điều kiện nào đó.

## Giá trị

Một chuỗi chỉ định giá trị mặc định của phần tử {{htmlelement("input")}}.

## Ví dụ

### Lấy giá trị đầu vào văn bản

Trong ví dụ này, nhật ký hiển thị giá trị hiện tại khi người dùng nhập dữ liệu vào đầu vào.

#### HTML

Chúng ta bao gồm một {{htmlelement("input")}} và một {{htmlelement("label")}} liên kết, với một vùng chứa {{htmlelement("pre")}} cho đầu ra.

```html
<label for="given-name">Tên của bạn:</label>

<input name="given-name" id="given-name" />

<pre id="log"></pre>
```

#### JavaScript

{{domxref("HTMLElement.innerText", "innerText")}} của phần tử `<pre>` được cập nhật thành giá trị hiện tại của `<input>` mỗi khi sự kiện {{domxref("Element/keyup_event", "keyup")}} được kích hoạt.

```js
const logElement = document.getElementById("log");
const inputElement = document.getElementById("given-name");

inputElement.addEventListener("keyup", () => {
  logElement.innerText = `Tên: ${inputElement.value}`;
});
```

```css hidden
#log {
  height: 20px;
  padding: 0.5rem;
  background-color: #ededed;
}
```

#### Kết quả

{{EmbedLiveSample("Retrieving a text input's value", "", 100)}}

### Lấy giá trị màu

Ví dụ này minh họa thuộc tính `value` với `<input>` loại {{HTMLElement("input/color", "color")}}.

#### HTML

Chúng ta bao gồm một `<input>` loại `color`:

```html
<label for="color">Chọn một màu:</label>

<input name="color" id="color" type="color" />

<pre id="log"></pre>
```

#### JavaScript

{{domxref("HTMLElement.innerText", "innerText")}} của phần tử `<pre>` được cập nhật với giá trị màu mặc định (`#000000`) và sau đó cập nhật mỗi khi sự kiện {{domxref("HTMLElement/change_event", "change")}} được kích hoạt.

```js
const logElement = document.getElementById("log");
const inputElement = document.getElementById("color");

logElement.innerText = `Màu: ${inputElement.value}`;

inputElement.addEventListener("change", () => {
  logElement.innerText = `Màu: ${inputElement.value}`;
});
```

```css hidden
#log {
  height: 20px;
  padding: 0.5rem;
  background-color: #ededed;
}
```

#### Kết quả

{{EmbedLiveSample("Retrieving a color value", "", 100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{DOMXref("HTMLInputElement.valueAsDate")}}
- {{DOMXref("HTMLInputElement.valueAsNumber")}}
