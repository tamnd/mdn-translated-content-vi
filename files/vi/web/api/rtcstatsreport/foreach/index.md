---
title: "RTCStatsReport: forEach() method"
short-title: forEach()
slug: Web/API/RTCStatsReport/forEach
page-type: web-api-instance-method
browser-compat: api.RTCStatsReport.forEach
---

{{APIRef("WebRTC")}}

Phương thức **`forEach()`** của giao diện {{domxref("RTCStatsReport")}} thực thi một hàm được cung cấp một lần cho mỗi cặp key/value trong đối tượng `RTCStatsReport`, theo thứ tự chèn.

Các khóa là các giá trị `id` duy nhất của các đối tượng thống kê được giám sát mà từ đó thống kê được suy ra, và các giá trị đi kèm là [đối tượng dictionary thống kê](/en-US/docs/Web/API/RTCStatsReport#the_statistic_types).

Phương thức này tương tự với {{jsxref("Map.prototype.forEach()")}}.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Một hàm được thực thi cho mỗi mục trong báo cáo.
    Hàm được gọi với các đối số sau:
    - `report`
      - : Báo cáo thống kê cho mỗi lần lặp.
        Đây có thể là bất kỳ [kiểu dictionary thống kê](/en-US/docs/Web/API/RTCStatsReport#the_statistic_types) nào.
    - `id`
      - : Một chuỗi duy nhất xác định đối tượng được giám sát mà từ đó thống kê được suy ra.
    - `map`
      - : Báo cáo đang được duyệt.

- `thisArg` {{optional_inline}}
  - : Một giá trị dùng làm `this` khi thực thi `callbackFn`.

### Giá trị trả về

{{jsxref("undefined")}}.

## Ví dụ

Giả sử có biến `myPeerConnection`, là một thể hiện của `RTCPeerConnection`, mã gọi [`getStats()`](/en-US/docs/Web/API/RTCRtpReceiver/getStats) với `await` để chờ báo cáo thống kê.
Sau đó nó duyệt báo cáo bằng `RTCStatsReport.forEach()`, và lọc các dictionary chỉ còn những báo cáo có `type` là `inbound-rtp` và `kind` là `video`.
Với các dictionary khớp, nó ghi thuộc tính `framesPerSecond` của video đầu vào.

```js
const stats = await myPeerConnection.getStats();

stats.forEach((report) => {
  if (report.type === "inbound-rtp" && report.kind === "video") {
    // Ghi log tốc độ khung hình
    console.log(report.framesPerSecond);
  }
});
```

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.forEach()")}}
