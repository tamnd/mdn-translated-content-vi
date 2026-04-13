---
title: "HTMLInputElement: thuộc tính max"
short-title: max
slug: Web/API/HTMLInputElement/max
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.max
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`max`** của giao diện {{domxref("HTMLInputElement")}} phản ánh thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) của phần tử {{HTMLElement("input")}}, thường định nghĩa giá trị hợp lệ tối đa cho đầu vào số hoặc ngày-giờ. Nếu thuộc tính không được đặt rõ ràng, thuộc tính `max` là một chuỗi rỗng.

## Giá trị

Một chuỗi đại diện cho giá trị `max` của phần tử hoặc chuỗi rỗng nếu không đặt `max` rõ ràng.

## Ví dụ

```js
const inputElement = document.querySelector("#time");
console.log(inputElement.max); // giá trị hiện tại của thuộc tính max
inputElement.max = "18:00:00"; // đặt giá trị max thành 6 giờ tối
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}} loại {{HTMLElement("input/range", "range")}}, {{HTMLElement("input/number", "number")}}, {{HTMLElement("input/date", "date")}}, {{HTMLElement("input/month", "month")}}, {{HTMLElement("input/week", "week")}}, và {{HTMLElement("input/time", "time")}}
- {{domxref("HTMLInputElement.min")}}
- {{domxref("HTMLInputElement.value")}}
- {{domxref("HTMLInputElement.type")}}
