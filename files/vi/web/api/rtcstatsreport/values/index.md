---
title: "RTCStatsReport: values() method"
short-title: values()
slug: Web/API/RTCStatsReport/values
page-type: web-api-instance-method
browser-compat: api.RTCStatsReport.values
---

{{APIRef("WebRTC")}}

Phương thức **`values()`** của giao diện {{domxref("RTCStatsReport")}} trả về một đối tượng _[iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới có thể dùng để duyệt qua các giá trị của từng phần tử trong đối tượng `RTCStatsReport`, theo thứ tự chèn.

Các giá trị là [đối tượng dictionary thống kê](/en-US/docs/Web/API/RTCStatsReport#the_statistic_types).

Phương thức này tương tự với {{jsxref("Map.prototype.values()")}}.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

Ví dụ này cho thấy cách duyệt qua một {{domxref("RTCStatsReport")}} bằng iterator do `values()` trả về.

Giả sử có biến `myPeerConnection`, là một thể hiện của `RTCPeerConnection`, mã gọi [`getStats()`](/en-US/docs/Web/API/RTCRtpReceiver/getStats) với `await` để chờ báo cáo thống kê.
Sau đó nó dùng vòng lặp [for...of](/en-US/docs/Web/JavaScript/Reference/Statements/for...of), với iterator do `values()` trả về, để duyệt qua các đối tượng dictionary trong báo cáo.
Các thuộc tính của đối tượng thống kê có `type` là `outbound-rtp` sẽ được ghi ra console (các đối tượng khác bị bỏ qua).

```js
const stats = await myPeerConnection.getStats();

for (const stat of stats.values()) {
  if (stat.type !== "outbound-rtp") continue;
  Object.keys(stat).forEach((statName) => {
    console.log(`${statName}: ${report[statName]}`);
  });
}
```

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.values()")}}
- {{domxref("RTCStatsReport.keys()")}}
- {{domxref("RTCStatsReport.entries()")}}
