---
title: "RTCStatsReport: get() method"
short-title: get()
slug: Web/API/RTCStatsReport/get
page-type: web-api-instance-method
browser-compat: api.RTCStatsReport.get
---

{{APIRef("WebRTC")}}

Phương thức **`get()`** của giao diện {{domxref("RTCStatsReport")}} trả về một phần tử được chỉ định từ `RTCStatsReport`.

Các phần tử trong `RTCStatsReport` được xác định bằng các giá trị `id` duy nhất, đại diện cho các đối tượng thống kê được giám sát mà từ đó thống kê được suy ra.
Phần tử được trả về sẽ là một thể hiện của một trong các [đối tượng dictionary thống kê](/en-US/docs/Web/API/RTCStatsReport#the_statistic_types), và nó sẽ chứa thống kê cho đối tượng có `id` đã cho.
Giá trị được lấy là một tham chiếu tới dictionary thống kê, và mọi thay đổi được thực hiện trên đối tượng đó sẽ thực tế sửa đổi nó bên trong đối tượng `RTCStatsReport`.

Phương thức này tương tự với {{jsxref("Map.prototype.get()")}}.

## Cú pháp

```js-nolint
get(id)
```

### Tham số

- `id`
  - : Một chuỗi chỉ định ID của phần tử cần trả về từ đối tượng `RTCStatsReport`.
    ID là các chuỗi duy nhất xác định đối tượng được giám sát mà từ đó thống kê tương ứng được suy ra.

### Giá trị trả về

Phần tử gắn với khóa `id` đã chỉ định, hoặc {{jsxref("undefined")}} nếu không tìm thấy khóa đó trong đối tượng `Map`.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.get()")}}
