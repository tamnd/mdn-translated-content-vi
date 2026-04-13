---
title: "HTMLMeterElement: thuộc tính optimum"
short-title: optimum
slug: Web/API/HTMLMeterElement/optimum
page-type: web-api-instance-property
browser-compat: api.HTMLMeterElement.optimum
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`optimum`** của giao diện {{DOMxRef("HTMLMeterElement")}} đại diện cho ranh giới tối ưu của phần tử {{htmlelement("meter")}} dưới dạng một số dấu phẩy động. Thuộc tính này phản ánh thuộc tính [`optimum`](/en-US/docs/Web/HTML/Reference/Elements/meter#optimum) của phần tử, hoặc điểm giữa của các giá trị `min` và `max` nếu không xác định. Giá trị của `optimum` bị giới hạn bởi các giá trị `min` và `max`.

Thuộc tính này cũng có thể được thiết lập trực tiếp, ví dụ để đặt giá trị mặc định dựa trên một điều kiện nào đó.

## Giá trị

Một số. Mặc định là điểm giữa của {{DOMxRef("HTMLMeterElement.min")}} và {{DOMxRef("HTMLMeterElement.max")}} nếu không được xác định.

## Ví dụ

Trong ví dụ này, không có giá trị `optimum` nào được thiết lập.

```html
<label for="review">Đánh giá sao:</label>
<meter id="review" min="0" max="10" low="2" high="8" value="9"></meter>
```

Mặc dù không được xác định rõ ràng, giá trị `optimum` mặc định là điểm giữa của `min` và `max`, nhưng có thể đặt thành bất kỳ giá trị nào giữa `min` và `max`, bao gồm cả hai đầu mút.

```js
const meterElement = document.getElementById("fuel");
console.log(meterElement.optimum); // 5
meterElement.optimum = (meterElement.max + meterElement.optimum) / 2;
console.log(meterElement.optimum); // 7.5
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{HTMLElement("meter")}}
- {{DOMXref("HTMLMeterElement.value")}}
- {{DOMXref("HTMLMeterElement.high")}}
- {{DOMXref("HTMLMeterElement.low")}}
- {{DOMXref("HTMLProgressElement")}}
