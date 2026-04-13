---
title: "RTCStatsReport: has() method"
short-title: has()
slug: Web/API/RTCStatsReport/has
page-type: web-api-instance-method
browser-compat: api.RTCStatsReport.has
---

{{APIRef("WebRTC")}}

Phương thức **`has()`** của giao diện {{domxref("RTCStatsReport")}} trả về một giá trị boolean cho biết báo cáo có chứa một từ điển thống kê với `id` được chỉ định hay không.

Phương thức này tương tự với {{jsxref("Map.prototype.has()")}}.

## Cú pháp

```js-nolint
has(id)
```

### Tham số

- `id`
  - : Một chuỗi chứa ID của đối tượng thống kê có thể có trong `RTCStatsReport` này.

### Giá trị trả về

`true` nếu một phần tử với `id` đã chỉ định tồn tại trong đối tượng `RTCStatsReport`; ngược lại là `false`.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
- {{jsxref("Map.prototype.set()")}}
- {{jsxref("Map.prototype.get()")}}
