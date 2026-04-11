---
title: "HTMLSelectElement: thuộc tính disabled"
short-title: disabled
slug: Web/API/HTMLSelectElement/disabled
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.disabled
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLSelectElement.disabled`** là một giá trị boolean phản ánh thuộc tính HTML [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/select#disabled), cho biết điều khiển có bị vô hiệu hóa hay không. Nếu bị vô hiệu hóa, nó không nhận lần nhấp. Một phần tử bị vô hiệu hóa là không thể sử dụng và không thể nhấp.

## Giá trị

Một giá trị boolean.

## Ví dụ

### HTML

```html
<label>
  Allow drinks?
  <input id="allow-drinks" type="checkbox" />
</label>

<label for="drink-select">Drink selection:</label>
<select id="drink-select" disabled>
  <option value="1">Water</option>
  <option value="2">Beer</option>
  <option value="3">Pepsi</option>
  <option value="4">Whisky</option>
</select>
```

### JavaScript

```js
const allowDrinksCheckbox = document.getElementById("allow-drinks");
const drinkSelect = document.getElementById("drink-select");

allowDrinksCheckbox.addEventListener("change", (event) => {
  drinkSelect.disabled = !event.target.checked;
});
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
