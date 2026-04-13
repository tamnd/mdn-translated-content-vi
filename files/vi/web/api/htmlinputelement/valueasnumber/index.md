---
title: "HTMLInputElement: thuộc tính valueAsNumber"
short-title: valueAsNumber
slug: Web/API/HTMLInputElement/valueAsNumber
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.valueAsNumber
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`valueAsNumber`** của giao diện {{DOMxRef("HTMLInputElement")}} đại diện cho giá trị hiện tại của phần tử {{htmlelement("input")}} dưới dạng số hoặc `NaN` nếu chuyển đổi thành giá trị số không khả thi.

Thuộc tính này cũng có thể được đặt trực tiếp, ví dụ: để đặt giá trị số mặc định dựa trên một điều kiện nào đó.

## Giá trị

Một số đại diện cho giá trị của phần tử hoặc `NaN` nếu chuyển đổi số là không thể.

## Ví dụ

### Lấy giá trị số

Trong ví dụ này, nhật ký hiển thị giá trị hiện tại của đầu vào {{HTMLElement("input/number", "number")}} khi thay đổi.

#### HTML

Chúng ta bao gồm một {{htmlelement("input")}} loại `number` và một {{htmlelement("label")}} liên kết, với vùng chứa {{htmlelement("pre")}} cho đầu ra.

```html
<label for="number">Chọn một số từ 1 đến 10:</label>

<input name="number" id="number" min="1" max="10" type="number" />

<pre id="log"></pre>
```

#### JavaScript

{{domxref("HTMLElement.innerText", "innerText")}} của phần tử `<pre>` được cập nhật thành giá trị hiện tại của `<input>` mỗi khi sự kiện {{domxref("HTMLElement/change_event", "change")}} được kích hoạt.

```js
const logElement = document.getElementById("log");
const inputElement = document.getElementById("number");

inputElement.addEventListener("change", () => {
  logElement.innerText = `Số: ${inputElement.valueAsNumber}`;
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

{{EmbedLiveSample("Retrieving a number value", "", 100)}}

Nếu bạn xóa số trong widget, kết quả là `NaN`.

### Lấy giá trị ngày dưới dạng số

Ví dụ này minh họa thuộc tính `valueAsNumber` của `<input>` loại {{HTMLElement("input/datetime-local", "datetime-local")}}.

#### HTML

Chúng ta bao gồm một `<input>` loại `datetime-local`:

```html
<label for="date">Chọn ngày và giờ:</label>

<input name="date" id="date" type="datetime-local" />

<pre id="log"></pre>
```

#### JavaScript

Khi không có ngày hoặc giờ được chọn, chuỗi rỗng giải quyết thành `NaN`. Mỗi khi một lựa chọn được thực hiện, sự kiện {{domxref("HTMLElement/change_event", "change")}} được kích hoạt, cập nhật nội dung `<pre>` hiển thị {{DOMXref("HTMLInputElement.value")}} của điều khiển biểu mẫu so với giá trị đó dưới dạng số.

```js
const logElement = document.getElementById("log");
const inputElement = document.getElementById("date");

logElement.innerText = `Giá trị ban đầu: ${inputElement.valueAsNumber}`;

inputElement.addEventListener("change", () => {
  const d = new Date(inputElement.valueAsNumber);
  logElement.innerText = `${inputElement.value} giải quyết thành ${inputElement.valueAsNumber}, \nđó là ${d.toDateString()} lúc ${d.toTimeString()}`;
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

{{EmbedLiveSample("Retrieving a date value as a number", "", 100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{DOMXref("HTMLInputElement.value")}}
- {{DOMXref("HTMLInputElement.valueAsDate")}}
