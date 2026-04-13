---
title: "RTCStatsReport: [Symbol.iterator]() method"
short-title: "[Symbol.iterator]"
slug: Web/API/RTCStatsReport/Symbol.iterator
page-type: web-api-instance-method
browser-compat: api.RTCStatsReport.@@iterator
---

{{APIRef("WebRTC")}}

Phương thức **`[Symbol.iterator]()`** của giao diện {{domxref("RTCStatsReport")}} triển khai [iterable protocol](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) và cho phép báo cáo thống kê được dùng bởi hầu hết cú pháp mong đợi iterable, như [spread syntax](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và vòng lặp {{jsxref("Statements/for...of", "for...of")}}.
Nó trả về một [đối tượng iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) tạo ra các cặp key-value của báo cáo theo thứ tự chèn.

Giá trị ban đầu của thuộc tính này giống với giá trị ban đầu của phương thức {{domxref("RTCStatsReport.entries()")}}.

Phương thức này tương tự với [`Map.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator).

## Cú pháp

```js-nolint
RTCStatsReport[Symbol.iterator]()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị trả về giống với {{domxref("RTCStatsReport.entries()")}}.
Đây là một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới, tạo ra các cặp key-value (`id`-"statistics dictionary") của báo cáo.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCStatsReport.entries()")}}
- [`Map.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator)
