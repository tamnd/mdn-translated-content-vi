---
title: Declaring multiple masks
short-title: Multiple masks
slug: Web/CSS/Guides/Masking/Multiple_masks
page-type: guide
sidebar: cssref
---

CSS masking là một kỹ thuật cho phép bạn sử dụng các image làm mask để xác định phần nào của một phần tử hoàn toàn hiển thị hay bán trong suốt. CSS mask hiển thị hoặc ẩn có chọn lọc các phần của phần tử dựa trên kênh alpha và trong một số trường hợp dựa trên độ sáng của màu sắc của các mask image được áp dụng.

CSS mask ngược với mặt nạ được đeo tại các buổi dạ tiệc hóa trang. Tại dạ tiệc hóa trang, khuôn mặt của người đeo bị che giấu nơi nào mặt nạ không trong suốt và hiển thị nơi nào bạn có thể nhìn xuyên qua mặt nạ. Trong CSS, các vùng mà các mask layer tổng hợp hoàn toàn không trong suốt tiết lộ phần tử, trong khi các vùng trong suốt ẩn nó.

CSS mask được tạo thành từ một hoặc nhiều mask layer. Trong hướng dẫn này, chúng ta thảo luận về khái niệm mask layer và cách khai báo nhiều mask layer sử dụng thuộc tính shorthand {{cssxref("mask")}}.

## Hiểu về mask layer

Bạn có thể áp dụng CSS masking cho tất cả các phần tử HTML và hầu hết các phần tử SVG. Một mask có thể bao gồm một hoặc nhiều mask layer được tổng hợp. Bạn xác định nhiều layer sử dụng các giá trị phân cách bằng dấu phẩy trong thuộc tính shorthand {{cssxref("mask")}} hoặc thuộc tính {{cssxref("mask-image")}}—ngay cả giá trị được đặt thành `none` cũng được tính là một layer.

Mỗi mask layer có thể chứa một [mask image](/en-US/docs/Web/CSS/Reference/Properties/mask-image), được định vị tương đối với hộp origin của mask. Image có thể được điều chỉnh kích thước, lặp lại và cắt. Nếu bạn bao gồm nhiều hơn một mask image, bạn có thể xác định cách các mask layer được tổng hợp hay kết hợp. (Các tính năng này được giới thiệu ngắn gọn trong hướng dẫn này. Để biết thêm chi tiết và ví dụ, xem [hướng dẫn thuộc tính masking](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties).)

### Cú pháp cho nhiều mask layer

Thuộc tính shorthand `mask` chấp nhận danh sách phân cách bằng dấu phẩy các mask layer. Cú pháp cho mỗi layer có thể bao gồm các giá trị sau:

`<image> <position> / <size> <repeat> <origin> <clip> <composite> <mode>`

Tất cả các thành phần trong một mask layer là tùy chọn. Tuy nhiên, nếu bạn bỏ qua giá trị `mask-image`, nó mặc định là một image đen trong suốt, ẩn hoàn toàn phần tử trong layer đó.

Khai báo shorthand `mask` đặt giá trị cho tất cả các thuộc tính `mask-*`. Bất kỳ thành phần nào không được khai báo trong một layer sẽ mặc định về giá trị ban đầu của nó. Thuộc tính `mask` cũng đặt lại tất cả các thuộc tính `mask-border-*` về giá trị ban đầu của chúng. Một khai báo `mask` chỉ bao gồm giá trị `mask-image` đặt ngầm định các giá trị sau:

```css
mask-mode: match-source;
mask-position: 0% 0%;
mask-size: auto;
mask-repeat: repeat;
mask-origin: border-box;
mask-clip: border-box;
mask-composite: add;

mask-border-source: none;
mask-border-mode: alpha;
mask-border-outset: 0;
mask-border-repeat: stretch;
mask-border-slice: 0;
mask-border-width: auto;
```

### Xác định mask layer với `mask-image`

Miễn là khai báo thuộc tính {{cssxref("mask-image")}} phân cách bằng dấu phẩy bao gồm ít nhất một giá trị khác `none`, một mask layer được tạo cho mỗi giá trị trong khai báo, ngay cả cho các giá trị `none`. Hành vi này áp dụng cho dù bạn đang sử dụng thuộc tính `mask-image` hay shorthand `mask`. Các mask image này có thể là gradient, image, hoặc SVG source. Bạn có thể xác định chúng sử dụng [CSS gradient](/en-US/docs/Web/CSS/Guides/Images/Using_gradients), một ảnh raster (chẳng hạn như PNG), hoặc một phần tử SVG {{svgelement("mask")}}.

```css
.gradient-mask {
  mask-image: linear-gradient(to right, black, transparent);
}

.raster-mask {
  mask-image: url("alphaImage.png");
}

.mask-element-mask {
  mask-image: url("#svg-mask");
}
```

[Hướng dẫn giới thiệu về masking](/en-US/docs/Web/CSS/Guides/Masking) trình bày các loại mask image khác nhau và các chế độ của chúng.

Thuộc tính `mask-image` tương tự với thuộc tính {{cssxref("background-image")}}. Giống như với thuộc tính `background-image`, để bao gồm nhiều mask image, các giá trị image được phân cách bằng dấu phẩy.

```css
.multiple-gradient-mask {
  mask-image:
    linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%);
}
```

Mỗi mask image trong khai báo nhiều image tạo ra một mask layer. Tất cả các ví dụ trong phần này tạo ra một mask layer, ngoại trừ khai báo `multiple-gradient-mask`, tạo ra hai.

### Mask layer và từ khóa `none`

Nếu `none` là giá trị duy nhất của thuộc tính `mask-image`, không có mask layer nào được tạo và không có masking nào xảy ra.

```css
.no-masks {
  mask-image: none;
}
```

Tương tự, khi sử dụng shorthand `mask`, nếu không có giá trị `mask-image` nào ngoài `none`, không có masking nào xảy ra. Nếu bất kỳ khai báo nào sau đây được khai báo, không có mask layer nào được tạo và không có gì bị ẩn:

```css
mask: none;
mask: none 100px 100px no-repeat;
mask: 100px 100px no-repeat;
```

Nếu không, miễn là có `mask-image` được khai báo không được đặt thành `none`, một mask layer được tạo cho mỗi giá trị trong danh sách phân cách bằng dấu phẩy, ngay cả khi giá trị `mask-image` bị bỏ qua khỏi một giá trị trong danh sách phân cách bằng dấu phẩy hoặc được đặt rõ ràng thành `none`. Nói cách khác, một layer được tạo cho mỗi giá trị phân cách bằng dấu phẩy hợp lệ, trừ khi toàn bộ thuộc tính phân giải thành `none`.

```css
.masked-element {
  mask-image:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
}
```

Từ khóa `none` trong một danh sách các mask source tạo ra một mask layer, mặc dù là một layer image đen trong suốt. Bất kỳ phần tử nào có class `masked-element` sẽ có năm mask layer:

Chúng ta cũng có thể tạo các layer sử dụng shorthand `mask`:

```css
.masked-element {
  mask:
    url("alphaImage.png"), linear-gradient(to right, black, transparent),
    radial-gradient(circle, white 50%, transparent 75%), none, url("#svg-mask");
}
```

Nếu một giá trị trong danh sách phân cách bằng dấu phẩy là một image trống, tải xuống thất bại, tham chiếu đến một phần tử `<mask>` không tồn tại, hoặc không thể được hiển thị (hoặc được đặt thành `none`), nó vẫn được tính là một mask image layer, hiển thị một mask image đen trong suốt không có hiệu ứng trực quan. Nếu tất cả các giá trị làm như vậy, phần tử sẽ bị ẩn hoàn toàn.

Không có masking nào xảy ra nếu toàn bộ thuộc tính phân giải thành `none`, điều này làm cho phần tử hoàn toàn hiển thị. Mặt khác, nếu giá trị bao gồm nhiều layer và ít nhất một không phải `none`, các layer `none` không tiết lộ bất kỳ phần nào của phần tử (hoặc không làm cho bất kỳ phần nào của phần tử hiển thị). Trong ví dụ này, giá trị không phân giải thành `none`; nhưng vì tất cả các image không phải `none` đều không hợp lệ, masking xảy ra và phần tử sẽ bị ẩn hoàn toàn.

Một giá trị tính toán khác `none` tạo ra [CSS stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context).

### Cách mask layer ảnh hưởng đến các thuộc tính `mask-*`

Số lượng mask layer quan trọng khi bạn cũng đang sử dụng các thuộc tính `mask-*` riêng lẻ sau hoặc với độ đặc hiệu cao hơn khai báo `mask`.

Các thuộc tính `mask-*` bao gồm:

- {{cssxref("mask-mode")}}: Đặt chế độ của mỗi mask layer thành `alpha` hoặc `luminance`, hoặc cho phép nó mặc định theo chế độ của source bằng cách đặt giá trị thành `match-source`. Mặc định là `match-source`.

- {{cssxref("mask-position")}}: Tương tự với thuộc tính {{cssxref("background-position")}} với cú pháp tuân theo [cú pháp `<position>` của `background-position`](/en-US/docs/Web/CSS/Reference/Properties/background-position#position), nó đặt vị trí ban đầu của mask image tương đối với hộp origin của mask layer, được xác định bởi thuộc tính `mask-origin`. Bạn có thể chỉ định một, hai hoặc bốn giá trị {{cssxref("&lt;position&gt;")}}. `0% 0%` mặc định định vị góc trên bên trái của mask tại góc trên bên trái của hộp mask origin.

- {{cssxref("mask-origin")}}: Tương tự với thuộc tính {{cssxref("background-origin")}}, nó chỉ định _vùng định vị mask_, là vùng hộp mask origin trong đó một mask image được định vị. Ví dụ, nếu `mask-position` là `top left`, thuộc tính này xác định xem đó có tương đối với cạnh ngoài của border, cạnh ngoài của padding, hay cạnh ngoài của nội dung hay không.

- {{cssxref("mask-clip")}}: Tương tự với thuộc tính {{cssxref("background-clip")}}, nó xác định vùng của phần tử bị ảnh hưởng bởi một mask. Nó xác định liệu vùng vẽ mask là hộp border, padding hay nội dung, hạn chế nội dung được vẽ của phần tử trong vùng này. Nếu {{cssxref("mask-image")}} source của mask layer là một phần tử SVG `<mask>`, thuộc tính `mask-clip` không có hiệu lực.

- {{cssxref("mask-size")}}: Tương tự với thuộc tính {{cssxref("background-size")}}, điều này được sử dụng để điều chỉnh kích thước mask layer. Các giá trị có thể là một từ khóa duy nhất (`cover`, `contain`, hoặc `auto`), một length hay percentage duy nhất, hoặc hai giá trị cách nhau bởi dấu cách—mỗi giá trị có thể là length, percentage, hoặc `auto`. Mặc định là `auto`.

- {{cssxref("mask-repeat")}}: Tương tự với thuộc tính {{cssxref("background-repeat")}}, điều này xác định cách mask layer image được xếp ngói sau khi đã được điều chỉnh kích thước và định vị.

- {{cssxref("mask-composite")}}: Xác định cách một mask được kết hợp với các mask layer bên dưới nó. Mỗi mask layer được thêm vào, trừ đi, bao gồm hoặc loại trừ khỏi các mask layer đã tổng hợp trước đó bên dưới nó. Tương tự như `mask-mode`, không có thuộc tính `background-*` tương tự.

Mỗi giá trị `mask-*` trong danh sách phân cách bằng dấu phẩy của các thuộc tính thành phần `mask` áp dụng cho một mask layer riêng biệt. Như đã nêu trước đó, một phần tử có thể có nhiều mask layer được áp dụng — số lượng layer được xác định bởi số lượng giá trị phân cách bằng dấu phẩy trong các thuộc tính `mask-image` hoặc `mask`. Mỗi giá trị `mask-*` được ghép với một mask layer, theo thứ tự. Nếu số lượng giá trị trong thuộc tính `mask-*` lớn hơn số lượng mask layer, bất kỳ giá trị thừa nào bị bỏ qua. Nếu thuộc tính thành phần mask có ít giá trị hơn số lượng mask layer, các giá trị `mask-*` được lặp lại.

Để tìm hiểu thêm về các thuộc tính riêng lẻ này, xem [CSS mask properties](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties).

## Thứ tự của các thuộc tính thành phần shorthand

Đối với hầu hết, thứ tự của các thuộc tính là linh hoạt, nhưng có một vài điểm đặc biệt và ngoại lệ.

### Quy tắc thứ tự cho `mask-origin` và `mask-clip`

Giá trị `mask-origin`, được liệt kê trong cú pháp là `<origin>`, đứng trước các giá trị `mask-clip`, được liệt kê trong cú pháp là `<clip>`.

`<image> <position> / <size> <repeat> <origin> <clip> <composite> <mode>`

Cả hai đều chấp nhận các từ khóa [`<geometry-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#geometry-box). Ngoài ra, `mask-clip` cũng chấp nhận `no-clip`. Do đó, thứ tự của hai cái này quan trọng khi bạn muốn đặt `mask-clip` thành bất kỳ giá trị nào khác ngoài `no-clip`.

- Nếu một giá trị `<geometry-box>` có mặt cùng với từ khóa `no-clip`, thì `<geometry-box>` đặt giá trị `mask-origin`, và `mask-clip` được đặt thành `no-clip`. Trong trường hợp này, thứ tự không quan trọng.

- Nếu chỉ có một giá trị `<geometry-box>` có mặt và không có từ khóa `no-clip`, cả hai thành phần `mask-origin` và `mask-clip` đều được đặt thành giá trị đó. Vì chỉ có một giá trị, một lần nữa thứ tự không quan trọng.

- Nếu hai giá trị `<geometry-box>` có mặt, giá trị đầu tiên đặt thành phần `mask-origin` và giá trị thứ hai đặt thành phần `mask-clip`. Trong trường hợp này, thứ tự rất quan trọng.

Đặt thứ tự không đúng cho các giá trị `mask-origin` và `mask-clip` có thể ảnh hưởng đến giao diện, nhưng sẽ không làm cho khai báo thất bại.

### Quy tắc thứ tự cho `mask-size` và `mask-position`

Bạn có thể đã chú ý đến dấu gạch chéo giữa `mask-position` và `mask-size`, được liệt kê trong cú pháp là `<position>` và `<size>`. Cả hai thuộc tính đều chấp nhận các giá trị tương tự.

`<image> <position> / <size> <repeat> <origin> <clip> <composite> <mode>`

Trong trường hợp này, thứ tự rất quan trọng. Nếu chỉ có một hoặc một cặp giá trị {{cssxref("length-percentage")}} có mặt, nó sẽ xác định vị trí của image thay vì kích thước. Bao gồm cả vị trí và kích thước trong một mask layer mà không bao gồm dấu gạch chéo giữa hai cái sẽ làm mất hiệu lực toàn bộ khai báo.

```css
mask:
  url("star.svg") bottom 2em right 4em / auto 2vw no-repeat padding-box
    content-box luminance,
  url("circle.svg") 100px 100px / 50% repeat-x border-box padding-box alpha;
```

Nếu một cặp giá trị `<length-percentage>` duy nhất có mặt, nó đặt thuộc tính `mask-position`, và `mask-size` sẽ là `auto`. Nếu một layer bao gồm cả `mask-size` và `mask-position`, giá trị thuộc tính `mask-size` phải đứng sau giá trị thuộc tính `mask-position` và các giá trị phải được phân cách bởi dấu gạch chéo (`/`). Dấu gạch chéo là bắt buộc ngay cả khi `mask-size` được đặt thành một giá trị không phải là giá trị `mask-position` hợp lệ.

```css example-bad
mask: url("star.svg") contain;
mask: url("star.svg") 10px 10px cover;
mask: url("star.svg") top right 100px 100px;
```

```css example-good
mask: url("star.svg") 10px 10px / cover;
mask: url("star.svg") top 100px right 100px;
mask: url("star.svg") top right / 100px 100px;
```

Để bao gồm `mask-size` trong một mask layer sử dụng shorthand `mask`, bạn phải bao gồm giá trị `mask-position` với dấu gạch chéo ngay trước nó.

> [!WARNING]
> Nếu bạn bao gồm size trong một mask layer nhưng quên dấu gạch chéo sau position, toàn bộ khai báo sẽ trở nên không hợp lệ.

## Xem thêm

- [Giới thiệu về CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
- [CSS mask properties](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Giới thiệu về CSS clipping](/en-US/docs/Web/CSS/Guides/Masking/Clipping)
- [CSS masking](/en-US/docs/Web/CSS/Guides/Masking) module
