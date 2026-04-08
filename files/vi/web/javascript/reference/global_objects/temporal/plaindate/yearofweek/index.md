---
title: Temporal.PlainDate.prototype.yearOfWeek
short-title: yearOfWeek
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/yearOfWeek
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.yearOfWeek
sidebar: jsref
---

Thuộc tính accessor **`yearOfWeek`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên đại diện cho năm được ghép cặp với {{jsxref("Temporal/PlainDate/weekOfYear", "weekOfYear")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được xác định rõ ràng. Thuộc tính này phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Thông thường đây là năm của ngày đó, nhưng đối với ISO 8601, một vài ngày đầu và cuối năm có thể được tính vào tuần cuối cùng của năm trước hoặc tuần đầu tiên của năm tiếp theo, khiến `yearOfWeek` có thể chênh lệch 1. Xem {{jsxref("Temporal/PlainDate/weekOfYear", "weekOfYear")}} để biết thêm chi tiết.

Set accessor của `yearOfWeek` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Xem các ví dụ trong trang {{jsxref("Temporal/PlainDate/weekOfYear", "weekOfYear")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/with", "Temporal.PlainDate.prototype.with()")}}
- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}
- {{jsxref("Temporal/PlainDate/weekOfYear", "Temporal.PlainDate.prototype.weekOfYear")}}
- {{jsxref("Temporal/PlainDate/dayOfWeek", "Temporal.PlainDate.prototype.dayOfWeek")}}
- {{jsxref("Temporal/PlainDate/daysInWeek", "Temporal.PlainDate.prototype.daysInWeek")}}
- {{jsxref("Temporal/PlainDate/daysInYear", "Temporal.PlainDate.prototype.daysInYear")}}
