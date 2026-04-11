---
title: "RTCStatsReport: keys() method"
short-title: keys()
slug: Web/API/RTCStatsReport/keys
page-type: web-api-instance-method
browser-compat: api.RTCStatsReport.keys
---

{{APIRef("WebRTC")}}

Phương thức **`keys()`** của giao diện {{domxref("RTCStatsReport")}} trả về một đối tượng _[iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới có thể dùng để duyệt qua các khóa của từng phần tử trong đối tượng `RTCStatsReport`, theo thứ tự chèn.

Các khóa trong `RTCStatsReport` là các giá trị chuỗi `id` duy nhất, đại diện cho các đối tượng thống kê được giám sát mà từ đó thống kê được suy ra.

Phương thức này tương tự với {{jsxref("Map.prototype.keys()")}}.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Ví dụ

Ví dụ này cho thấy cách duyệt qua một {{domxref("RTCStatsReport")}} bằng iterator do `keys()` trả về.

Giả sử có biến `myPeerConnection`, là một thể hiện của `RTCPeerConnection`, mã gọi [`getStats()`](/en-US/docs/Web/API/RTCRtpReceiver/getStats) với `await` để chờ báo cáo thống kê.
Sau đó nó dùng vòng lặp [for...of](/en-US/docs/Web/JavaScript/Reference/Statements/for...of), với iterator do `keys()` trả về, để duyệt qua các ID.
Mỗi ID được dùng để lấy dictionary thống kê tương ứng.
Các thuộc tính của đối tượng thống kê có `type` là `outbound-rtp` sẽ được ghi ra console (các đối tượng khác bị bỏ qua).

```js
const stats = await myPeerConnection.getStats();

for (const id of stats.keys()) {
  // Lấy dictionary liên kết với khóa (id)
  const stat = stats.get(id);
  if (stat.type !== "outbound-rtp") continue;
  Object.keys(stat).forEach((statName) => {
    console.log(`${statName}: ${report[statName]}`);
  });
}
```

Lưu ý rằng ví dụ này khá gượng ép.
Bạn có thể duyệt dễ hơn bằng {{domxref("RTCStatsReport.entries()","entries()")}} hoặc {{domxref("RTCStatsReport.values()","values()")}} mà không cần ánh xạ ID sang giá trị.
Bạn thậm chí có thể duyệt trực tiếp {{domxref("RTCStatsReport")}} vì nó có phương thức [`[Symbol.iterator]()`](/en-US/docs/Web/API/RTCStatsReport/Symbol.iterator)!

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.keys()")}}
- {{domxref("RTCStatsReport.values()")}}
- {{domxref("RTCStatsReport.entries()")}}
