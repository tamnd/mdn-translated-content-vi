---
title: "HTMLMeterElement: thuộc tính max"
short-title: max
slug: Web/API/HTMLMeterElement/max
page-type: web-api-instance-property
browser-compat: api.HTMLMeterElement.max
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`max`** của giao diện {{DOMxRef("HTMLMeterElement")}} đại diện cho giá trị tối đa của phần tử {{htmlelement("meter")}} dưới dạng một số dấu phẩy động. Thuộc tính này phản ánh thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/meter#max) của phần tử, hoặc giá trị `min` nếu không thiết lập `max`, hoặc `1` nếu cả `min` và `max` đều không được xác định.

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
console.log(meterElement.max); // 100
--meterElement.max;
console.log(meterElement.max); // 99
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{HTMLElement("meter")}}
- {{DOMXref("HTMLMeterElement.value")}}
- {{DOMXref("HTMLMeterElement.min")}}
- {{DOMXref("HTMLProgressElement")}}
