---
title: Hàm quy tắc at CSS
short-title: Hàm quy tắc at
slug: Web/CSS/Reference/At-rules/At-rule_functions
page-type: listing-page
sidebar: cssref
---

**Hàm quy tắc at [CSS](/en-US/docs/Web/CSS)** là các câu lệnh [quy tắc at](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) biểu diễn các quy tắc phức tạp hoặc có thể gọi xử lý dữ liệu hay tính toán đặc biệt.

## Cú pháp

```plain
@identifier function([argument]? [, argument]!) {
}
```

Cú pháp bắt đầu bằng ký hiệu at `@` và một định danh quy tắc at, chẳng hạn như `import`. Tiếp theo là **tên của hàm quy tắc at**, chẳng hạn như `url`, theo sau là một cặp dấu ngoặc đơn mở và đóng. Một hoặc nhiều đối số được chỉ định bên trong dấu ngoặc đơn.

Một số hàm quy tắc at có thể nhận nhiều đối số, được định dạng tương tự như giá trị thuộc tính CSS. Khoảng trắng được cho phép, nhưng không bắt buộc bên trong dấu ngoặc đơn. Nhiều đối số có thể được phân tách bằng dấu phẩy hoặc khoảng trắng.

## Hàm @import

Quy tắc at {{CSSxRef("@import")}} được dùng để nhập kiểu dáng từ các stylesheet khác.

- {{CSSxRef("@import", "@import url()")}}
  - : Nhập tệp stylesheet từ URL được chỉ định.
- {{CSSxRef("@import", "@import supports()")}}
  - : Nhập tệp stylesheet dựa trên sự hỗ trợ của trình duyệt.
- [`@import layer()`](/en-US/docs/Web/CSS/Reference/At-rules/@import/layer_function)
  - : Nhập tệp stylesheet vào cascade layer được chỉ định.

## Hàm @supports

Quy tắc at {{CSSxRef("@supports")}} kiểm tra sự hỗ trợ của trình duyệt đối với tính năng CSS được chỉ định rồi áp dụng kiểu dáng CSS.

- {{CSSxRef("@supports", "@supports selector()")}}
  - : Áp dụng các quy tắc CSS sau khi kiểm tra sự hỗ trợ của trình duyệt cho cú pháp bộ chọn được chỉ định.
- {{CSSxRef("@supports", "@supports font-tech()")}}
  - : Áp dụng các quy tắc CSS sau khi kiểm tra sự hỗ trợ của trình duyệt cho công nghệ phông chữ được chỉ định.
- {{CSSxRef("@supports", "@supports font-format()")}}
  - : Áp dụng các quy tắc CSS sau khi kiểm tra sự hỗ trợ của trình duyệt cho định dạng phông chữ được chỉ định.

## Hàm @namespace

Quy tắc at {{CSSxRef("@namespace")}} được dùng để chỉ định các không gian tên XML sẽ dùng trong stylesheet CSS.

- {{CSSxRef("@namespace", "@namespace url()")}}
  - : Định nghĩa không gian tên XML từ URL được chỉ định.

## Hàm @container

Quy tắc at {{CSSxRef("@container")}} được dùng để chỉ định các kiểu dáng cho một bối cảnh containment.

- {{CSSxRef("@container", "@container style()")}}
  - : Định nghĩa kiểu dáng của bối cảnh containment.

## Xem thêm

- [Quy tắc at CSS](/en-US/docs/Web/CSS/Reference/At-rules)
- [Cú pháp CSS](/en-US/docs/Web/CSS/Guides/Syntax) module
