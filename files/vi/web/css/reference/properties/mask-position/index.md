---
title: mask-position
slug: Web/CSS/Reference/Properties/mask-position
page-type: css-property
browser-compat: css.properties.mask-position
sidebar: cssref
---

Thuộc tính **`mask-position`** trong [CSS](/en-US/docs/Web/CSS) đặt vị trí ban đầu, tương đối so với lớp vị trí mặt nạ được đặt bởi {{cssxref("mask-origin")}}, cho mỗi ảnh mặt nạ đã được xác định.

## Cú pháp

```css
/* Giá trị từ khóa <position> đơn */
/* Đặt giá trị thứ hai là 'center' */
mask-position: left;
mask-position: center;
mask-position: right;
mask-position: top;
mask-position: bottom;

/* Hai giá trị từ khóa <position> */
mask-position: left center;
mask-position: right top;

/* Một giá trị độ dài hoặc phần trăm <position> */
/* Vị trí ngang. Vị trí dọc được đặt là 'center' */
mask-position: 25%;
mask-position: 0px;
mask-position: 8em;

/* Hai giá trị độ dài hoặc phần trăm <position> */
/* Giá trị đầu tiên: vị trí ngang. Giá trị thứ hai: vị trí dọc */
mask-position: 25% 75%;
mask-position: 0px 0px;
mask-position: 10% 8em;

/* Độ lệch cạnh: Bốn giá trị <position> */
mask-position: bottom 10px right 20px;
mask-position: right 3em bottom 10px;
mask-position: bottom 10px right 0;

/* Nhiều giá trị <position> */
mask-position:
  top left,
  bottom 10px right 10px;
mask-position:
  1rem 1rem,
  center;

/* Giá trị toàn cục */
mask-position: inherit;
mask-position: initial;
mask-position: revert;
mask-position: revert-layer;
mask-position: unset;
```

### Giá trị

Một hoặc nhiều giá trị `<position>`, được phân cách bằng dấu phẩy.

- {{cssxref("&lt;position&gt;")}}
  - : Một, hai hoặc bốn giá trị biểu thị vị trí 2D xác định các cạnh của hộp phần tử. Có thể sử dụng độ lệch tương đối hoặc tuyệt đối.

## Mô tả

Thuộc tính `mask-position` xác định vị trí của mỗi lớp mặt nạ. Một phần tử có thể có nhiều lớp mặt nạ được áp dụng. Số lượng lớp được xác định bởi số lượng giá trị phân cách bằng dấu phẩy trong giá trị thuộc tính {{cssxref("mask-image")}} (ngay cả giá trị `none` cũng tạo ra một lớp).

Mỗi giá trị `mask-position` trong danh sách phân cách bằng dấu phẩy được ghép với lớp mặt nạ liên quan được xác định bởi danh sách giá trị `mask-image`, theo thứ tự. Nếu số lượng giá trị trong hai thuộc tính khác nhau:

- Nếu `mask-position` có nhiều giá trị hơn `mask-image`, các giá trị dư của `mask-position` không được sử dụng.
- Nếu `mask-position` có ít giá trị hơn `mask-image`, các giá trị `mask-position` được lặp lại.

Mỗi giá trị `mask-position` xác định vị trí của lớp mặt nạ liên quan tương đối so với giá trị {{cssxref("mask-origin")}} liên quan. Các giá trị thuộc tính `mask-origin` cũng được ghép với các giá trị `mask-image`, theo thứ tự, với các giá trị `mask-position` dư không được sử dụng hoặc các giá trị `mask-position` được lặp lại nếu chúng ít hơn số lượng giá trị `mask-origin`. Do đó, mỗi lớp mặt nạ có một giá trị `mask-origin` và `mask-position` liên quan.

Nếu không có `mask-origin` nào được đặt, giá trị mặc định là `padding-box`, nghĩa là gốc của mỗi `mask-position` là [padding-box](/en-US/docs/Web/CSS/Reference/Values/box-edge#padding-box) của phần tử.

### Cú pháp một giá trị

Nếu chỉ có một giá trị `mask-position` được chỉ định, giá trị thứ hai được coi là `center`. Nếu giá trị là `<length>` hoặc `<percentage>`, nó xác định vị trí của mặt nạ dọc theo trục ngang, với mặt nạ được căn giữa theo chiều dọc trong hộp gốc. Ví dụ, `mask-position: 0%;` tương đương với `mask-position: 0% center`.

Nếu bạn sử dụng một từ khóa đơn để định vị, giá trị kia sẽ được giải quyết thành `center`. Mặc định của `mask-position` là `0% 0%`, tương đương với `mask-position: top left`. Tuy nhiên:

- `mask-position: top;` tương đương với `mask-position: top center;`.
- `mask-position: left;` tương đương với `mask-position: center left`.
- `mask-position: center;` tương đương với `mask-position: center center`.

Nếu giá trị là giá trị {{cssxref("&lt;length&gt;")}}, nó biểu thị vị trí ngang như một độ lệch từ cạnh trái của vị trí mặt nạ. Giá trị dương biểu thị độ lệch vào bên trong từ cạnh trái của hộp chứa. Vị trí có thể được đặt bên ngoài hộp của phần tử bằng giá trị âm — điều này tạo ra độ lệch ra ngoài đặt mục bên ngoài cạnh trái của hộp chứa.

#### Giá trị phần trăm

Giá trị {{cssxref("&lt;percentage&gt;")}} biểu thị giá trị vị trí ngang của mặt nạ tương đối so với chiều rộng của hộp chứa, được định vị tương đối so với cạnh trái. Tuy nhiên, độ lệch không phải từ cạnh mặt nạ đến cạnh hộp. Thay vào đó, kích thước ảnh mặt nạ được [trừ đi từ kích thước hộp chứa](/en-US/docs/Web/CSS/Reference/Properties/background-position#regarding_percentages), và sau đó một phần trăm của giá trị kết quả được sử dụng làm độ lệch trực tiếp từ cạnh trái của hộp, giống như [giá trị phần trăm cho `background-position`](/en-US/docs/Web/CSS/Reference/Properties/background-position#regarding_percentages).

Phương trình là:

`(kích thước hộp chứa - kích thước mặt nạ) * phần trăm vị trí = giá trị độ lệch kích thước`

Với mặt nạ rộng `100px` và hộp gốc rộng `1000px`, đặt `mask-position: 10%;` (tương đương với `10% 50%`) dẫn đến mặt nạ được căn giữa theo chiều dọc tại `90px` từ cạnh trái. Phương trình là `(1000 - 100) * 10% = 90`. Nếu độ lệch trái là `0%`, cạnh trái của mặt nạ sẽ sát với cạnh trái của hộp chứa (`(1000 - 100) * 0% = 0`).

Nếu độ lệch trái là `100%`, cạnh phải của mặt nạ sẽ sát với cạnh phải của hộp chứa vì cạnh trái của mặt nạ rộng `100px` sẽ là `900px` (`(1000 - 100) * 100% = 900`) từ cạnh trái của hộp chứa (chiều rộng `100px` của mặt nạ cộng với khoảng cách `900px` từ cạnh trái có nghĩa là cạnh phải sẽ cách cạnh trái của hộp chứa `1000px`, tức là cạnh phải của hộp chứa).

### Cú pháp hai giá trị

Cú pháp `<position>` hai giá trị xác định vị trí của ảnh mặt nạ bên trong vùng định vị mặt nạ của nó, với các giá trị độ dài và phần trăm chỉ định độ lệch từ `left` và `top` của vùng.

Nếu hai giá trị là giá trị {{cssxref("&lt;length&gt;")}}, giá trị {{cssxref("&lt;percentage&gt;")}}, hoặc từ khóa `center`, giá trị đầu tiên biểu thị vị trí ngang như một độ lệch từ cạnh trái của vùng định vị mặt nạ, và giá trị thứ hai biểu thị vị trí dọc như một độ lệch từ cạnh trên của nó, với [các phần trăm được bù đắp](#percentage_values) bởi kích thước mặt nạ trong chiều đó.

Ngoài ra, nếu các giá trị {{cssxref("&lt;percentage&gt;")}} được chỉ định, giá trị đầu tiên cũng là giá trị vị trí ngang tương đối so với cạnh trái, và giá trị thứ hai cũng là giá trị vị trí dọc tương đối so với cạnh trên.

Một cặp từ khóa dành riêng cho trục có thể được sắp xếp lại, cũng như từ khóa dành riêng cho trục và độ dài hoặc phần trăm, nhưng hai giá trị độ dài hoặc phần trăm không thể hoán đổi cho nhau.
Nếu một trong hai giá trị là `top`, `right`, `bottom`, hoặc `left`, thứ tự của hai giá trị không quan trọng. Bất kỳ giá trị `center` hoặc `<length-percentage>` nào trong cặp giá trị sẽ được áp dụng cho chiều kia.

### Cú pháp bốn giá trị

Cú pháp bốn giá trị bao gồm hai cặp giá trị, mỗi cặp chứa một từ khóa xác định cạnh để tính độ lệch, và một giá trị `<length>` và `<percentage>` chỉ định khoảng cách độ lệch. Ví dụ, `mask-position: left 1em top 2em` chỉ định độ lệch ngang `1em` từ cạnh trái của hộp và độ lệch dọc `2em` từ cạnh trên. Tương đương hai giá trị sẽ là `mask-position: 1em 2em`.

Vì chúng ta đang xác định các cạnh độ lệch khi sử dụng cú pháp bốn giá trị, thứ tự không quan trọng: `mask-position: top 2em left 1em` và `mask-position: left 1em top 2em` đều cho kết quả giống nhau.

Sức mạnh thực sự của cú pháp bốn giá trị là cho phép chỉ định các cạnh độ lệch khác ngoài `left` và `top`. Ví dụ, `mask-position: bottom 10px right 20px` tạo ra độ lệch dọc `10px` lên từ cạnh dưới và độ lệch ngang `20px` sang trái từ cạnh phải. Thông thường, cú pháp bốn giá trị được sử dụng để tính độ lệch từ cạnh dưới và/hoặc phải. Nhưng cú pháp này cũng hữu ích nếu bạn không thể nhớ thứ tự cạnh độ lệch cho cú pháp hai giá trị.

Một điều cần lưu ý là, không giống như các giá trị kiểu dữ liệu `<bg-position>` cho {{cssxref("background-position")}}, các giá trị `<position>` cho `mask-position` không cho phép cú pháp 3 giá trị và không cho phép tính độ lệch từ `center`. Khi tính độ lệch mặt nạ từ `bottom` hoặc `right`, `mask-position` yêu cầu khai báo đầy đủ bốn giá trị.

Để cú pháp bốn giá trị hợp lệ, nó cần chỉ định `top` hoặc `bottom` là cạnh độ lệch dọc, cùng với giá trị độ dài hoặc phần trăm độ lệch dọc, và `left` hoặc `right` là cạnh độ lệch ngang, cùng với giá trị độ dài hoặc phần trăm độ lệch ngang.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

```html
<section>
  <div></div>
</section>
```

```css
section {
  border: 1px solid black;
  width: 250px;
  height: 250px;
}

div {
  width: 250px;
  height: 250px;
  margin-bottom: 10px;
  background: blue linear-gradient(red, blue);

  mask-image: url("/shared-assets/images/examples/mask-star.svg");
  mask-repeat: no-repeat;
  mask-position: top right;
}
```

{{EmbedLiveSample("basic usage", "", "300px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-position")}}
- {{cssxref("mask-image")}}
- {{cssxref("mask-origin")}}
- {{cssxref("mask-repeat")}}
- {{cssxref("mask-size")}}
- {{cssxref("mask")}} shorthand
- {{cssxref("mask-border")}}
- {{cssxref("mask-border-outset")}}
- [Introduction to CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
- [CSS `mask` properties](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Declaring multiple masks](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks)
- [CSS masking](/en-US/docs/Web/CSS/Guides/Masking) module
- {{cssxref("background-position")}}
- {{cssxref("&lt;position&gt;")}}
