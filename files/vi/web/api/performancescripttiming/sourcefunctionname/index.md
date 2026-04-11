---
title: "PerformanceScriptTiming: sourceFunctionName property"
short-title: sourceFunctionName
slug: Web/API/PerformanceScriptTiming/sourceFunctionName
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.sourceFunctionName
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`sourceFunctionName`** của giao diện {{domxref("PerformanceScriptTiming")}} trả về một chuỗi đại diện cho tên của hàm góp phần vào khung hoạt hình dài (LoAF).

Điều quan trọng cần lưu ý là tên hàm được báo cáo sẽ là "điểm vào" của tập lệnh, tức là cấp cao nhất của ngăn xếp, không phải bất kỳ hàm con nào chậm cụ thể.

Ví dụ, nếu một trình xử lý sự kiện gọi một hàm cấp cao nhất, hàm này sau đó gọi một hàm con chậm, các trường `source*` sẽ báo cáo tên và vị trí của hàm cấp cao nhất, không phải hàm con chậm. Đây là vì lý do hiệu suất; một stack trace đầy đủ rất tốn kém.

Trong đoạn mã sau:

```js
setTimeout(function libFunc() {
  slowFunction();
});
```

`sourceFunctionName` sẽ báo cáo `libFunc`, không phải `slowFunction`.

## Giá trị

Một chuỗi. Trả về một chuỗi rỗng nếu không tìm thấy tên hàm.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceLongAnimationFrameTiming")}}
