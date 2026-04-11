---
title: "HTMLSelectElement: thuộc tính value"
short-title: value
slug: Web/API/HTMLSelectElement/value
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.value
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLSelectElement.value`** chứa giá trị của phần tử {{htmlelement("option")}} đầu tiên được chọn, gắn với phần tử {{htmlelement("select")}} này.

Thuộc tính này cũng có thể được đặt trực tiếp, ví dụ để đặt giá trị mặc định dựa trên một điều kiện nào đó.

## Giá trị

Một chuỗi chứa giá trị của phần tử {{htmlelement("option")}} đầu tiên được chọn trong phần tử {{htmlelement("select")}} này, hoặc chuỗi rỗng nếu không có option nào được chọn.

## Ví dụ

### Lấy giá trị đã chọn

```html
<label for="bird-select">Choose a bird:</label>

<select name="birds" id="bird-select">
  <option value="">--Please choose an option--</option>
  <option value="Scarlet ibis">Scarlet ibis</option>
  <option value="Marabou stork">Marabou stork</option>
  <option value="Roseate spoonbill">Roseate spoonbill</option>
</select>

<pre id="log"></pre>
```

```js
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = text;
}

const select = document.querySelector("#bird-select");
select.addEventListener("change", () => {
  log(`Selection: ${select.value}`);
});
```

```css hidden
#log {
  height: 20px;
  padding: 0.5rem;
  border: 1px solid black;
}
```

{{EmbedLiveSample("Retrieving the selected value")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("select")}}, triển khai giao diện này.
