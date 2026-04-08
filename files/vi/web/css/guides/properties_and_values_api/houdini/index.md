---
title: CSS Houdini
slug: Web/CSS/Guides/Properties_and_values_API/Houdini
page-type: guide
sidebar: cssref
---

**CSS Houdini** là một tập hợp các API phơi bày các phần của CSS engine, cho phép các nhà phát triển tạo ra các phần mở rộng CSS. Các phần mở rộng này có thể polyfill các tính năng chưa có sẵn trong trình duyệt, thử nghiệm các kỹ thuật layout mới, hoặc thêm các đường viền sáng tạo và các hiệu ứng khác.

Mặc dù nhiều ví dụ Houdini thể hiện khả năng sáng tạo của các API, nhưng có nhiều trường hợp sử dụng thực tế. Ví dụ, bạn có thể dùng Houdini để tạo các thuộc tính tùy chỉnh nâng cao với kiểm tra kiểu và giá trị mặc định.

## Ví dụ cơ bản

Một [CSS custom property](/en-US/docs/Web/CSS/Reference/Properties/--*) thông thường bao gồm tên thuộc tính và một giá trị. Vì vậy tôi có thể tạo một thuộc tính tùy chỉnh có tên `--background-color` và mong đợi nó được gán giá trị màu sắc. Giá trị đó sau đó được sử dụng trong CSS như thể nó là giá trị màu sắc.

```css
:root {
  --background-color: blue;
}

.box {
  background-color: var(--background-color);
}
```

Tuy nhiên, trong ví dụ trên, không có gì ngăn ai đó sử dụng một giá trị khác cho thuộc tính này, chẳng hạn đặt nó thành một giá trị độ dài. Khi làm như vậy, bất kỳ nơi nào thuộc tính được sử dụng sẽ không có màu nền vì `background-color: 12px` là không hợp lệ. Khi trình duyệt gặp CSS mà nó không nhận ra là hợp lệ, nó sẽ loại bỏ dòng đó.

Tuy nhiên, khi dùng {{cssxref("@property")}}, chúng ta có thể khai báo thuộc tính tùy chỉnh với {{CSSxRef("@property/syntax","syntax")}} là `<color>`. Điều này cho thấy chúng ta cần thuộc tính này có giá trị là một màu hợp lệ.

```css
@property --background-color {
  syntax: "<color>";
  inherits: false;
  initial-value: blue;
}
```

## Houdini worklets

Một tính năng của Houdini là {{domxref("Worklet")}}. Một worklet là một module, được viết bằng JavaScript, mở rộng CSS bằng cách sử dụng một trong các Houdini API. Bạn có thể xem một worklet ví dụ trên trang {{domxref("PaintWorkletGlobalScope.registerPaint()")}}. Sau khi một worklet được đăng ký, bạn có thể sử dụng nó trong CSS giống như bất kỳ giá trị nào khác. Điều này có nghĩa là ngay cả khi bạn không phải là nhà phát triển JavaScript, bạn vẫn có thể truy cập các Houdini API bằng cách sử dụng các worklet mà người khác đã tạo.

## Tham khảo

### CSS at-rule và descriptors

At-rule {{CSSxRef("@property")}} cho phép bạn đăng ký một thuộc tính tùy chỉnh nâng cao.

- {{CSSxRef("@property")}}
- {{CSSxRef("@property/inherits","inherits")}}
- {{CSSxRef("@property/initial-value","initial-value")}}
- {{CSSxRef("@property/syntax","syntax")}}

### Tham khảo Houdini API

- [CSS Properties and Values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- {{domxref("Worklet")}} reference

### Hướng dẫn Houdini

- [Properties and Values API Guide](/en-US/docs/Web/API/CSS_Properties_and_Values_API/guide)
- [Typed OM API Guide](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [Using the CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API/Guide)

## Xem thêm

- [A Practical Overview of CSS Houdini](https://www.smashingmagazine.com/2020/03/practical-overview-css-houdini/)
- [Smarter custom properties with Houdini's new API](https://web.dev/articles/css-props-and-vals)
