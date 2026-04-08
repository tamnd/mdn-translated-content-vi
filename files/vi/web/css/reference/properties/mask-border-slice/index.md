---
title: mask-border-slice
slug: Web/CSS/Reference/Properties/mask-border-slice
page-type: css-property
browser-compat: css.properties.mask-border-slice
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`mask-border-slice`** chia hình ảnh được thiết lập bởi {{cssxref("mask-border-source")}} thành các vùng. Các vùng này được sử dụng để tạo thành các thành phần của [viền mặt nạ](/vi/docs/Web/CSS/Reference/Properties/mask-border) của một phần tử.

## Cú pháp

```css
/* Tất cả các cạnh */
mask-border-slice: 30%;

/* trên và dưới | trái và phải */
mask-border-slice: 10% 30%;

/* trên | trái và phải | dưới */
mask-border-slice: 30 30% 45;

/* trên | phải | dưới | trái */
mask-border-slice: 7 12 14 5;

/* Sử dụng từ khóa `fill` */
mask-border-slice: 10% fill 7 12;

/* Giá trị toàn cục */
mask-border-slice: inherit;
mask-border-slice: initial;
mask-border-slice: revert;
mask-border-slice: revert-layer;
mask-border-slice: unset;
```

Thuộc tính `mask-border-slice` có thể được chỉ định bằng một đến bốn giá trị `<number-percentage>` để biểu thị vị trí của mỗi lát cắt hình ảnh. Giá trị âm không hợp lệ; các giá trị lớn hơn kích thước tương ứng sẽ bị giới hạn ở `100%`.

- Khi chỉ định **một** vị trí, nó tạo ra tất cả bốn lát cắt ở cùng khoảng cách từ các cạnh tương ứng.
- Khi chỉ định **hai** vị trí, giá trị đầu tiên tạo ra các lát cắt đo từ **trên và dưới**, giá trị thứ hai tạo ra các lát cắt đo từ **trái và phải**.
- Khi chỉ định **ba** vị trí, giá trị đầu tiên tạo ra một lát cắt đo từ **trên**, giá trị thứ hai tạo ra các lát cắt đo từ **trái và phải**, giá trị thứ ba tạo ra một lát cắt đo từ **dưới**.
- Khi chỉ định **bốn** vị trí, chúng tạo ra các lát cắt đo từ **trên**, **phải**, **dưới**, và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

Giá trị tùy chọn `fill`, nếu được sử dụng, có thể được đặt ở bất kỳ vị trí nào trong khai báo.

### Giá trị

- {{cssxref("&lt;number&gt;")}}
  - : Biểu thị độ lệch cạnh tính bằng _pixel_ cho hình ảnh raster và _tọa độ_ cho hình ảnh vector. Đối với hình ảnh vector, số này tương đối với kích thước của phần tử, không phải kích thước của hình ảnh nguồn, vì vậy phần trăm thường được ưu tiên hơn trong những trường hợp này.
- {{cssxref("&lt;percentage&gt;")}}
  - : Biểu thị độ lệch cạnh dưới dạng phần trăm kích thước của hình ảnh nguồn: chiều rộng của hình ảnh cho các độ lệch ngang, chiều cao cho các độ lệch dọc.
- `fill`
  - : Giữ nguyên vùng hình ảnh ở giữa. Chiều rộng và chiều cao của nó được định cỡ để khớp với các vùng hình ảnh trên cùng và bên trái, tương ứng.

## Mô tả

Quá trình cắt tạo ra tổng cộng chín vùng: bốn góc, bốn cạnh và một vùng ở giữa. Bốn đường cắt, được đặt ở khoảng cách nhất định từ các cạnh tương ứng, kiểm soát kích thước của các vùng.

![Chín vùng được xác định bởi các thuộc tính border-image hoặc border-image-slice](border-image-slice.png)

Sơ đồ trên minh họa vị trí của mỗi vùng.

- Vùng 1-4 là các vùng góc. Mỗi vùng được sử dụng một lần để tạo thành các góc của hình ảnh viền cuối cùng.
- Vùng 5-8 là các vùng cạnh. Chúng được [lặp lại, chia tỷ lệ, hoặc sửa đổi theo cách khác](/vi/docs/Web/CSS/Reference/Properties/mask-border-repeat) trong hình ảnh viền cuối cùng để khớp với kích thước của phần tử.
- Vùng 9 là vùng ở giữa. Nó bị loại bỏ theo mặc định, nhưng được sử dụng như một hình ảnh nền nếu từ khóa `fill` được đặt.

Các thuộc tính {{cssxref("mask-border-repeat")}}, {{cssxref("mask-border-width")}}, và {{cssxref("mask-border-outset")}} xác định cách các vùng này được sử dụng để tạo thành viền mặt nạ cuối cùng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cách dùng cơ bản

`mask-border-slice` dùng để xác định kích thước của các lát cắt được lấy từ hình ảnh nguồn và được dùng để tạo ra viền mặt nạ.

```css
mask-border-slice: 30 fill;
```

Các trình duyệt dựa trên Chromium hỗ trợ phiên bản cũ của thuộc tính này — `mask-box-image-slice` — với tiền tố:

```css
-webkit-mask-box-image-slice: 30 fill;
```

> [!NOTE]
> Trang {{cssxref("mask-border")}} có một ví dụ hoạt động (sử dụng các thuộc tính viền mặt nạ có tiền tố lỗi thời được hỗ trợ trong Chromium), vì vậy bạn có thể hình dung được hiệu ứng.

> [!NOTE]
> Cần bao gồm từ khóa fill nếu bạn muốn nội dung của phần tử hiển thị.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("mask-border")}}
- {{cssxref("mask-border-mode")}}
- {{cssxref("mask-border-outset")}}
- {{cssxref("mask-border-repeat")}}
- {{cssxref("mask-border-source")}}
- {{cssxref("mask-border-width")}}
- [Mô tả minh họa của cú pháp 1 đến 4 giá trị](/vi/docs/Web/CSS/Guides/Cascade/Shorthand_properties#tricky_edge_cases)
