---
title: "VTTCue: VTTCue() constructor"
short-title: VTTCue()
slug: Web/API/VTTCue/VTTCue
page-type: web-api-constructor
browser-compat: api.VTTCue.VTTCue
---

{{APIRef("WebVTT")}}

Hàm khởi tạo **`VTTCue()`** tạo và trả về một đối tượng {{domxref("VTTCue")}} mới.

## Cú pháp

```js-nolint
new VTTCue(startTime, endTime, text)
```

### Tham số

- `startTime`
  - : Một `double` đại diện cho thời điểm bắt đầu của cue track văn bản. Đây là thời gian, tính bằng giây và phần nhỏ của giây, đánh dấu điểm bắt đầu của đoạn dữ liệu phương tiện mà cue này áp dụng. Ví dụ, nếu một cue cần hiển thị từ giây 50 đến một phút năm rưỡi giây, thì `startTime` sẽ là 50.0.
- `endTime`
  - : Một `double` đại diện cho thời điểm kết thúc của cue track văn bản. Đây là thời gian mà cue ngừng hiển thị với người dùng, tính bằng giây và phần nhỏ. Theo ví dụ trên, giá trị `endTime` sẽ là 65.5.
- `text`
  - : Một chuỗi cung cấp văn bản sẽ được hiển thị trong khoảng thời gian từ `startTime` đến `endTime`.

### Giá trị trả về

Một đối tượng {{domxref("VTTCue")}} mới đại diện cho một cue sẽ được hiển thị trong khoảng thời gian đã cho.

## Ví dụ

```js
// Tạo một cue hiển thị từ giây 2 đến 3 với văn bản đã cho.
let cue = new VTTCue(2, 3, "Cool text to be displayed");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
