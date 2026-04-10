---
title: "HTMLInputElement: thuộc tính step"
short-title: step
slug: Web/API/HTMLInputElement/step
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.step
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`step`** của giao diện {{domxref("HTMLInputElement")}} cho biết bước mà các phần tử {{HTMLElement("input")}} số hoặc ngày-giờ có thể thay đổi. Nó phản ánh thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) của phần tử. Các giá trị hợp lệ bao gồm chuỗi `"any"` hoặc một chuỗi chứa số dấu phẩy động dương. Nếu thuộc tính không được đặt rõ ràng, thuộc tính `step` là một chuỗi rỗng.

## Giá trị

Một chuỗi đại diện cho giá trị `step` của phần tử hoặc chuỗi rỗng nếu không đặt step rõ ràng.

## Ví dụ

```js
const inputElement = document.querySelector('[type="number"]');
console.log(inputElement.step); // giá trị hiện tại của thuộc tính step
inputElement.step = 0.1; // đặt giá trị step thành "0.1"
inputElement.step = "any"; // đặt step thành "any"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}} loại {{HTMLElement("input/range", "range")}}, {{HTMLElement("input/number", "number")}}, {{HTMLElement("input/date", "date")}}, {{HTMLElement("input/month", "month")}}, {{HTMLElement("input/week", "week")}}, và {{HTMLElement("input/time", "time")}}
- {{domxref("HTMLInputElement.value")}}
- {{domxref("HTMLInputElement.type")}}
