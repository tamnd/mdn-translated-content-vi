---
title: Keyframe Formats
slug: Web/API/Web_Animations_API/Keyframe_Formats
page-type: guide
---

{{DefaultAPISidebar("Web Animations")}}

{{domxref("Element.animate()")}}, {{domxref("KeyframeEffect.KeyframeEffect", "KeyframeEffect()")}}, và {{domxref("KeyframeEffect.setKeyframes()")}} đều chấp nhận các đối tượng được định dạng để biểu diễn một tập keyframes. Có nhiều cách để dùng định dạng này, được giải thích bên dưới.

## Cú pháp

Có hai cách khác nhau để định dạng keyframes:

1. Một `array` các đối tượng (keyframes) gồm các thuộc tính và giá trị để lặp qua. Đây là định dạng chuẩn được phương thức {{domxref("KeyframeEffect.getKeyframes()", "getKeyframes()")}} trả về.

   ```js
   element.animate(
     [
       {
         // from
         opacity: 0,
         color: "white",
       },
       {
         // to
         opacity: 1,
         color: "black",
       },
     ],
     2000,
   );
   ```

   Có thể chỉ định offset cho từng keyframe bằng cách cung cấp giá trị `offset`.

   ```js
   element.animate(
     [{ opacity: 1 }, { opacity: 0.1, offset: 0.7 }, { opacity: 0 }],
     2000,
   );
   ```

   > [!NOTE]
   > Giá trị `offset`, nếu được cung cấp, phải nằm trong khoảng từ 0.0 đến 1.0 (bao gồm) và sắp xếp theo thứ tự tăng dần.

   Không bắt buộc phải chỉ định offset cho mọi keyframe. Các keyframe không có offset được chỉ định sẽ được phân bố đều giữa các keyframe liền kề.

   Có thể chỉ định easing áp dụng giữa các keyframe bằng cách cung cấp giá trị `easing` như minh họa bên dưới.

   ```js
   element.animate(
     [
       { opacity: 1, easing: "ease-out" },
       { opacity: 0.1, easing: "ease-in" },
       { opacity: 0 },
     ],
     2000,
   );
   ```

   Trong ví dụ này, easing được chỉ định chỉ áp dụng từ keyframe nơi nó được khai báo cho đến keyframe tiếp theo. Tuy nhiên, mọi giá trị `easing` được chỉ định trên đối số `options` sẽ áp dụng trên một vòng lặp đơn của hoạt ảnh - cho toàn bộ thời lượng.

2. Một `object` chứa các cặp khóa-giá trị, gồm thuộc tính cần làm hoạt ảnh và một `array` các giá trị để lặp qua.

   ```js
   element.animate(
     {
       opacity: [0, 1], // [ from, to ]
       color: ["white", "black"], // [ from, to ]
     },
     2000,
   );
   ```

   Khi dùng định dạng này, số phần tử trong mỗi mảng không cần bằng nhau. Các giá trị được cung cấp sẽ được giãn ra độc lập.

   ```js
   element.animate(
     {
       opacity: [0, 1], // offset: 0, 1
       backgroundColor: ["red", "yellow", "green"], // offset: 0, 0.5, 1
     },
     2000,
   );
   ```

   Các khóa đặc biệt `offset`, `easing`, và `composite` (được mô tả bên dưới) cũng có thể được chỉ định cùng với các giá trị thuộc tính.

   ```js
   element.animate(
     {
       opacity: [0, 0.9, 1],
       offset: [0, 0.8], // Viết tắt cho [ 0, 0.8, 1 ]
       easing: ["ease-in", "ease-out"],
     },
     2000,
   );
   ```

   Sau khi tạo một tập keyframes phù hợp từ các danh sách giá trị thuộc tính, mỗi offset được cung cấp sẽ được áp dụng cho keyframe tương ứng. Nếu không đủ giá trị, hoặc nếu danh sách chứa các giá trị `null`, các keyframe không có offset được chỉ định sẽ được phân bố đều như với định dạng mảng đã mô tả ở trên.

   Nếu có quá ít giá trị `easing` hoặc `composite`, danh sách tương ứng sẽ được lặp lại khi cần.

### Keyframes ngầm định từ/đến

Trình duyệt có thể suy ra trạng thái bắt đầu hoặc kết thúc của một hoạt ảnh bằng trạng thái hiện tại. Theo mặc định, nếu chỉ cung cấp một keyframe, nó được xem là trạng thái kết thúc, và trạng thái bắt đầu được suy ra từ style được tính toán hiện tại của phần tử. Tuy nhiên, bạn có thể chỉ định `offset` để cho biết keyframe đã cung cấp nên được đặt ở đâu trong timeline hoạt ảnh. Để biết thêm thông tin, xem [`Element.animate()`](/en-US/docs/Web/API/Web_Animations_API/Keyframe_Formats#implicit_tofrom_keyframes).

```js
// Animate from the current state to translateX(300px)
logo.animate({ transform: "translateX(300px)" }, 1000);
// Animate from translateX(300px) to the current state
logo.animate({ transform: "translateX(300px)", offset: 0 }, 1000);
// Animate from the current state to translateX(300px) and back to the current state
logo.animate({ transform: "translateX(300px)", offset: 0.5 }, 1000);
```

## Thuộc tính

Keyframes chỉ định các cặp thuộc tính-giá trị của [các thuộc tính CSS có thể được làm hoạt ảnh](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties). Tên thuộc tính được viết bằng {{Glossary("camel_case", "camel case")}}, ví dụ {{cssxref("background-color")}} trở thành `backgroundColor` và {{cssxref("background-position-x")}} trở thành `backgroundPositionX`. Các giá trị viết tắt như {{cssxref("margin")}} cũng được phép.

Có hai thuộc tính CSS đặc biệt là:

- {{cssxref("float")}}, phải được viết là `cssFloat` vì "float" là từ khóa dành riêng trong JavaScript.
- {{cssxref("offset")}}, phải được viết là `cssOffset` vì "offset" biểu thị offset của keyframe như mô tả bên dưới.

Các thuộc tính đặc biệt sau đây cũng có thể được chỉ định:

- offset
  - : Offset của keyframe, được chỉ định là một số trong khoảng từ `0.0` đến `1.0` bao gồm, hoặc `null`.
- easing
  - : [Hàm easing](/en-US/docs/Web/CSS/Reference/Values/easing-function) được dùng từ keyframe này đến keyframe tiếp theo trong chuỗi.
- composite
  - : Phép toán {{domxref("KeyframeEffect.composite")}} được dùng để kết hợp các giá trị được chỉ định trong keyframe này với giá trị nền tảng.

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Element.animate()")}}
- {{domxref("KeyframeEffect.KeyframeEffect", "KeyframeEffect()")}}
- {{domxref("KeyframeEffect.setKeyframes()")}}
