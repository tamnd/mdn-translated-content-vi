---
title: "RadioNodeList: thuộc tính value"
short-title: value
slug: Web/API/RadioNodeList/value
page-type: web-api-instance-property
browser-compat: api.RadioNodeList.value
---

{{ APIRef("HTML DOM") }}

Nếu tập hợp phần tử bên dưới chứa các nút radio, thuộc tính **`RadioNodeList.value`** đại diện cho nút radio được chọn. Khi lấy thuộc tính `value`, giá trị `value` của nút radio hiện đang được `checked` được trả về dưới dạng chuỗi. Nếu tập hợp không chứa bất kỳ nút radio nào hoặc không có nút radio nào trong tập hợp ở trạng thái `checked`, chuỗi rỗng được trả về. Khi đặt thuộc tính `value`, nút radio input đầu tiên có thuộc tính `value` bằng giá trị mới sẽ được đặt thành `checked`.

## Ví dụ

### HTML

```html
<form>
  <label><input type="radio" name="color" value="blue" />Blue</label>
  <label><input type="radio" name="color" value="red" />Red</label>
</form>
```

### JavaScript

```js
// Get the form
const form = document.forms[0];

// Get the form's radio buttons
const radios = form.elements["color"];

// Choose the "red" option
radios.value = "red";
```

### Kết quả

{{EmbedLiveSample("Example")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử {{HTMLElement("form")}}, {{HTMLElement("fieldset")}}, {{HTMLElement("input")}}.
