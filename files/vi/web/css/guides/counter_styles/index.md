---
title: CSS counter styles
short-title: Counter styles
slug: Web/CSS/Guides/Counter_styles
page-type: css-module
spec-urls: https://drafts.csswg.org/css-counter-styles/
sidebar: cssref
---

Module **CSS counter styles** cho phép bạn định nghĩa các kiểu counter tùy chỉnh của riêng mình để quản lý sự xuất hiện của các [markers](/en-US/docs/Web/CSS/Reference/Selectors/::marker) trong danh sách và counters trong [generated content](/en-US/docs/Web/CSS/Guides/Generated_content). Nó cũng cho phép bạn mở rộng các kiểu danh sách trình duyệt gốc với các tùy chỉnh của riêng bạn.

Trong khi chúng ta nghĩ về counters như là các con số, chúng thực sự là các chuỗi với các thành phần có thể được tăng lên. Module counter styles định nghĩa quy tắc `@counter-style` với mười descriptors, cho phép các nhà phát triển định nghĩa chính xác cách counters được chuyển đổi thành chuỗi. Module này cho phép định nghĩa ký tự nào cần dùng cho các dấu bullet counter, tiền tố đặt trước counter và hậu tố đặt sau, cùng với cách xử lý các giá trị âm. Các descriptors cũng có thể đặt một phạm vi để giới hạn các giá trị mà kiểu counter có thể xử lý, trong khi cũng cung cấp các kiểu dự phòng cho khi giá trị counter nằm ngoài phạm vi được định nghĩa hoặc không thể render giá trị counter. Module cũng cho phép định nghĩa cách counter được đọc to bởi các bộ tổng hợp giọng nói.

## Tài liệu tham khảo

### Thuộc tính

Không có thuộc tính nào được định nghĩa trong module này

### Hàm

- {{cssxref("symbols()")}}

### Kiểu dữ liệu

- [`<counter-style-name>`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style#counter-style-name)
- [`<symbol>`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style/symbols#values)
- [`<symbols-type>`](/en-US/docs/Web/CSS/Reference/Values/symbols#syntax)

### At-rules và descriptors

- {{cssxref("@counter-style")}}
  - {{cssxref("@counter-style/system","system")}}
  - {{cssxref("@counter-style/symbols", "symbols")}}
  - {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}
  - {{cssxref("@counter-style/negative", "negative")}}
  - {{cssxref("@counter-style/prefix", "prefix")}}
  - {{cssxref("@counter-style/suffix", "suffix")}}
  - {{cssxref("@counter-style/range", "range")}}
  - {{cssxref("@counter-style/pad", "pad")}}
  - {{cssxref("@counter-style/speak-as", "speak-as")}}
  - {{cssxref("@counter-style/fallback", "fallback")}}

### Interfaces

- Interface {{domxref("CSSCounterStyleRule")}}

## Hướng dẫn

- [Using CSS counters](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters)
  - : Mô tả cách sử dụng counters để đánh số bất kỳ phần tử HTML nào hoặc thực hiện việc đếm phức tạp.

## Các khái niệm liên quan

Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists):

- Thuộc tính {{cssxref("counter-increment")}}
- Thuộc tính {{cssxref("counter-reset")}}
- Thuộc tính {{cssxref("counter-set")}}
- Thuộc tính {{cssxref("list-style-type")}}
- Thuộc tính viết tắt {{cssxref("list-style")}}
- Hàm {{cssxref("counter()")}}
- Hàm {{cssxref("counters()")}}

Module [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements):

- Pseudo-element {{cssxref("::after")}}
- Pseudo-element {{cssxref("::before")}}
- Pseudo-element {{cssxref("::marker")}}

Module [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content):

- Thuộc tính {{cssxref("content")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- Module [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements)
- Module [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content)
- [Ready-made counter styles](https://w3c.github.io/predefined-counter-styles/#builtins) via W3C (2023)
