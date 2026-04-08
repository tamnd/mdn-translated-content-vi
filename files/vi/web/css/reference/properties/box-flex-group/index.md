---
title: box-flex-group
slug: Web/CSS/Reference/Properties/box-flex-group
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.box-flex-group
sidebar: cssref
---

{{Non-standard_Header}}{{Deprecated_Header}}

> [!WARNING]
> Đây là thuộc tính thuộc bản thảo đặc tả gốc của CSS Flexible Box Layout Module. Nó đã được thay thế trong đặc tả. Xem [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts) để biết thông tin về tiêu chuẩn hiện hành.

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`box-flex-group`** gán các phần tử con của flexbox vào một nhóm flex.

Đối với các phần tử linh hoạt được gán vào các nhóm flex, nhóm flex đầu tiên có giá trị là 1 và các giá trị cao hơn chỉ định các nhóm flex tiếp theo. Giá trị ban đầu là 1. Khi phân chia không gian thừa của hộp, trình duyệt trước tiên xem xét tất cả các phần tử trong nhóm flex đầu tiên. Mỗi phần tử trong nhóm đó được cấp thêm không gian dựa trên tỷ lệ độ linh hoạt của phần tử đó so với độ linh hoạt của các phần tử khác trong cùng nhóm flex. Nếu không gian của tất cả các phần tử con linh hoạt trong nhóm đã được tăng lên tối đa, quá trình này lặp lại cho các phần tử con trong nhóm flex tiếp theo, sử dụng bất kỳ không gian nào còn lại từ nhóm flex trước. Khi không còn nhóm flex nào nữa và vẫn còn không gian dư, không gian thừa được phân chia trong hộp chứa theo thuộc tính {{cssxref("box-pack")}}.

Nếu hộp bị tràn sau khi không gian ưu tiên của các phần tử con được tính toán, thì không gian bị xóa khỏi các phần tử linh hoạt theo cách tương tự như khi thêm không gian thừa. Mỗi nhóm flex được xem xét lần lượt và không gian bị xóa theo tỷ lệ độ linh hoạt của từng phần tử. Các phần tử không thu nhỏ dưới chiều rộng tối thiểu của chúng.

## Cú pháp

```css
/* <integer> values */
box-flex-group: 1;
box-flex-group: 5;

/* Global values */
box-flex-group: inherit;
box-flex-group: initial;
box-flex-group: unset;
```

Thuộc tính `box-flex-group` được chỉ định là bất kỳ {{CSSxRef("&lt;integer&gt;")}} dương nào.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`box-flex-group = <integer>`)}}

## Ví dụ

### Ví dụ sử dụng cơ bản

Trong bản đặc tả flexbox gốc, `box-flex-group` có thể được dùng để gán các phần tử con flex vào các nhóm khác nhau để phân phối không gian linh hoạt:

```css
article:nth-child(1) {
  -webkit-box-flex-group: 1;
}

article:nth-child(2) {
  -webkit-box-flex-group: 2;
}
```

Tính năng này chỉ từng được hỗ trợ trong các trình duyệt dựa trên WebKit với tiền tố, và trong các phiên bản sau của đặc tả, chức năng này không có tương đương. Thay vào đó, việc phân phối không gian bên trong container flex hiện được xử lý bằng {{cssxref("flex-basis")}}, {{cssxref("flex-grow")}} và {{cssxref("flex-shrink")}}.

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("flex")}}
- {{CSSxRef("flex-basis")}}
- {{CSSxRef("flex-grow")}}
- {{CSSxRef("flex-shrink")}}
