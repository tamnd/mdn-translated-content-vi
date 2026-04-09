---
title: "AnimationEffect: phương thức getTiming()"
short-title: getTiming()
slug: Web/API/AnimationEffect/getTiming
page-type: web-api-instance-method
browser-compat: api.AnimationEffect.getTiming
---

{{ APIRef("Web Animations") }}

Phương thức `AnimationEffect.getTiming()` của giao diện {{domxref("AnimationEffect")}} trả về một đối tượng chứa các thuộc tính thời gian cho Animation Effect.

> [!NOTE]
> Một số thuộc tính thời gian được trả về bởi `getTiming()` có thể mang giá trị giữ chỗ `"auto"`. Để lấy các giá trị đã được phân giải dùng cho tính toán thời gian, hãy dùng {{domxref("AnimationEffect.getComputedTiming()")}}.
>
> Trong tương lai, `"auto"` hoặc các giá trị tương tự có thể sẽ được thêm vào kiểu của nhiều thuộc tính thời gian hơn, và các kiểu mới của {{domxref("AnimationEffect")}} có thể phân giải `"auto"` thành các giá trị khác nhau.

## Cú pháp

```js-nolint
getTiming()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng chứa các thuộc tính sau:

- `delay`
  - : Số `number` mili giây trì hoãn trước khi hiệu ứng bắt đầu.

    (Xem thêm {{cssxref("animation-delay")}}.)

- `direction`
  - : `"normal"`, `"reverse"`, `"alternate"`, hoặc `"alternate-reverse"`.

    Cho biết hiệu ứng chạy tiến (`"normal"`), lùi (`"reverse"`), đổi hướng sau mỗi vòng lặp (`"alternate"`), hoặc chạy lùi và đổi hướng sau mỗi vòng lặp (`"alternate-reverse"`).

    (Xem thêm {{cssxref("animation-direction")}}.)

- `duration`
  - : Một `number` mili giây hoặc chuỗi `string` `"auto"`.

    Cho biết thời gian một vòng lặp của hoạt ảnh cần để hoàn tất.

    Ý nghĩa của `"auto"` có thể khác nhau tùy theo kiểu hiệu ứng; với {{domxref("KeyframeEffect")}}, `"auto"` giống `0`.

    (Xem thêm {{cssxref("animation-duration")}}.)

- `easing`
  - : Một `string` biểu diễn một {{cssxref("easing-function")}} mô tả tốc độ thay đổi của hiệu ứng theo thời gian.

    (Xem thêm {{cssxref("animation-timing-function")}}.)

- `endDelay`
  - : Số `number` mili giây trì hoãn sau khi hiệu ứng kết thúc.

    Điều này chủ yếu hữu ích khi xâu chuỗi các hoạt ảnh dựa trên thời điểm kết thúc của một hoạt ảnh khác.

- `fill`
  - : `"none"`, `"forwards"`, `"backwards"`, `"both"`, hoặc `"auto"`.

    Cho biết hiệu ứng được phản ánh bởi mục tiêu của nó trước khi phát (`"backwards"`), được giữ lại sau khi hiệu ứng hoàn tất (`"forwards"`), `"both"`, hay không bên nào (`"none"`).

    Ý nghĩa của `"auto"` có thể khác nhau tùy theo kiểu hiệu ứng; với {{domxref("KeyframeEffect")}}, `"auto"` giống `"none"`.

    (Xem thêm {{cssxref("animation-fill-mode")}}.)

- `iterations`
  - : Số lần hiệu ứng sẽ lặp lại. Giá trị {{jsxref("Infinity")}} cho biết hiệu ứng lặp vô hạn.

    (Xem thêm {{cssxref("animation-iteration-count")}}.)

- `iterationStart`
  - : Một `number` cho biết hiệu ứng bắt đầu ở điểm nào trong vòng lặp. Ví dụ, một hiệu ứng có `iterationStart` là `0.5` và `2` `iterations` sẽ bắt đầu ở giữa vòng lặp đầu tiên và kết thúc ở giữa vòng lặp thứ ba.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationEffect")}}
