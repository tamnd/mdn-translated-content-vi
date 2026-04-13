---
title: "HTMLMeterElement: thuộc tính min"
short-title: min
slug: Web/API/HTMLMeterElement/min
page-type: web-api-instance-property
browser-compat: api.HTMLMeterElement.min
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`min`** của giao diện {{DOMxRef("HTMLMeterElement")}} đại diện cho giá trị tối thiểu của phần tử {{htmlelement("meter")}} dưới dạng một số dấu phẩy động. Thuộc tính này phản ánh thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/meter#min) của phần tử, hoặc `0` nếu không xác định `min`.

Thuộc tính này cũng có thể được thiết lập trực tiếp, ví dụ để đặt giá trị mặc định dựa trên một điều kiện nào đó.

## Giá trị

Một số.

## Ví dụ

```html
<label for="fuel">Mức nhiên liệu hiện tại:</label>
<meter
  id="fuel"
  min="0"
  max="100"
  low="15"
  high="66"
  optimum="80"
  value="50"></meter>
```

```js
const meterElement = document.getElementById("fuel");
console.log(meterElement.min); // 0
++meterElement.min;
console.log(meterElement.min); // 1
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{HTMLElement("meter")}}
- {{DOMXref("HTMLMeterElement.value")}}
- {{DOMXref("HTMLMeterElement.max")}}
- {{DOMXref("HTMLProgressElement")}}
