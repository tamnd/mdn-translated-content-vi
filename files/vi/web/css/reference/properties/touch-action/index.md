---
title: touch-action
slug: Web/CSS/Reference/Properties/touch-action
page-type: css-property
browser-compat: css.properties.touch-action
sidebar: cssref
---

Thuộc tính **`touch-action`** của [CSS](/vi/docs/Web/CSS) đặt cách vùng của một phần tử có thể được thao tác bởi người dùng màn hình cảm ứng (ví dụ: bằng các tính năng thu phóng tích hợp trong trình duyệt).

Theo mặc định, việc cuộn (panning) và cử chỉ chụm ngón tay (pinching) được xử lý độc quyền bởi trình duyệt. Một ứng dụng sử dụng {{domxref("Pointer_events", "Sự kiện con trỏ", "", 1)}} sẽ nhận được sự kiện {{domxref("Element/pointercancel_event", "pointercancel")}} khi trình duyệt bắt đầu xử lý một cử chỉ chạm. Bằng cách chỉ định rõ ràng những cử chỉ nào nên được trình duyệt xử lý, ứng dụng có thể cung cấp hành vi của riêng mình trong các trình lắng nghe {{domxref("Element/pointermove_event", "pointermove")}} và {{domxref("Element/pointerup_event", "pointerup")}} cho các cử chỉ còn lại. Các ứng dụng sử dụng {{domxref("Touch_events", "Sự kiện chạm", "", 1)}} tắt tính năng xử lý cử chỉ của trình duyệt bằng cách gọi {{domxref("Event.preventDefault","preventDefault()")}}, nhưng cũng nên sử dụng `touch-action` để đảm bảo trình duyệt biết ý định của ứng dụng trước khi bất kỳ trình lắng nghe sự kiện nào được gọi.

Khi một cử chỉ bắt đầu, trình duyệt giao nhau các giá trị `touch-action` của phần tử được chạm và các phần tử tổ tiên của nó, lên đến phần tử triển khai cử chỉ (nói cách khác, phần tử cuộn đầu tiên chứa nó). Điều này có nghĩa là trong thực tế, `touch-action` thường chỉ được áp dụng cho các phần tử cấp cao nhất có một số hành vi tùy chỉnh, mà không cần chỉ định `touch-action` rõ ràng trên bất kỳ phần tử con nào của phần tử đó.

> [!NOTE]
> Sau khi một cử chỉ bắt đầu, các thay đổi đối với `touch-action` sẽ không có bất kỳ tác động nào lên hành vi của cử chỉ hiện tại.

## Cú pháp

```css
/* Giá trị từ khóa */
touch-action: auto;
touch-action: none;
touch-action: pan-x;
touch-action: pan-left;
touch-action: pan-right;
touch-action: pan-y;
touch-action: pan-up;
touch-action: pan-down;
touch-action: pinch-zoom;
touch-action: manipulation;

/* Giá trị toàn cục */
touch-action: inherit;
touch-action: initial;
touch-action: revert;
touch-action: revert-layer;
touch-action: unset;
```

Thuộc tính `touch-action` có thể được chỉ định là một trong:

- Một trong các từ khóa `auto`, `none`, [`manipulation`](#manipulation), _hoặc_
- Một trong các từ khóa `pan-x`, `pan-left`, `pan-right` và/hoặc một trong các từ khóa `pan-y`, `pan-up`, `pan-down`, cộng thêm tùy chọn từ khóa `pinch-zoom`.

### Giá trị

- `auto`
  - : Cho phép trình duyệt xử lý tất cả cử chỉ cuộn và thu phóng.
- `none`
  - : Tắt tính năng xử lý tất cả cử chỉ cuộn và thu phóng của trình duyệt.
- `pan-x`
  - : Cho phép cử chỉ cuộn ngang bằng một ngón tay. Có thể kết hợp với **pan-y**, **pan-up**, **pan-down** và/hoặc **pinch-zoom**.
- `pan-y`
  - : Cho phép cử chỉ cuộn dọc bằng một ngón tay. Có thể kết hợp với **pan-x**, **pan-left**, **pan-right** và/hoặc **pinch-zoom**.
- `manipulation`
  - : Cho phép cử chỉ cuộn và chụm ngón tay thu phóng, nhưng tắt các cử chỉ không chuẩn bổ sung như nhấn đúp để thu phóng. Việc tắt nhấn đúp để thu phóng giúp trình duyệt không cần trì hoãn việc tạo sự kiện **click** khi người dùng nhấn vào màn hình. Đây là bí danh cho "**pan-x pan-y pinch-zoom**" (cũng vẫn hợp lệ vì lý do tương thích).
- `pan-left`, `pan-right`, `pan-up`, `pan-down`
  - : Cho phép cử chỉ một ngón tay bắt đầu bằng cách cuộn theo hướng đã cho. Sau khi cuộn bắt đầu, hướng vẫn có thể bị đảo ngược. Lưu ý rằng cuộn "lên" (**pan-up**) có nghĩa là người dùng đang kéo ngón tay xuống trên bề mặt màn hình, và tương tự **pan-left** có nghĩa là người dùng đang kéo ngón tay sang phải. Nhiều hướng có thể được kết hợp trừ khi có biểu diễn đơn giản hơn (ví dụ: "**pan-left pan-right**" không hợp lệ vì "**pan-x**" đơn giản hơn, nhưng "**pan-left pan-down**" là hợp lệ).
- `pinch-zoom`
  - : Cho phép cuộn và thu phóng trang bằng nhiều ngón tay. Có thể kết hợp với bất kỳ giá trị **pan-** nào.

## Khả năng tiếp cận

Khai báo `touch-action: none;` có thể ngăn cản khả năng thu phóng của trình duyệt. Điều này sẽ ngăn những người có vấn đề về thị lực đọc và hiểu nội dung trang.

- [MDN Giải thích WCAG, Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.4 | Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tắt tất cả cử chỉ

Cách sử dụng phổ biến nhất là tắt tất cả cử chỉ trên một phần tử (và các phần tử con không cuộn được) cung cấp hành vi kéo và thu phóng riêng của nó — chẳng hạn như bản đồ hoặc bề mặt trò chơi.

#### HTML

```html
<div id="map"></div>
```

#### CSS

```css
#map {
  height: 150vh;
  width: 70vw;
  background: linear-gradient(blue, green);
  touch-action: none;
}
```

#### Kết quả

{{EmbedLiveSample('Disabling_all_gestures')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("pointer-events","pointer-events")}}
- [Sự kiện con trỏ](/en-US/docs/Web/API/Pointer_events)
- Blog WebKit [More Responsive Tapping on iOS](https://webkit.org/blog/5610/more-responsive-tapping-on-ios/)
- Blog Google Developers [Making touch scrolling fast by default](https://developer.chrome.com/blog/scrolling-intervention/)
- [Scroll Snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
