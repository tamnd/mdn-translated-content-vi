---
title: box-lines
slug: Web/CSS/Reference/Properties/box-lines
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.box-lines
sidebar: cssref
---

{{Non-standard_header}}{{Deprecated_Header}}

> [!WARNING]
> Đây là thuộc tính thuộc bản thảo đặc tả gốc của CSS Flexible Box Layout Module. Nó đã được thay thế trong đặc tả. Xem [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts) để biết thông tin về tiêu chuẩn hiện hành.

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`box-lines`** xác định liệu hộp có thể có một hay nhiều dòng (hàng đối với hộp định hướng ngang, cột đối với hộp định hướng dọc).

Theo mặc định, hộp ngang sẽ bố trí các phần tử con của nó trong một hàng duy nhất, còn hộp dọc sẽ bố trí các phần tử con của nó trong một cột duy nhất. Hành vi này có thể được thay đổi bằng thuộc tính `box-lines`. Giá trị mặc định là `single`, có nghĩa là tất cả các phần tử sẽ được đặt trong một hàng hoặc một cột duy nhất, và bất kỳ phần tử nào không vừa sẽ bị coi là tràn.

Tuy nhiên, nếu giá trị `multiple` được chỉ định, thì hộp được phép mở rộng sang nhiều dòng (tức là nhiều hàng hoặc cột) để chứa tất cả các phần tử con của nó. Hộp phải cố gắng đặt các phần tử con của nó trên càng ít dòng càng tốt bằng cách thu nhỏ tất cả các phần tử xuống chiều rộng hoặc chiều cao tối thiểu của chúng nếu cần.

Nếu các phần tử con trong hộp ngang vẫn không vừa trên một dòng sau khi thu nhỏ xuống chiều rộng tối thiểu, thì các phần tử con được chuyển từng phần tử một sang một dòng mới, cho đến khi các phần tử còn lại trên dòng trước đó vừa. Quá trình này có thể lặp lại đến số dòng tùy ý. Nếu một dòng chỉ chứa một phần tử duy nhất không vừa, thì phần tử đó nên ở lại trên dòng đó và tràn ra ngoài hộp. Các dòng sau được đặt bên dưới các dòng trước trong các hộp hướng bình thường và bên trên trong các hộp hướng ngược. Chiều cao của một dòng là chiều cao của phần tử con lớn nhất trong dòng đó. Không có thêm khoảng cách nào giữa các dòng ngoài các lề trên các phần tử lớn nhất trong mỗi dòng. Để tính chiều cao của một dòng, các lề có giá trị tính toán là `auto` nên được xử lý như có giá trị 0.

Quá trình tương tự cũng xảy ra đối với các phần tử con trong hộp dọc. Các dòng sau trong các hộp hướng bình thường được đặt bên phải các dòng trước và bên trái trong các hộp hướng ngược.

Khi số lượng dòng đã được xác định, các phần tử có giá trị tính toán cho {{CSSxRef("box-flex")}} khác `0` sẽ kéo dài khi cần thiết để cố gắng lấp đầy không gian còn lại trên các dòng. Mỗi dòng tính toán các flex độc lập, vì vậy chỉ có các phần tử trên dòng đó mới được xem xét khi đánh giá {{CSSxRef("box-flex")}} và {{CSSxRef("box-flex-group")}}. Việc đóng gói các phần tử trong một dòng, như được chỉ định bởi thuộc tính {{CSSxRef("box-pack")}}, cũng được tính toán độc lập cho mỗi dòng.

## Cú pháp

```css
/* Keyword values */
box-lines: single;
box-lines: multiple;

/* Global values */
box-lines: inherit;
box-lines: initial;
box-lines: unset;
```

Thuộc tính `box-lines` được chỉ định là một trong các giá trị từ khóa được liệt kê bên dưới.

### Giá trị

- `single`
  - : Các phần tử hộp được bố trí trong một hàng hoặc cột duy nhất.
- `multiple`
  - : Các phần tử hộp được bố trí trong nhiều hàng hoặc cột.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`box-lines = single | multiple`)}}

## Ví dụ

### Ví dụ sử dụng cơ bản

Trong phiên bản gốc của đặc tả, `box-lines` cho phép bạn chỉ định rằng bạn muốn các phần tử con của flex container xuống dòng sang nhiều dòng. Điều này chỉ được hỗ trợ trong các trình duyệt dựa trên WebKit với tiền tố.

```css
div {
  display: box;
  box-orient: horizontal;
  box-lines: multiple;
}
```

Tương đương flexbox hiện đại là {{cssxref("flex-wrap")}}.

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("flex")}}
- {{CSSxRef("flex-basis")}}
- {{CSSxRef("flex-grow")}}
- {{CSSxRef("flex-shrink")}}
