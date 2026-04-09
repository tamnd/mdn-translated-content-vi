---
title: "AnimationEffect: phương thức getComputedTiming()"
short-title: getComputedTiming()
slug: Web/API/AnimationEffect/getComputedTiming
page-type: web-api-instance-method
browser-compat: api.AnimationEffect.getComputedTiming
---

{{ APIRef("Web Animations") }}

Phương thức `getComputedTiming()` của giao diện {{domxref("AnimationEffect")}} trả về các thuộc tính thời gian đã được tính toán cho hiệu ứng hoạt ảnh này.

> [!NOTE]
> Các giá trị này có thể so sánh với kiểu hiển thị đã được tính toán của một phần tử được trả về bằng `window.getComputedStyle(elem)`.

## Cú pháp

```js-nolint
getComputedTiming()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng chứa:

- tất cả các thuộc tính của đối tượng được trả về bởi {{domxref("AnimationEffect.getTiming()")}}, ngoại trừ việc mọi giá trị `"auto"` được thay bằng các giá trị đã tính toán, có thể phụ thuộc vào kiểu của {{domxref("AnimationEffect")}}.
- các thuộc tính bổ sung sau:
  - `endTime`
    - : Một `number` cho biết thời điểm kết thúc của hiệu ứng tính bằng mili giây kể từ thời điểm bắt đầu của hiệu ứng. Giá trị này bằng `activeDuration` cộng với `delay` và `endDelay`.
  - `activeDuration`
    - : Một `number` cho biết tổng thời lượng tính bằng mili giây của tất cả các vòng lặp của hiệu ứng. Giá trị này bằng `duration` nhân với `iterations` (hoặc bằng `0` nếu tích đó là {{jsxref("NaN")}}).
  - `localTime`
    - : Một `number` hoặc `null`.

      Cho biết khoảng thời gian tính bằng mili giây mà hiệu ứng đã chạy. Giá trị này bằng {{domxref("Animation.currentTime","currentTime")}} của hoạt ảnh liên kết, hoặc `null` nếu hiệu ứng không liên kết với một hoạt ảnh.

  - `progress`
    - : `null` hoặc một `number` ít nhất `0` và nhỏ hơn `1`.

      Cho biết tiến độ của hiệu ứng trong vòng lặp hiện tại. Khi bắt đầu `activeDuration`, giá trị này bằng phần thập phân của `iterationStart`.

      Trả về `null` nếu hiệu ứng không ở giữa một vòng lặp, ví dụ vì hiệu ứng đang ở các giai đoạn `delay` hoặc `endDelay`, hiệu ứng đã kết thúc, hoặc `localTime` là `null`.

  - `currentIteration`
    - : `null` hoặc một `number` nguyên.

      Cho biết chỉ số của vòng lặp hiện tại. Khi bắt đầu `activeDuration`, giá trị này bằng phần nguyên của `iterationStart`.

      Trả về `null` bất cứ khi nào `progress` là `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationEffect")}}
- {{domxref("Animation")}}
