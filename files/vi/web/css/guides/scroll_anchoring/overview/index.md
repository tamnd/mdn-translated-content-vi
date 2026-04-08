---
title: Overview of scroll anchoring
short-title: Overview
slug: Web/CSS/Guides/Scroll_anchoring/Overview
page-type: guide
browser-compat: css.properties.overflow-anchor
sidebar: cssref
---

Là người dùng web, bạn có lẽ đã quen thuộc với vấn đề mà scroll anchoring giải quyết. Bạn duyệt đến một trang dài trên kết nối chậm và bắt đầu cuộn để đọc nội dung; trong khi bạn đang đọc, phần trang bạn đang xem đột nhiên nhảy lên. Điều này xảy ra vì các hình ảnh lớn hoặc một số phần tử khác vừa tải xong ở phía trên nội dung.

Scroll anchoring là một tính năng trình duyệt nhằm giải quyết vấn đề nội dung bị nhảy này, xảy ra khi nội dung tải sau khi người dùng đã cuộn đến một phần mới của tài liệu.

## Cơ chế hoạt động

Scroll anchoring điều chỉnh vị trí cuộn để bù đắp cho các thay đổi bên ngoài viewport. Điều này có nghĩa là điểm trong tài liệu mà người dùng đang xem sẽ vẫn nằm trong viewport, dù vị trí cuộn thực tế của họ có thể thay đổi về _khoảng cách_ họ đã di chuyển qua tài liệu.

## Cách bật scroll anchoring

Không cần làm gì! Tính năng này được bật mặc định trong các trình duyệt hỗ trợ. Trong hầu hết trường hợp, scroll anchoring chính xác là điều bạn muốn — nội dung bị nhảy là trải nghiệm tồi cho bất kỳ ai.

## Debug scroll anchoring

Nếu trang của bạn hoạt động không đúng khi scroll anchoring được bật, có thể là do một số `scroll` event listener không xử lý đúng việc cuộn thêm để bù đắp cho chuyển động của anchor node.

Bạn có thể kiểm tra xem việc tắt scroll anchoring có khắc phục vấn đề không trong Firefox bằng cách đổi `layout.css.scroll-anchoring.enabled` thành `false` trong `about:config`. Bạn cũng có thể kiểm tra node mà Firefox đang dùng làm anchor bằng công tắc `layout.css.scroll-anchoring.highlight`. Nó sẽ hiển thị một lớp phủ màu tím trên anchor node.

Nếu một node có vẻ không phải là anchor phù hợp, bạn có thể loại trừ nó bằng {{cssxref("overflow-anchor")}}, như mô tả bên dưới.

## Tắt scroll anchoring

Module [CSS scroll anchoring](/en-US/docs/Web/CSS/Guides/Scroll_anchoring) cung cấp thuộc tính {{cssxref("overflow-anchor")}}, có thể dùng để tắt scroll anchoring trên toàn bộ hoặc một phần tài liệu. Về cơ bản, đây là cách để opt out khỏi hành vi này.

Chỉ có hai giá trị có thể là `auto` hoặc `none`:

- `auto` là giá trị mặc định; miễn là trình duyệt của người dùng hỗ trợ scroll anchoring, hành vi sẽ xảy ra và họ sẽ thấy ít nội dung bị nhảy hơn.
- `none` có nghĩa là bạn đã chọn opt out tài liệu, hoặc một phần tài liệu, khỏi scroll anchoring.

Để opt out toàn bộ tài liệu, bạn có thể đặt nó trên phần tử {{htmlelement("body")}}:

```css
body {
  overflow-anchor: none;
}
```

Để opt out scroll anchoring cho một phần của tài liệu, đặt `overflow-anchor: none` trên phần tử container của phần đó:

```css
.container {
  overflow-anchor: none;
}
```

Nếu opt out scroll anchoring trên tài liệu hoặc một phần của nó, phần tử con của vùng đã opt out không thể được opt lại. Ví dụ, nếu bạn opt out toàn bộ tài liệu, bạn không thể đặt `overflow-anchor: auto` trên một node con để bật lại scroll anchoring cho một phần.

### Suppression trigger

Có một số _suppression trigger_ tắt scroll anchoring ở những nơi mà nó có thể gây vấn đề. Nếu bất kỳ trigger nào xảy ra trên anchor node hoặc một tổ tiên của nó, anchoring sẽ bị tắt.

Các suppression trigger là những thay đổi về giá trị tính toán của bất kỳ thuộc tính nào sau đây:

- {{cssxref("top")}}, {{cssxref("left")}}, {{cssxref("right")}}, hoặc {{cssxref("bottom")}}
- {{cssxref("margin")}} hoặc {{cssxref("padding")}}
- Bất kỳ thuộc tính liên quan đến {{cssxref("width")}} hoặc {{cssxref("height")}}
- {{cssxref("transform")}} và các thuộc tính transform riêng lẻ {{cssxref("translate")}}, {{cssxref("scale")}}, và {{cssxref("rotate")}}

Ngoài ra, các thay đổi về {{cssxref("position")}} ở bất kỳ đâu bên trong {{glossary("scroll container")}} cũng tắt scroll anchoring.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

Để áp dụng style có điều kiện dựa trên việc scroll anchoring có thể tắt hay không, hãy dùng [feature query `@supports`](/en-US/docs/Web/CSS/Reference/At-rules/@supports) để kiểm tra hỗ trợ thuộc tính `overflow-anchor`.

## Xem thêm

- [Original scroll anchoring explainer](https://github.com/WICG/ScrollAnchoring/blob/master/explainer.md) via WICG (2016)
- [Scroll anchoring for web developers](https://blog.chromium.org/2017/04/scroll-anchoring-for-web-developers.html) via Chromium (2017)
