---
title: "HTMLInputElement: thuộc tính disabled"
short-title: disabled
slug: Web/API/HTMLInputElement/disabled
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.disabled
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`HTMLInputElement.disabled`** là một giá trị boolean phản ánh thuộc tính HTML [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/input#disabled), cho biết điều khiển có bị vô hiệu hóa hay không. Nếu bị vô hiệu hóa, nó không chấp nhận nhấp chuột. Một phần tử bị vô hiệu hóa không thể sử dụng và không thể nhấp vào.

## Giá trị

Một giá trị boolean.

## Ví dụ

### HTML

```html
<p>
  <label>
    <input id="check-box" name="b" value="1" type="checkbox" disabled /> Đánh dấu
    vào ô này!
  </label>
</p>
<p>
  <label>
    <input id="toggle-box" name="b" value="2" type="checkbox" /> Kích hoạt
    ô kia.
  </label>
</p>
```

### JavaScript

```js
const checkBox = document.getElementById("check-box");
const toggleBox = document.getElementById("toggle-box");

toggleBox.addEventListener("change", (event) => {
  checkBox.disabled = !event.target.checked;
});
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
