---
title: "HTMLInputElement: thuộc tính min"
short-title: min
slug: Web/API/HTMLInputElement/min
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.min
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`min`** của giao diện {{domxref("HTMLInputElement")}} phản ánh thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) của phần tử {{HTMLElement("input")}}, thường định nghĩa giá trị hợp lệ tối thiểu cho đầu vào số hoặc ngày-giờ. Nếu thuộc tính không được đặt rõ ràng, thuộc tính `min` là một chuỗi rỗng.

## Giá trị

Một chuỗi đại diện cho giá trị `min` của phần tử hoặc chuỗi rỗng nếu không đặt `min` rõ ràng.

## Ví dụ

```js
const inputElement = document.querySelector("#range");
console.log(inputElement.min); // giá trị hiện tại của thuộc tính min
inputElement.min = 0; // đặt giá trị min thành "0"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}} loại {{HTMLElement("input/range", "range")}}, {{HTMLElement("input/number", "number")}}, {{HTMLElement("input/date", "date")}}, {{HTMLElement("input/month", "month")}}, {{HTMLElement("input/week", "week")}}, và {{HTMLElement("input/time", "time")}}
- {{domxref("HTMLInputElement.max")}}
- {{domxref("HTMLInputElement.value")}}
- {{domxref("HTMLInputElement.type")}}
