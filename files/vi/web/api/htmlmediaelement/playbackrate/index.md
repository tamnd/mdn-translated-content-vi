---
title: "HTMLMediaElement: thuộc tính playbackRate"
short-title: playbackRate
slug: Web/API/HTMLMediaElement/playbackRate
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.playbackRate
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.playbackRate`** đặt tốc độ phát lại phương tiện. Điều này được sử dụng để triển khai các điều khiển của người dùng để chuyển tiếp nhanh, chuyển động chậm, v.v. Tốc độ phát lại bình thường được nhân với giá trị này để có được tốc độ hiện tại, do đó giá trị 1,0 biểu thị tốc độ bình thường.

Giá trị `playbackRate` âm cho biết phương tiện nên được phát ngược lại, nhưng sự hỗ trợ cho điều này vẫn chưa phổ biến. (Xem [browser compatibility](#browser_compatibility) để biết chi tiết.)

Âm thanh bị tắt khi chuyển động nhanh hoặc chuyển động chậm nằm ngoài phạm vi hữu ích (ví dụ: Gecko tắt âm thanh ngoài phạm vi `0.25` đến `4.0`).

Cao độ của âm thanh được sửa theo mặc định. Bạn có thể tắt tính năng sửa cao độ bằng thuộc tính {{domxref("HTMLMediaElement.preservesPitch")}}.

## Giá trị

Một [`double`](https://en.wikipedia.org/wiki/Double-precision_floating-point_format). `1.0` là "tốc độ bình thường", các giá trị thấp hơn `1.0` làm cho phương tiện phát chậm hơn bình thường, giá trị cao hơn làm cho phương tiện phát nhanh hơn. (**Mặc định:** `1.0`)

## Ví dụ

```js
const obj = document.createElement("video");
console.log(obj.playbackRate); // Expected Output: 1
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.playbackRate`
- Báo cáo lỗi trình duyệt để hỗ trợ phủ định `playbackRate` trong [Firefox](https://bugzil.la/1468019) và [Blink](https://crbug.com/40410591) (Chrome, v.v.)
- Nhóm làm việc về công nghệ ứng dụng siêu văn bản Web (WHATWG) [issue to require support for negative `playbackRate`](https://github.com/whatwg/html/issues/3754)
