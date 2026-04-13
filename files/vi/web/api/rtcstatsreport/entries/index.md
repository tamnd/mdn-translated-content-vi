---
title: "RTCStatsReport: entries() method"
short-title: entries()
slug: Web/API/RTCStatsReport/entries
page-type: web-api-instance-method
browser-compat: api.RTCStatsReport.entries
---

{{APIRef("WebRTC")}}

Phương thức **`entries()`** của giao diện {{domxref("RTCStatsReport")}} trả về một đối tượng [iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới có thể dùng để duyệt qua các cặp key/value của từng phần tử trong đối tượng `RTCStatsReport`, theo thứ tự chèn.

Các khóa là các giá trị `id` duy nhất của các đối tượng thống kê được giám sát mà từ đó thống kê được suy ra, và các giá trị đi kèm là [đối tượng dictionary thống kê](/en-US/docs/Web/API/RTCStatsReport#the_statistic_types).

Phương thức này tương tự với {{jsxref("Map.prototype.entries()")}}.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

Ví dụ này cho thấy cách duyệt qua một {{domxref("RTCStatsReport")}} bằng iterator do `entries()` trả về.

Giả sử có biến `myPeerConnection`, là một thể hiện của `RTCPeerConnection`, mã gọi [`getStats()`](/en-US/docs/Web/API/RTCRtpReceiver/getStats) với `await` để chờ báo cáo thống kê.
Sau đó nó dùng vòng lặp [for...of](/en-US/docs/Web/JavaScript/Reference/Statements/for...of), với iterator do `entries()` trả về, để duyệt qua các mục nhập.
Các thuộc tính của đối tượng thống kê có `type` là `outbound-rtp` sẽ được ghi ra console (các đối tượng khác bị bỏ qua).

```js
const stats = await myPeerConnection.getStats();

for (const stat of stats.entries()) {
  if (stat.type !== "outbound-rtp") continue;
  Object.keys(stat).forEach((statName) => {
    console.log(`${statName}: ${report[statName]}`);
  });
}
```

## Tiêu chuẩn

{{Specifications}} <!-- https://webidl.spec.whatwg.org/#dfn-maplike -->

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.entries()")}}
- {{domxref("RTCStatsReport.values()")}}
- {{domxref("RTCStatsReport.keys()")}}
