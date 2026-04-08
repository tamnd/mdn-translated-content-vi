---
title: CSS box alignment overview
short-title: Overview
slug: Web/CSS/Guides/Box_alignment/Overview
page-type: guide
sidebar: cssref
---

Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) xác định các tính năng CSS liên quan đến việc căn chỉnh các hộp (box) trong các mô hình bố cục hộp CSS khác nhau. Module này nhằm tạo ra một phương pháp căn chỉnh nhất quán trong toàn bộ CSS. Các thuộc tính CSS box alignment cung cấp khả năng căn chỉnh theo chiều ngang và chiều dọc đầy đủ.

Hướng dẫn này trình bày chi tiết các khái niệm chung trong module này. Các hướng dẫn bổ sung cung cấp thêm thông tin về box alignment trong [flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox), [grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout), [multiple-column layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_multi-column_layout), và [block, absolutely positioned and table layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables). Căn chỉnh văn bản được đề cập trong các module [CSS text](/en-US/docs/Web/CSS/Guides/Text) và [CSS inline layout](/en-US/docs/Web/CSS/Guides/Inline_layout).

## Khái niệm và thuật ngữ cơ bản

Đặc tả đưa ra một số thuật ngữ căn chỉnh để dễ dàng thảo luận về các thuộc tính căn chỉnh này ngoài việc triển khai trong một phương pháp bố cục cụ thể. Ngoài ra còn có một số khái niệm cơ bản chung cho tất cả các phương pháp bố cục.

### Mối quan hệ với writing modes

Căn chỉnh có liên hệ với writing modes ở chỗ khi chúng ta căn chỉnh một phần tử, chúng ta không xem xét việc căn chỉnh theo các kích thước vật lý là trên, phải, dưới và trái. Thay vào đó, chúng ta mô tả căn chỉnh theo điểm đầu và điểm cuối của chiều cụ thể đang làm việc. Điều này đảm bảo rằng căn chỉnh hoạt động giống nhau bất kể writing mode nào mà tài liệu sử dụng.

### Hai chiều của căn chỉnh

Khi sử dụng các thuộc tính box alignment, bạn sẽ căn chỉnh nội dung trên một trong hai trục — trục inline (hoặc trục chính - main axis), và trục block (hoặc trục chéo - cross axis). Trục inline là trục mà các từ trong một câu chạy theo trong writing mode đang sử dụng. Với tiếng Anh chẳng hạn, trục inline là chiều ngang. Trục block là trục mà các block, chẳng hạn như các phần tử đoạn văn, được bố trí; nó chạy vuông góc với trục inline.

![Trục inline là chiều trái / phải, hay chiều ngang. Trục block là chiều dọc, hoặc trên / dưới.](two-axes.png)

Khi căn chỉnh các phần tử trên trục inline, bạn sẽ dùng các thuộc tính bắt đầu bằng `justify-`:

- {{cssxref("justify-items")}}
- {{cssxref("justify-self")}}
- {{cssxref("justify-content")}}

Khi căn chỉnh các phần tử trên trục block, bạn sẽ dùng các thuộc tính bắt đầu bằng `align-`:

- {{cssxref("align-items")}}
- {{cssxref("align-self")}}
- {{cssxref("align-content")}}

Flexbox có thêm một điểm phức tạp: điều trên đúng khi {{cssxref("flex-direction")}} được đặt thành `row`. Các thuộc tính bị hoán đổi khi flexbox được đặt thành `column`. Do đó, khi làm việc với flexbox, thường dễ hơn khi nghĩ về trục chính và trục chéo thay vì trục inline và trục block. Các thuộc tính `justify-` luôn được dùng để căn chỉnh trên trục chính, các thuộc tính `align-` trên trục chéo.

### Đối tượng căn chỉnh (alignment subject)

**{{Glossary("alignment subject")}}** là thứ đang được căn chỉnh. Đối với `justify-self` hoặc `align-self`, hoặc khi thiết lập các giá trị này theo nhóm bằng `justify-items` hoặc `align-items`, đây sẽ là margin box của phần tử mà thuộc tính này đang được áp dụng. Các thuộc tính `justify-content` và `align-content` khác nhau tùy theo phương pháp bố cục.

### Vùng chứa căn chỉnh (alignment container)

**{{Glossary("alignment container")}}** là hộp mà đối tượng được căn chỉnh bên trong. Thông thường đây là containing block của alignment subject. Một alignment container có thể chứa một hoặc nhiều alignment subject.

Hình dưới đây cho thấy một alignment container với hai alignment subject bên trong.

![Một hộp chứa hai hình chữ nhật có cùng chiều rộng nhưng chiều cao khác nhau. Hai hình chữ nhật được căn chỉnh theo đỉnh, có nghĩa là cả hai đều có đường trên cách khoảng 10px phía trong so với cạnh trên của hộp chứa chúng.](align-container-subjects.png)

## Các loại căn chỉnh

Có ba loại căn chỉnh khác nhau mà đặc tả mô tả; chúng sử dụng các giá trị từ khóa.

- [Positional alignment](#positional_alignment)
- [Baseline alignment](#baseline_alignment)
- [Distributed alignment](#distributed_alignment)

### Positional alignment

**Positional alignment** là vị trí của alignment subject so với alignment container của nó. Các giá trị từ khóa positional alignment được định nghĩa cho căn chỉnh theo vị trí, và có thể được dùng làm giá trị cho content alignment với `justify-content` và `align-content`, cũng như self alignment với `justify-self` và `align-self`.

- `center`
- `start`
- `end`
- `self-start`
- `self-end`
- `flex-start` chỉ dành cho flexbox
- `flex-end` chỉ dành cho flexbox
- `left`
- `right`

Ngoài các giá trị vật lý là `left` và `right` liên quan đến các thuộc tính vật lý của màn hình, tất cả các giá trị khác — các giá trị {{cssxref("self-position")}} và {{cssxref("content-position")}} — đều là giá trị logic và liên quan đến writing mode của nội dung.

Ví dụ, khi làm việc trong CSS grid layout, nếu bạn đang dùng tiếng Anh và đặt `justify-content` thành `start`, các phần tử sẽ di chuyển theo chiều inline về phía đầu, tức là bên trái vì các câu tiếng Anh bắt đầu ở phía bên trái trang. Nếu bạn dùng tiếng Ả Rập, ngôn ngữ viết từ phải sang trái, thì cùng giá trị `start` sẽ khiến các phần tử di chuyển sang phải, vì các câu tiếng Ả Rập bắt đầu ở phía bên phải trang.

![Có hai hộp, mỗi hộp có 3 phần tử con có chiều cao khác nhau nhưng chiều rộng tương tự. Hộp đầu tiên có ba phần tử con với các chữ A, B và C. Ba hộp này đều căn trái. Hộp thứ hai có ba phần tử con với các chữ Ả Rập. Ba hộp đó đều căn phải.](writing-mode-start.png)

Cả hai đều có `justify-content: start`, nhưng vị trí của hai điểm đầu khác nhau do writing mode.

### Baseline alignment

**Baseline alignment** là mối quan hệ giữa các đường baseline của nhiều alignment subject trong cùng một ngữ cảnh căn chỉnh. Các từ khóa {{cssxref("baseline-position")}} của baseline alignment được dùng để căn chỉnh các đường baseline của các hộp trong một nhóm alignment subject. Chúng có thể được dùng làm giá trị cho content alignment với `justify-content` và `align-content`, và self-alignment với `justify-self` và `align-self`.

- `baseline`
- `first baseline`
- `last baseline`

Baseline content alignment — chỉ định một giá trị baseline alignment cho `justify-content` hoặc `align-content` — hoạt động trong các phương pháp bố cục sắp xếp các phần tử theo hàng. Các alignment subject được căn chỉnh theo baseline với nhau bằng cách thêm padding bên trong các hộp.

Baseline self-alignment dịch chuyển các hộp để căn chỉnh theo baseline bằng cách thêm margin bên ngoài các hộp. Self-alignment được thực hiện cho từng hộp riêng lẻ bằng `justify-self` hoặc `align-self`, hoặc cho các nhóm hộp bằng `justify-items` và `align-items`.

### Distributed alignment

**Distributed alignment** định nghĩa căn chỉnh như là phân phối không gian giữa các alignment subject. Các từ khóa {{cssxref("content-distribution")}} của distributed alignment được dùng với các thuộc tính `align-content` và `justify-content`. Các từ khóa này xác định điều gì xảy ra với bất kỳ khoảng trống nào còn lại sau khi các alignment subject đã được hiển thị. Các giá trị như sau:

- `stretch`
- `space-between`
- `space-around`
- `space-evenly`

Ví dụ, trong Flex Layout, các phần tử ban đầu được căn chỉnh với `flex-start`. Làm việc trong writing mode ngang từ trên xuống dưới (với ngôn ngữ như tiếng Anh), với `flex-direction` được đặt thành `row`, các phần tử bắt đầu ở phía ngoài cùng bên trái, và bất kỳ khoảng trống nào sau khi hiển thị các phần tử sẽ được đặt sau chúng.

![Ba hình chữ nhật có chiều rộng khác nhau nằm trong một hộp. Tất cả đều căn theo cạnh trái của hộp chứa, với khoảng cách khoảng 10px giữa chúng, và 10px giữa cạnh trái của hình chữ nhật đầu tiên và container cha.](justify-content-start.png)

Nếu bạn đặt `justify-content: space-between` trên flex container, khoảng trống có sẵn được phân chia đều và đặt giữa các phần tử.

![Ba hình chữ nhật có chiều rộng khác nhau nằm trong một hộp. Hình chữ nhật đầu tiên căn theo cạnh trái của hộp chứa, hình chữ nhật thứ ba căn phải, và hình chữ nhật ở giữa được đặt cách đều giữa hình đầu và hình cuối.](justify-content-space-between.png)

Để các từ khóa này có hiệu lực, cần có khoảng trống theo chiều mà bạn muốn căn chỉnh các phần tử. Nếu không có khoảng trống, không có gì để phân phối.

### Ví dụ cơ bản

Các ví dụ sau đây minh họa cách một số thuộc tính box alignment được áp dụng trong [Grid](/en-US/docs/Web/CSS/Guides/Grid_layout) và [Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout).

#### Ví dụ căn chỉnh trong CSS grid layout

Trong ví dụ grid layout này, có khoảng trống thừa trong grid container sau khi bố trí các track có chiều rộng cố định trên trục inline (trục chính). Khoảng trống này được phân phối bằng {{cssxref("justify-content")}}. Trên trục block (trục chéo), việc căn chỉnh các phần tử bên trong các grid area của chúng được kiểm soát bằng {{cssxref("align-items")}}. Phần tử đầu tiên ghi đè giá trị `align-items` được đặt trên nhóm bằng cách đặt {{cssxref("align-self")}} thành `center`.

```html live-sample___grid-align-items
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three <br />has <br />extra <br />text</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
</div>
```

```css hidden live-sample___grid-align-items
body {
  font: 1.2em sans-serif;
}

.box {
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

```css live-sample___grid-align-items
.box {
  display: grid;
  grid-template-columns: 120px 120px 120px;
  align-items: start;
  justify-content: space-between;
}

.box :first-child {
  align-self: center;
}
```

{{EmbedLiveSample("grid-align-items", "", "200px")}}

#### Ví dụ căn chỉnh trong Flexbox

Trong ví dụ này, ba flex item được căn chỉnh trên trục chính bằng `justify-content` và trên trục chéo bằng `align-items`. Phần tử đầu tiên ghi đè giá trị `align-items` được đặt trên nhóm bằng cách đặt `align-self` thành `center`.

```html live-sample___flex-align-items
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three <br />has <br />extra <br />text</div>
</div>
```

```css hidden live-sample___flex-align-items
body {
  font: 1.2em sans-serif;
}

.box {
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

```css live-sample___flex-align-items
.box {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
}

.box :first-child {
  align-self: center;
}
```

{{EmbedLiveSample("flex-align-items")}}

## Overflow alignment

Các từ khóa {{cssxref("overflow-position")}} `safe` và `unsafe` giúp xác định hành vi khi alignment subject lớn hơn alignment container. Từ khóa `safe` sẽ căn chỉnh về `start` trong trường hợp việc căn chỉnh được chỉ định gây ra tràn, với mục tiêu tránh "mất dữ liệu" khi một phần của phần tử nằm ngoài ranh giới của alignment container và không thể cuộn đến được.

Nếu bạn chỉ định `unsafe`, việc căn chỉnh vẫn sẽ được thực hiện ngay cả khi nó gây ra mất dữ liệu như vậy.

## Khoảng cách giữa các hộp

Đặc tả box alignment cũng bao gồm các thuộc tính `gap`, `row-gap` và `column-gap`. Các thuộc tính này cho phép đặt khoảng cách nhất quán giữa các phần tử trong một hàng hoặc cột, trong bất kỳ phương pháp bố cục nào có các phần tử được sắp xếp theo cách này.

Thuộc tính `gap` là viết tắt của `row-gap` và `column-gap`, cho phép chúng ta đặt các thuộc tính này cùng một lúc:

- {{cssxref("row-gap")}}
- {{cssxref("column-gap")}}
- {{cssxref("gap")}}

Trong ví dụ dưới đây, một grid layout sử dụng thuộc tính viết tắt `gap` để đặt khoảng cách `10px` giữa các row track và khoảng cách `2em` giữa các column track.

```html live-sample___grid-gap
<div class="box">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
</div>
```

```css hidden live-sample___grid-gap
body {
  font: 1.2em sans-serif;
}

.box {
  border: 2px dotted rgb(96 139 168);
}

.box > * {
  padding: 20px;
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
}
```

```css live-sample___grid-gap
.box {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 10px 2em;
}

.box :first-child {
  align-self: center;
}
```

{{EmbedLiveSample("grid-gap")}}

Các triển khai grid đời đầu bao gồm các thuộc tính `gap` có tiền tố `grid-`. Tất cả các trình duyệt hiện nay đều hỗ trợ các thuộc tính không có tiền tố, mặc dù bạn có thể thấy các thuộc tính sau trong một codebase: {{cssxref("row-gap", "grid-row-gap")}}, {{cssxref("column-gap", "grid-column-gap")}}, và {{cssxref("gap", "grid-gap")}}. Các phiên bản có tiền tố là các alias của các phiên bản không có tiền tố.

Lưu ý rằng các yếu tố khác cũng có thể tăng khoảng cách trực quan được hiển thị, ví dụ như dùng các từ khóa phân phối không gian hoặc thêm margin vào các phần tử.

## Box-alignment theo loại bố cục

Vì các thuộc tính CSS box alignment được triển khai khác nhau tùy thuộc vào đặc tả mà chúng tương tác, hãy tham khảo các hướng dẫn sau để biết chi tiết về cách sử dụng các thuộc tính căn chỉnh với từng loại bố cục:

- [Box alignment in flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox)
- [Box alignment in CSS grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [Box alignment in multiple-column layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_multi-column_layout)
- [Box alignment for block, absolutely positioned and table layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables)

## Xem thêm

- Module [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment)
- [Box alignment in grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)
- Module [CSS flex layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- [Basic concepts of flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Aligning items in a flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
