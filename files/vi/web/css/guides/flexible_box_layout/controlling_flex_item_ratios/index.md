---
title: Controlling ratios of flex items along the main axis
short-title: Controlling flex item ratios
slug: Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios
page-type: guide
sidebar: cssref
---

Trong hướng dẫn này, chúng ta khám phá ba thuộc tính kiểm soát kích thước và tính linh hoạt của flex item theo main axis: {{CSSxRef("flex-grow")}}, {{CSSxRef("flex-shrink")}} và {{CSSxRef("flex-basis")}}. Hiểu đầy đủ cách các thuộc tính này hoạt động với việc phát triển và co lại các phần tử là chìa khóa để làm chủ [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout).

## Tổng quan

Ba thuộc tính của chúng ta kiểm soát các khía cạnh sau về tính linh hoạt của flex item:

- `flex-grow`: Phần tử này nhận được bao nhiêu positive free space?
- `flex-shrink`: Bao nhiêu negative free space có thể được lấy đi từ phần tử này?
- `flex-basis`: Kích thước của phần tử trước khi phát triển và co lại xảy ra là gì?

Các thuộc tính thường được biểu đạt bằng shorthand {{CSSxRef("flex")}}. Đoạn code sau sẽ đặt thuộc tính `flex-grow` thành `2`, `flex-shrink` thành `1` và `flex-basis` thành `auto`.

```css
.item {
  flex: 2 1 auto;
}
```

## Các khái niệm quan trọng khi làm việc trên main axis

Để hiểu các thuộc tính `flex`, hữu ích khi biết _kích thước tự nhiên_ của flex item trước khi bất kỳ việc phát triển hoặc co lại nào xảy ra. Ngoài ra, điều quan trọng là phải hiểu khái niệm _free space_, là sự khác biệt giữa tổng kích thước tự nhiên của tất cả các flex item dọc theo main axis và kích thước của chính main axis.

### Định kích thước flex item

Để xác định có bao nhiêu không gian để bố cục flex item, trình duyệt cần biết phần tử có kích thước bao lớn để bắt đầu. Điều này được tính như thế nào với các phần tử không có chiều rộng hoặc chiều cao được áp dụng bằng đơn vị độ dài tuyệt đối?

Trong CSS, các từ khóa {{CSSxRef("min-content")}} và {{CSSxRef("max-content")}} có thể được dùng thay cho đơn vị {{cssxref("length")}}. Nói chung, `min-content` là kích thước nhỏ nhất mà một phần tử có thể là trong khi vẫn vừa được từ dài nhất, và `max-content` là kích thước mà phần tử cần để vừa tất cả nội dung mà không bao quanh.

Ví dụ bên dưới chứa hai phần tử đoạn văn với các chuỗi văn bản khác nhau. Đoạn văn đầu tiên có chiều rộng `min-content`. Chú ý rằng văn bản đã sử dụng tất cả các cơ hội soft-wrapping sẵn có, trở nên nhỏ nhất có thể mà không tràn ra. Đây là kích thước `min-content` của chuỗi đó. Về cơ bản, từ dài nhất trong chuỗi đang xác định kích thước.

Đoạn văn thứ hai, với giá trị `max-content`, làm điều ngược lại. Nó phát triển to bằng cần thiết để vừa nội dung mà không tận dụng các cơ hội soft-wrapping. Nó sẽ tràn ra hộp chứa nó nếu container đó quá hẹp.

```html live-sample___min-max-content
<p class="min-content">
  I am sized with min-content and so I will take all of the soft-wrapping
  opportunities.
</p>
<p class="max-content">
  I am sized with max-content and so I will take none of the soft-wrapping
  opportunities.
</p>
```

```css live-sample___min-max-content
.min-content {
  width: min-content;
  border: 2px dotted rgb(96 139 168);
}
.max-content {
  width: max-content;
  border: 2px dotted rgb(96 139 168);
}
```

{{EmbedLiveSample("min-max-content", "", "260px")}}

Hãy nhớ hành vi này và những hiệu ứng `min-content` và `max-content` có khi chúng ta khám phá `flex-grow` và `flex-shrink` sau này trong bài viết này.

### Positive và negative free space

Chúng ta cũng cần hiểu khái niệm **positive và negative free space**. Khi flex container có _positive free space_, nó có nhiều không gian hơn cần thiết để hiển thị các flex item bên trong container. Ví dụ, một container rộng `500px`, với {{CSSxRef("flex-direction")}} được đặt thành `row` và chứa ba flex item rộng `100px` có `200px` positive free space. Positive free space này có thể được phân bổ giữa các phần tử nếu muốn lấp đầy container.

![Hình ảnh cho thấy không gian còn lại sau khi các phần tử được hiển thị.](basics7.png)

Flex container có _negative free space_ khi tổng giá trị kích thước tự nhiên của các flex item lớn hơn không gian sẵn có trong flex container. Nếu ba flex item trong ví dụ container rộng `500px` ở trên mỗi cái rộng `200px` thay vì `100px`, tổng chiều rộng tự nhiên của chúng là `600px`, dẫn đến `100px` negative free space. Không gian này có thể được lấy đi từ các phần tử để làm cho chúng vừa vào container, hoặc các phần tử sẽ tràn ra.

![Các phần tử tràn ra khỏi container](ratios1.png)

Chúng ta cần hiểu việc phân bổ positive free space và loại bỏ negative free space này để tìm hiểu về các thành phần thuộc tính của shorthand `flex`.

Trong các ví dụ sau, {{CSSxRef("flex-direction")}} được đặt thành `row`, vì vậy kích thước của các phần tử sẽ được xác định bởi chiều rộng của chúng. Chúng ta sẽ tính toán positive và negative free space bằng cách so sánh tổng chiều rộng của tất cả các phần tử với chiều rộng của container. Bạn cũng có thể thử mỗi ví dụ với `flex-direction: column`. Main axis sau đó sẽ là cột, và bạn sẽ so sánh chiều cao của các phần tử và container của chúng để tính toán positive và negative free space.

## Thuộc tính `flex-basis`

Thuộc tính {{CSSxRef("flex-basis")}} chỉ định kích thước ban đầu của flex item trước khi bất kỳ việc phân bổ positive hoặc negative free space nào xảy ra. Giá trị ban đầu của thuộc tính này là `auto`. Thuộc tính này chấp nhận các giá trị giống như các thuộc tính {{cssxref("width")}} và {{cssxref("height")}}, và nó cũng chấp nhận từ khóa `content`.

Nếu `flex-basis` được đặt thành `auto`, kích thước ban đầu của phần tử là kích thước {{cssxref("length-percentage")}} của kích thước chính, nếu có được đặt. Ví dụ, nếu phần tử có `width: 200px` được đặt, thì `200px` sẽ là `flex-basis` cho phần tử này. Các giá trị phần trăm tương đối với kích thước main axis bên trong của flex container. Nếu `width: 50%` được đặt, `flex-basis` cho phần tử này sẽ là một nửa chiều rộng content-box của container. Nếu không có kích thước nào như vậy được đặt, có nghĩa là phần tử được định kích thước tự động, thì `auto` phân giải thành kích thước nội dung (xem thảo luận về [định kích thước `min-` và `max-content`](#flex_item_sizing) ở trên), có nghĩa là `flex-basis` là kích thước `max-content` của phần tử.

Ví dụ này chứa ba flex item không linh hoạt, với cả `flex-grow` và `flex-shrink` được đặt thành `0`. Phần tử đầu tiên, có chiều rộng tường minh là `150px`, nhận `flex-basis` là `150px`, trong khi hai phần tử còn lại không có chiều rộng được đặt và vì vậy được định kích thước theo chiều rộng nội dung hoặc `max-content`.

```html live-sample___flex-basis
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```

```css live-sample___flex-basis
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 0 0 auto;
}

.box {
  width: 500px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
}

.box :first-child {
  width: 150px;
}
```

{{EmbedLiveSample("flex-basis")}}

Ngoài từ khóa `auto` và bất kỳ giá trị {{cssxref("width")}} hợp lệ nào khác, bạn có thể sử dụng từ khóa `content` làm `flex-basis`. Điều này dẫn đến `flex-basis` dựa trên kích thước nội dung, ngay cả khi có `width` được đặt trên phần tử. Điều này tạo ra cùng hiệu ứng như việc xóa bất kỳ chiều rộng nào được đặt và sử dụng `auto` làm `flex-basis`. Mặc dù tương tự như đặt `max-content`, giá trị `content` cho phép bất kỳ {{cssxref("aspect-ratio")}} nào được tính toán dựa trên kích thước cross axis.

Để hoàn toàn bỏ qua kích thước của flex item trong quá trình phân bổ không gian, đặt `flex-basis` thành `0` và đặt giá trị `flex-grow` khác không. Hãy tìm hiểu `flex-grow` trước khi xem giá trị này trong thực tế.

## Thuộc tính `flex-grow`

Thuộc tính {{CSSxRef("flex-grow")}} chỉ định **flex grow factor**, xác định mức độ flex item sẽ phát triển tương đối so với các flex item khác trong flex container khi positive free space được phân bổ.

Nếu tất cả các phần tử có cùng flex grow factor, positive free space sẽ được phân bổ đều giữa chúng. Đối với tình huống này, thực hành phổ biến là đặt `flex-grow: 1`, nhưng bạn có thể cho chúng bất kỳ giá trị nào, chẳng hạn `88`, `100` hoặc `1.2`; đây là tỷ lệ. Nếu factor giống nhau cho tất cả flex item trong container và có positive free space, không gian đó sẽ được phân bổ đều.

### Kết hợp `flex-grow` và `flex-basis`

Mọi thứ có thể trở nên khó hiểu về cách `flex-grow` và `flex-basis` tương tác. Hãy xem xét trường hợp ba flex item có độ dài nội dung khác nhau và các quy tắc `flex` sau được áp dụng cho chúng:

```css
.class {
  flex: 1 1 auto;
}
```

Trong trường hợp này, giá trị `flex-basis` là `auto` và các phần tử không có chiều rộng được đặt, vì vậy chúng được định kích thước tự động. Điều này có nghĩa là `flex-basis` được sử dụng là kích thước `max-content` của mỗi phần tử. Sau khi bố cục các phần tử, có một số positive free space trong flex container, được hiển thị trong hình ảnh bên dưới dưới dạng vùng gạch chéo; vùng gạch chéo là positive free space sẽ được phân bổ giữa ba phần tử dựa trên flex grow factor của chúng:

![Ba phần tử chiếm hơn một nửa chiều rộng, với phần còn lại của chiều rộng được gạch chéo](ratios2.png)

Chúng ta đang làm việc với `flex-basis` bằng kích thước nội dung. Điều này có nghĩa là không gian sẵn có để phân bổ được trừ từ tổng không gian sẵn có (chiều rộng của flex container), và không gian còn lại sau đó được chia đều giữa ba phần tử. Phần tử lớn nhất vẫn là lớn nhất vì nó bắt đầu từ kích thước lớn hơn, ngay cả khi nó có cùng lượng không gian dự phòng như các phần tử khác:

![Vùng gạch chéo được chia thành ba phần, với mỗi phần tử nhận một phần được thêm vào.](ratios3.png)

Để tạo ba phần tử có kích thước bằng nhau, ngay cả khi các phần tử ban đầu có kích thước khác nhau, đặt thành phần `flex-basis` thành `0`:

```css
.class {
  flex: 1 1 0;
}
```

Ở đây, cho mục đích tính toán phân bổ không gian, chúng ta đang đặt kích thước của mỗi phần tử thành `0`. Điều này có nghĩa là tất cả không gian có thể phân bổ. Vì tất cả các phần tử có cùng flex grow factor, chúng nhận được lượng không gian bằng nhau. Kết quả là ba flex item có chiều rộng bằng nhau.

Hãy thử thay đổi flex grow factor từ 1 thành 0 trong ví dụ live này để xem hành vi khác nhau:

```html live-sample___flex-grow
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three has more content</div>
</div>
```

```css live-sample___flex-grow
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 1 1 0;
}

.box {
  width: 400px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
}
```

{{EmbedLiveSample("flex-grow")}}

### Cho các phần tử flex-grow factor khác nhau

Sử dụng `flex-grow` và `flex-basis` cùng nhau cho phép chúng ta kiểm soát kích thước từng phần tử riêng lẻ bằng cách đặt các flex grow factor khác nhau. Nếu chúng ta giữ `flex-basis` ở `0` để tất cả không gian có thể phân bổ, chúng ta có thể tạo các flex item có kích thước khác nhau bằng cách gán cho mỗi phần tử một flex grow factor khác nhau.

Trong ví dụ bên dưới, chúng ta sử dụng `1` làm flex grow factor cho hai phần tử đầu tiên và tăng gấp đôi lên `2` cho phần tử thứ ba. Với `flex-basis: 0` được đặt trên tất cả các phần tử, không gian sẵn có được phân bổ như sau:

1. Các giá trị flex grow factor của tất cả các flex item anh em được cộng lại (tổng là 4 trong trường hợp này).
2. Positive free space trong flex container được chia cho giá trị tổng này.
3. Free space được phân bổ theo các giá trị riêng lẻ. Trong trường hợp này, phần tử đầu tiên nhận một phần, phần tử thứ hai một phần, và phần tử thứ ba hai phần. Điều này có nghĩa là phần tử thứ ba có kích thước gấp đôi phần tử đầu tiên và thứ hai.

```html live-sample___flex-grow-ratios
<div class="box">
  <div class="one">One</div>
  <div class="two">Two</div>
  <div class="three">Three</div>
</div>
```

```css live-sample___flex-grow-ratios
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 1 1 0;
}

.box {
  border: 2px dotted rgb(96 139 168);
  display: flex;
}

.one {
  flex: 1 1 0;
}

.two {
  flex: 1 1 0;
}

.three {
  flex: 2 1 0;
}
```

{{EmbedLiveSample("flex-grow-ratios")}}

Hãy nhớ rằng bạn có thể sử dụng bất kỳ giá trị dương nào ở đây. Điều quan trọng là tỷ lệ giữa các phần tử. Bạn có thể sử dụng các số lớn hoặc số thập phân; tùy bạn. Để kiểm tra điều này, hãy thay đổi các giá trị `flex-grow` trong ví dụ trên thành `.25`, `.25` và `.50`. Bạn sẽ thấy kết quả giống nhau.

## Thuộc tính `flex-shrink`

Thuộc tính {{CSSxRef("flex-shrink")}} chỉ định **flex shrink factor**, xác định mức độ flex item sẽ co lại tương đối so với các flex item còn lại trong flex container khi negative free space được phân bổ.

Thuộc tính này xử lý các tình huống trong đó tổng giá trị `flex-basis` của các flex item quá lớn để vừa trong flex container và sẽ tràn ra. Miễn là `flex-shrink` của một phần tử là một giá trị dương, phần tử sẽ co lại để không tràn ra khỏi container.

Trong khi `flex-grow` được dùng để thêm không gian sẵn có vào các phần tử có thể phát triển, `flex-shrink` được dùng để lấy đi không gian để đảm bảo các phần tử vừa vào container mà không tràn ra.

Trong ví dụ này, có ba flex item rộng `200px` trong container rộng `500px`. Với `flex-shrink` được đặt thành `0`, các phần tử không được phép co lại, khiến chúng tràn ra khỏi container.

```html live-sample___flex-shrink
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three has more content</div>
</div>
```

```css live-sample___flex-shrink
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 0 0 auto;
  width: 200px;
}

.box {
  width: 500px;
  border: 2px dotted rgb(96 139 168);
  display: flex;
}
```

{{EmbedLiveSample("flex-shrink")}}

Thay đổi giá trị `flex-shrink` thành `1`; mỗi phần tử sẽ co lại cùng một lượng, vừa tất cả các phần tử vào container. Negative free space đã được lấy đi tỷ lệ từ mỗi phần tử, làm cho mỗi flex item nhỏ hơn chiều rộng ban đầu của nó.

### Kết hợp `flex-shrink` và `flex-basis`

Có vẻ như `flex-shrink` hoạt động theo cùng cách như `flex-grow`, bằng cách co lại thay vì phát triển các phần tử. Tuy nhiên có một số khác biệt quan trọng cần lưu ý.

Khái niệm [flex base size](#what_determines_the_base_size_of_an_item) ảnh hưởng đến cách negative space được phân bổ giữa các flex item. Flex shrink factor được nhân với flex base size khi phân bổ negative space. Điều này phân bổ negative space tỷ lệ với mức độ phần tử có thể co lại. Vì vậy, ví dụ, một phần tử nhỏ sẽ không co lại về không trước khi một phần tử lớn hơn đã giảm đáng kể.

Các phần tử nhỏ sẽ không co lại xuống dưới kích thước `min-content` của chúng, đây là kích thước nhỏ nhất mà phần tử có thể là nếu nó sử dụng tất cả các cơ hội soft wrapping sẵn có.

Ví dụ này minh họa việc sàn `min-content`, với `flex-basis` phân giải thành kích thước của nội dung. Nếu bạn thay đổi chiều rộng trên flex container, chẳng hạn tăng lên `700px`, và sau đó giảm chiều rộng flex item, bạn có thể thấy rằng hai phần tử đầu tiên sẽ bao quanh. Tuy nhiên, chúng sẽ không bao giờ nhỏ hơn kích thước `min-content` của chúng. Khi container nhỏ lại, không gian chỉ bị lấy đi từ phần tử thứ ba khi co lại thêm.

```html live-sample___flex-shrink-min-content
<div class="box">
  <div>Item One</div>
  <div>Item Two</div>
  <div>Item Three has more content and so has a larger size</div>
</div>
```

```css live-sample___flex-shrink-min-content
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  flex: 1 1 auto;
}

.box {
  border: 2px dotted rgb(96 139 168);
  width: 500px;
  display: flex;
}
```

{{EmbedLiveSample("flex-shrink-min-content")}}

Trong thực tế, hành vi co lại này cung cấp kết quả hợp lý. Nó ngăn nội dung biến mất hoàn toàn và trở nên nhỏ hơn kích thước nội dung tối thiểu. Các quy tắc trên hợp lý cho nội dung cần co lại để vừa vào container.

### Cho các phần tử `flex-shrink` factor khác nhau

Giống như với `flex-grow`, bạn có thể cho các flex item các flex shrink factor khác nhau. Điều này có thể giúp thay đổi hành vi mặc định nếu, ví dụ, bạn muốn một phần tử co lại nhanh hơn hoặc chậm hơn các phần tử anh em hoặc không co lại chút nào.

Trong ví dụ này, phần tử đầu tiên có flex shrink factor là `1`, phần tử thứ hai `0` (vì vậy nó sẽ không co lại chút nào), và phần tử thứ ba `4`, tạo ra tổng `5` shrink factor. Phần tử thứ ba, do đó, co lại xấp xỉ bốn lần nhanh hơn phần tử đầu tiên, nhưng cả hai sẽ không co lại dưới chiều rộng `min-content` của chúng. Hãy thử nghiệm với các giá trị khác nhau: cũng như với `flex-grow`, bạn có thể sử dụng số thập phân hoặc số lớn hơn ở đây.

```html live-sample___flex-shrink-ratios
<div class="box">
  <div class="one">One</div>
  <div class="two">Two</div>
  <div class="three">Three</div>
</div>
```

```css live-sample___flex-shrink-ratios
.box > * {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  width: 200px;
}

.box {
  display: flex;
  width: 500px;
  border: 2px dotted rgb(96 139 168);
}

.one {
  flex: 1 1 auto;
}

.two {
  flex: 1 0 auto;
}

.three {
  flex: 2 4 auto;
}
```

{{EmbedLiveSample("flex-shrink-ratios")}}

## Làm chủ việc định kích thước flex item

Để hiểu cách định kích thước flex item hoạt động, bạn cần xem xét các yếu tố bên dưới, mà chúng ta đã thảo luận trong các hướng dẫn này:

### Điều gì xác định kích thước cơ sở của một phần tử?

- `flex-basis` được đặt thành `auto`, và phần tử có chiều rộng được đặt không? Nếu vậy, kích thước sẽ dựa trên chiều rộng đó.
- `flex-basis` được đặt thành `auto`, nhưng phần tử không có chiều rộng được đặt không? Nếu vậy, kích thước sẽ dựa trên kích thước nội dung của phần tử.
- `flex-basis` là một độ dài hoặc phần trăm, nhưng không phải không? Nếu vậy, đây sẽ là kích thước của phần tử (sàn tại `min-content`).
- `flex-basis` được đặt thành `0` không? Nếu vậy, kích thước của phần tử sẽ không được tính đến trong tính toán chia sẻ không gian.

### Có không gian sẵn có không?

Các phần tử chỉ có thể phát triển nếu có positive free space, và chúng sẽ không co lại trừ khi có negative free space.

- Nếu chúng ta cộng chiều rộng của tất cả các phần tử (hoặc chiều cao nếu làm việc theo cột), tổng đó có **ít hơn** tổng chiều rộng (hoặc chiều cao) của container không? Nếu vậy, sẽ có positive free space và `flex-grow` sẽ phát huy tác dụng.
- Nếu chúng ta cộng chiều rộng của tất cả các phần tử (hoặc chiều cao nếu làm việc theo cột), tổng đó có **nhiều hơn** tổng chiều rộng (hoặc chiều cao) của container không? Nếu vậy, sẽ có negative free space và `flex-shrink` sẽ phát huy tác dụng.

### Các cách khác để phân bổ không gian là gì?

Nếu bạn không muốn không gian được thêm vào các phần tử, hãy nhớ rằng bạn có thể quản lý free space giữa hoặc xung quanh các phần tử bằng cách sử dụng các thuộc tính alignment được mô tả trong hướng dẫn căn chỉnh các phần tử trong flex container. Thuộc tính {{CSSxRef("justify-content")}} sẽ cho phép phân bổ free space giữa hoặc xung quanh các phần tử. Bạn cũng có thể sử dụng auto margin trên flex item để hấp thụ không gian và tạo khoảng cách giữa các phần tử.

Với tất cả các thuộc tính flex này sẵn dùng cho bạn, bạn sẽ thấy rằng hầu hết các tác vụ bố cục đều có thể thực hiện được, mặc dù ban đầu có thể cần một ít thực nghiệm.
