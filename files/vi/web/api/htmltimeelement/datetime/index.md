---
title: "HTMLTimeElement: thuộc tính dateTime"
short-title: dateTime
slug: Web/API/HTMLTimeElement/dateTime
page-type: web-api-instance-property
browser-compat: api.HTMLTimeElement.dateTime
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`dateTime`** của giao diện {{domxref("HTMLTimeElement")}} là một chuỗi phản ánh thuộc tính HTML [`datetime`](/en-US/docs/Web/HTML/Reference/Elements/time#datetime), chứa dạng máy đọc được của giá trị ngày và giờ của phần tử.

## Giá trị

Một chuỗi. Để biết các định dạng chuỗi hợp lệ, xem [các giá trị hợp lệ của `datetime`](/en-US/docs/Web/HTML/Reference/Elements/time#valid_datetime_values).

## Ví dụ

```js
// Giả sử có phần tử <time id="t"> trong HTML

const t = document.getElementById("t");
t.dateTime = "6w 5h 34m 5s";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTimeElement")}}
- {{domxref("HTMLModElement.dateTime")}}
- [Chuỗi ngày tháng](/en-US/docs/Web/HTML/Guides/Date_and_time_formats#date_strings)
- [Chuỗi ngày giờ cục bộ](/en-US/docs/Web/HTML/Guides/Date_and_time_formats#local_date_and_time_strings)
