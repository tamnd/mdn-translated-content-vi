---
title: <position-area>
slug: Web/CSS/Reference/Values/position-area_value
page-type: css-type
browser-compat: css.properties.position-area
sidebar: cssref
---

Kiểu dữ liệu **`<position-area>`** trong [CSS](/vi/docs/Web/CSS) xác định ô hoặc nhóm ô của một **lưới vùng vị trí** (position-area grid), một lưới 3x3 mà ô trung tâm là phần tử neo.

Các giá trị từ khóa `<position-area>` có thể được đặt làm giá trị của thuộc tính {{cssxref("position-area")}} để đặt một phần tử được định vị theo neo vào một vị trí cụ thể so với phần tử neo liên kết của nó.

## Cú pháp

```plain
<position-area> = [
  [ left | center | right | span-left | span-right | x-start | x-end | span-x-start | span-x-end | self-x-start | self-x-end | span-self-x-start | span-self-x-end | span-all ]
||
  [ top | center | bottom | span-top | span-bottom | y-start | y-end | span-y-start | span-y-end | self-y-start | self-y-end | span-self-y-start | span-self-y-end | span-all ]
|
  [ block-start | center | block-end | span-block-start | span-block-end | span-all ]
||
  [ inline-start | center | inline-end | span-inline-start | span-inline-end | span-all ]
|
  [ self-block-start | self-block-end | span-self-block-start | span-self-block-end | span-all ]
||
  [ self-inline-start | self-inline-end | span-self-inline-start | span-self-inline-end | span-all ]
|
  [ start | center | end | span-start | span-end | span-all ]{1,2}
|
  [ self-start | center | self-end | span-self-start | span-self-end | span-all ]{1,2}
]
```

## Mô tả

Vùng vị trí hoạt động dựa trên khái niệm **lưới vùng vị trí** (position-area grid), một lưới 3x3 ô được tạo thành bởi bốn đường lưới, hai đường trên mỗi trục, với phần tử neo là ô trung tâm:

![Lưới vùng vị trí, được mô tả bên dưới](position-area.png)

Khi được dùng làm giá trị của thuộc tính `position-area` của một phần tử được định vị, kích thước của ô trung tâm được xác định bởi [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block) của phần tử neo mặc định của phần tử đó. Kích thước cạnh ngoài của lưới được xác định bởi khối chứa của phần tử được định vị. Các từ khóa logic thường dựa trên chế độ ghi và chiều của khối chứa, ngoại trừ các từ khóa `self-*` được tính từ chế độ ghi của phần tử được định vị theo neo.

Các ô lưới được chia thành hàng và cột:

- Ba hàng được đại diện bởi các giá trị vật lý `top`, `center` và `bottom`. Chúng cũng có các tương đương logic như `block-start`, `center` và `block-end`, cùng các tương đương tọa độ — `y-start`, `center` và `y-end`.
- Ba cột được đại diện bởi các giá trị vật lý `left`, `center` và `right`. Chúng cũng có các tương đương logic như `inline-start`, `center` và `inline-end`, cùng các tương đương tọa độ — `x-start`, `center` và `x-end`.

Giá trị `<position-area>` chứa một hoặc hai từ khóa xác định một vùng cụ thể của lưới vùng vị trí. Đặt giá trị `position-area` cho một phần tử được định vị sẽ đặt khối chứa của nó vào vùng lưới đã chỉ định:

```css
/* Ví dụ: Hai từ khóa để đặt phần tử vào một ô cụ thể */
position-area: top left;
position-area: bottom right;
position-area: start end;
position-area: center end;
position-area: block-start center;
position-area: inline-start block-end;
position-area: x-start y-end;
position-area: center self-y-end;

/* Ví dụ: Hai từ khóa để kéo dài phần tử qua hai ô */
position-area: top span-left;
position-area: span-bottom right;
position-area: center span-start;
position-area: inline-start span-block-end;
position-area: y-start span-x-end;

/* Ví dụ: Hai từ khóa để kéo dài phần tử qua ba ô */
position-area: top span-all;
position-area: block-end span-all;
position-area: self-x-start span-all;

/* Ví dụ: Một từ khóa với từ khóa thứ hai được ngầm định */
position-area: top; /* tương đương: top span-all */
position-area: inline-start; /* tương đương: inline-start span-all */
position-area: center; /* tương đương: center center */
position-area: span-all; /* tương đương: center center */
position-area: start; /* tương đương: start start */
position-area: end; /* tương đương: end end */
```

Các loại từ khóa khác nhau có thể sử dụng bao gồm:

- [Từ khóa lưới vật lý](#từ_khóa_lưới_vật_lý)
- [Từ khóa hàng và cột logic chung](#từ_khóa_hàng_và_cột_logic_chung)
- [Từ khóa logic inline và block tường minh](#từ_khóa_logic_inline_và_block_tường_minh)
- [Từ khóa lưới tọa độ](#từ_khóa_lưới_tọa_độ)

> [!NOTE]
> Nhìn chung, bạn không thể trộn lẫn các loại khác nhau trong một giá trị, ví dụ như vật lý và logic. Làm vậy sẽ dẫn đến giá trị không hợp lệ. Ví dụ, `position-area: bottom inline-end` không phải là giá trị hợp lệ vì nó trộn lẫn từ khóa vật lý và logic.

## Từ khóa lưới vật lý

Các từ khóa lưới vật lý xác định ô hoặc vùng của lưới `position-area` bằng các giá trị vật lý. Các giá trị này không bị ảnh hưởng bởi cài đặt {{cssxref("writing-mode")}} hay {{cssxref("direction")}}.

Với các từ khóa hàng và cột vật lý, bạn có thể chỉ định một từ khóa từ mỗi danh sách sau để chọn một ô lưới cụ thể:

- `top`, `center` hoặc `bottom`: Hàng trên cùng, trung tâm hoặc dưới cùng của lưới.
- `left`, `center` hoặc `right`: Cột bên trái, trung tâm hoặc bên phải của lưới.

Ví dụ, `top left` chọn ô trên cùng bên trái, còn `center right` chọn ô trung tâm của cột bên phải.

### Từ khóa kéo dài lưới vật lý

Các từ khóa kéo dài vật lý — khi kết hợp với từ khóa hàng hoặc cột vật lý — xác định ô lưới thứ hai để vùng vị trí mở rộng vào. Khi tổ hợp như vậy được đặt làm giá trị thuộc tính `position-area`, phần tử được chọn ban đầu được đặt ở trung tâm của hàng hoặc cột được chỉ định; sau đó nó kéo dài theo hướng được chỉ định trong từ khóa kéo dài, trải qua hai ô lưới:

- `span-left`
  - : Kéo dài qua cột trung tâm và cột bên trái của lưới.

- `span-right`
  - : Kéo dài qua cột trung tâm và cột bên phải của lưới.

- `span-top`
  - : Kéo dài qua hàng trung tâm và hàng trên cùng của lưới.

- `span-bottom`
  - : Kéo dài qua hàng trung tâm và hàng dưới cùng của lưới.

- `span-all`
  - : Hợp lệ với tất cả các loại từ khóa, kéo dài ô được liệt kê cũng như các ô liền kề trong cùng hàng hoặc cột. Xem [`span-all`](#span-all_2) bên dưới.

Ví dụ, `top span-left` kéo dài qua các ô trên-trung tâm và trên-trái.

> [!NOTE]
> Cố gắng ghép một từ khóa hàng hoặc cột với từ khóa kéo dài không phù hợp sẽ dẫn đến giá trị không hợp lệ. Ví dụ, `right span-right` không hợp lệ — bạn không thể chọn ô lưới trung tâm-phải rồi cố kéo dài thêm sang phải.

### Giá trị mặc định của từ khóa lưới vật lý

Nếu chỉ một từ khóa vật lý được chỉ định trong giá trị `position-area`, giá trị kia được ngầm định như sau:

- `left`, `right`, `top` hoặc `bottom`
  - : Giá trị kia mặc định là [`span-all`](#span-all_2), khiến phần tử kéo dài qua cả ba ô của cột hoặc hàng mà nó được đặt ban đầu. Ví dụ, `left` tương đương với `left span-all`.

- `center`, `span-left`, `span-right`, `span-top` hoặc `span-bottom`
  - : Giá trị kia mặc định là `center`. Ví dụ, `span-left` tương đương với `center span-left` và `center` tương đương với `center center`.

## Từ khóa lưới logic

Các từ khóa lưới logic xác định một vùng của lưới vùng vị trí bằng các giá trị logic. Với các giá trị này, vị trí và chiều bị ảnh hưởng bởi cài đặt {{cssxref("writing-mode")}} và {{cssxref("direction")}} trên [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block) của phần tử, hoặc trong trường hợp từ khóa `self`, chính phần tử được định vị. Có hai loại từ khóa logic: chung và tường minh.

### Từ khóa hàng và cột logic chung

Các từ khóa logic chung sử dụng cùng thuật ngữ cho cả chiều inline và block, với chiều được xác định bởi vị trí của từ khóa trong cặp giá trị `<position-area>`. Giá trị đầu tiên xác định vị trí theo chiều block và giá trị thứ hai xác định giá trị inline. Bạn có thể chỉ định một hoặc hai từ khóa từ danh sách sau. Chỉ định hai từ khóa từ danh sách này xác định một ô lưới cụ thể. Vị trí hoặc chiều của từ khóa là:

- `start`
  - : Điểm bắt đầu của chiều block hoặc inline của lưới, được tính từ chế độ ghi của khối chứa.

- `end`
  - : Điểm kết thúc của chiều block hoặc inline của lưới, được tính từ chế độ ghi của khối chứa.

- `self-start`
  - : Điểm bắt đầu của chiều block hoặc inline của lưới, được tính từ chế độ ghi của chính phần tử.

- `self-end`
  - : Điểm kết thúc của chiều block hoặc inline của lưới, được tính từ chế độ ghi của chính phần tử.

- `center`
  - : Trung tâm của chiều block của lưới (nếu từ khóa này được chỉ định đầu tiên) hoặc chiều inline (nếu từ khóa này được chỉ định thứ hai).

Ví dụ, `start end` và `self-start self-end` đều mô tả vị trí ở đầu chiều block và cuối chiều inline. Với `writing-mode: horizontal-tb`, đây là góc trên bên phải của phần tử neo, còn với `writing-mode: vertical-rl` là góc dưới bên phải.

#### Từ khóa kéo dài hàng và cột logic chung

Các từ khóa kéo dài logic chung — khi kết hợp với từ khóa hàng hoặc cột logic — xác định ô lưới thứ hai để vùng vị trí mở rộng vào. Khi tổ hợp như vậy được đặt làm giá trị thuộc tính `position-area`, phần tử được chọn ban đầu được đặt ở trung tâm của hàng hoặc cột được chỉ định, sau đó kéo dài theo hướng được chỉ định trong từ khóa kéo dài, trải qua hai ô lưới:

- `span-start`
  - : Kéo dài qua ô trung tâm và ô bắt đầu của hàng/cột lưới, với chiều tham chiếu đến chế độ ghi của khối chứa của phần tử.

- `span-end`
  - : Kéo dài qua ô trung tâm và ô kết thúc của hàng/cột lưới, với chiều tham chiếu đến chế độ ghi của khối chứa của phần tử.

- `span-self-start`
  - : Kéo dài qua ô trung tâm và ô bắt đầu của hàng/cột lưới theo chế độ ghi của chính phần tử được định vị.

- `span-self-end`
  - : Kéo dài qua ô trung tâm và ô kết thúc của hàng/cột lưới, được tính từ chế độ ghi của chính phần tử.

Ví dụ, `start span-end` và `self-start span-self-end` đều xác định vùng vị trí lưới bắt đầu ở trung tâm của hàng block đầu tiên, và kéo dài qua các ô trong hàng đó nằm ở cột inline trung tâm và cuối. Với `writing-mode: horizontal-tb`, điều này sẽ kéo dài qua trên-trung tâm và trên-phải của neo, còn với `writing-mode: vertical-rl` nó sẽ kéo dài phần tử qua phải-trung tâm và dưới-phải.

### Từ khóa logic inline và block tường minh

Các từ khóa hàng và cột logic inline và block tường minh tham chiếu tường minh đến vị trí block (hàng) hoặc inline (cột). Bạn có thể chỉ định một từ khóa cho chiều block và một cho chiều inline để chọn một ô lưới cụ thể. Khác với giá trị từ khóa logic chung, thứ tự từ khóa không quan trọng. Tuy nhiên, khai báo hai từ khóa trên cùng một trục sẽ làm cho giá trị không hợp lệ.

- `block-start`
  - : Điểm bắt đầu của chiều block của lưới, được tính từ chế độ ghi của khối chứa.

- `block-end`
  - : Điểm kết thúc của chiều block của lưới, được tính từ chế độ ghi của khối chứa.

- `inline-start`
  - : Điểm bắt đầu của chiều inline của lưới, được tính từ chế độ ghi của khối chứa.

- `inline-end`
  - : Điểm kết thúc của chiều inline của lưới, được tính từ chế độ ghi của khối chứa.

Ví dụ, `block-start inline-end` xác định ô ở đầu chiều block và cuối chiều inline. Với `writing-mode: horizontal-tb`, đây là ô ở phía trên bên phải của neo, còn với `writing-mode: vertical-rl` là ô ở phía dưới bên phải.

> [!NOTE]
> Đặc tả xác định các tương đương `self` của các từ khóa này — `block-self-start`, `block-self-end`, `inline-self-start` và `inline-self-end`. Tuy nhiên, những từ khóa này hiện chưa được hỗ trợ trên bất kỳ trình duyệt nào.

#### Từ khóa kéo dài logic inline và block tường minh

Các từ khóa kéo dài logic tường minh — khi kết hợp với từ khóa hàng hoặc cột logic — xác định ô lưới thứ hai để vùng vị trí mở rộng vào. Khi tổ hợp như vậy được đặt làm giá trị thuộc tính `position-area`, phần tử được chọn ban đầu được đặt ở trung tâm của hàng hoặc cột được chỉ định, dựa trên chế độ ghi của khối chứa, sau đó kéo dài theo hướng được chỉ định trong từ khóa kéo dài, trải qua hai ô lưới:

- `span-block-start`
  - : Kéo dài qua ô trung tâm và ô block-start của cột inline được chỉ định.

- `span-block-end`
  - : Kéo dài qua ô trung tâm và ô block-end của cột inline được chỉ định.

- `span-inline-start`
  - : Kéo dài qua ô trung tâm và ô inline-start của hàng block được chỉ định.

- `span-inline-end`
  - : Kéo dài qua ô trung tâm và ô inline-end của hàng block được chỉ định.

Ví dụ, `block-end span-inline-start` chọn ô trung tâm của hàng block cuối và kéo dài qua các ô trong hàng đó nằm ở cột inline trung tâm và cột bắt đầu. Với `writing-mode: horizontal-tb`, điều này sẽ kéo dài qua các ô lưới dưới-trung tâm và dưới-trái, còn với `writing-mode: vertical-rl` sẽ kéo dài qua các ô lưới trái-trung tâm và trên-trái.

> [!NOTE]
> Đặc tả xác định các tương đương `self` của các từ khóa này, ví dụ — `span-self-block-start`, `span-self-block-end`, `span-self-inline-start` và `span-self-inline-end`. Tuy nhiên, những từ khóa này hiện chưa được hỗ trợ trên bất kỳ trình duyệt nào.

> [!NOTE]
> Cố gắng ghép một từ khóa hàng hoặc cột với từ khóa kéo dài không phù hợp sẽ dẫn đến giá trị thuộc tính không hợp lệ. Ví dụ, `block-end span-block-end` không hợp lệ — bạn không thể chọn hàng block-end trung tâm rồi cố kéo dài thêm một ô theo chiều block end.

### Giá trị mặc định của từ khóa lưới logic

Nếu chỉ một từ khóa `<position-area>` logic được chỉ định, giá trị kia được ngầm định như sau:

- `start`, `end`, `self-start` hoặc `self-end`
  - : Giá trị kia mặc định giống với giá trị đầu tiên, chọn ô lưới ở hàng và cột đầu, hoặc hàng và cột cuối.

- `span-start`, `span-self-start`, `span-end`, `span-self-end`
  - : Giá trị kia mặc định là `center`. Ví dụ, `span-start` tương đương với `span-start center`.

- `block-start`, `block-end`, `inline-start`, `inline-end`
  - : Giá trị kia mặc định là [`span-all`](#span-all_2), kéo dài qua cả ba ô của cột hoặc hàng đã đặt. Ví dụ, `block-start` tương đương với `block-start span-all`.

- `span-block-start`, `span-block-end`, `span-inline-start`, `span-inline-end`
  - : Giá trị kia mặc định là `center`. Ví dụ, `span-inline-start` tương đương với `span-inline-start center`.

## Từ khóa lưới tọa độ

Các từ khóa này xác định các ô của lưới `position-area` bằng các giá trị tọa độ x và y. Vị trí/chiều của chúng sẽ bị ảnh hưởng bởi cài đặt {{cssxref("writing-mode")}} và/hoặc {{cssxref("direction")}} trên [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block) của phần tử, hoặc trong trường hợp từ khóa `self`, chính phần tử đó.

Tuy nhiên, các ô lưới được xác định theo trục vật lý chứ không theo chiều block/inline:

- Với `writing-mode: horizontal-tb` và `vertical-lr`, trục x chạy từ trái sang phải và trục y chạy từ trên xuống dưới.
- Với `writing-mode: horizontal-tb; direction: rtl` và `writing-mode: vertical-rl`, trục x chạy từ phải sang trái và trục y chạy từ trên xuống dưới.

Với các từ khóa hàng và cột tọa độ, bạn có thể chỉ định một từ khóa từ trục x và một từ trục y để xác định một ô lưới cụ thể.

Các từ khóa trục x bao gồm:

- `x-start`
  - : Ô bắt đầu dọc theo trục x của lưới, được tính từ chế độ ghi của khối chứa.

- `x-end`
  - : Ô kết thúc dọc theo trục x của lưới, được tính từ chế độ ghi của khối chứa.

- `self-x-start`
  - : Ô bắt đầu dọc theo trục x của lưới, được tính từ chế độ ghi của chính phần tử.

- `self-x-end`
  - : Ô kết thúc dọc theo trục x của lưới, được tính từ chế độ ghi của chính phần tử.

- `center`
  - : Trung tâm của trục x của lưới, được tính từ chế độ ghi của chính phần tử.

Các từ khóa trục y bao gồm:

- `y-start`
  - : Ô bắt đầu dọc theo trục y của lưới, được tính từ chế độ ghi của khối chứa.

- `y-end`
  - : Ô kết thúc dọc theo trục y của lưới, được tính từ chế độ ghi của khối chứa.

- `self-y-start`
  - : Ô bắt đầu dọc theo trục y của lưới, được tính từ chế độ ghi của chính phần tử.

- `self-y-end`
  - : Ô kết thúc dọc theo trục y của lưới, được tính từ chế độ ghi của chính phần tử.

- `center`
  - : Trung tâm của trục y của lưới, được tính từ chế độ ghi của chính phần tử.

Ví dụ, `x-end y-start` và `self-x-end self-y-start` đều chọn ô lưới ở cuối trục x và đầu trục y. Với `writing-mode: horizontal-tb`, đây là ô ở phía trên bên phải của neo, còn với `writing-mode: vertical-rl` là ở phía trên bên trái.

### Từ khóa kéo dài tọa độ

Khi kết hợp với từ khóa hàng hoặc cột tọa độ, các từ khóa kéo dài tọa độ xác định ô lưới thứ hai để vùng vị trí mở rộng vào. Khi tổ hợp như vậy được đặt làm giá trị thuộc tính `position-area`, phần tử được chọn ban đầu được đặt ở trung tâm của hàng hoặc cột được chỉ định, sau đó kéo dài theo hướng được chỉ định trong từ khóa kéo dài, trải qua hai ô lưới:

- `span-x-start`
  - : Kéo dài qua ô trung tâm và ô x-start của hàng trục y được chỉ định.

- `span-x-end`
  - : Kéo dài qua ô trung tâm và ô x-end của hàng trục y được chỉ định.

- `span-y-start`
  - : Kéo dài qua ô trung tâm và ô y-start của cột trục x được chỉ định.

- `span-y-end`
  - : Kéo dài qua ô trung tâm và ô y-end của cột trục x được chỉ định.

Ví dụ, `y-end span-x-end` chọn ô ở trung tâm của hàng y cuối, và kéo dài qua các ô trong hàng đó nằm ở cột x-trung tâm và x-cuối. Với `writing-mode: horizontal-tb`, vùng lưới vị trí sẽ kéo dài qua các ô lưới dưới-trung tâm và dưới-phải, còn với `writing-mode: vertical-rl` sẽ kéo dài qua các ô dưới-trung tâm và dưới-trái.

> [!NOTE]
> Đặc tả không xác định các từ khóa kéo dài `self` tọa độ riêng biệt, nhưng điều này không cần thiết — các từ khóa kéo dài có thể được dùng với cả từ khóa hàng và cột tọa độ.

### Giá trị mặc định của từ khóa lưới tọa độ

Nếu chỉ một từ khóa `<position-area>` lưới tọa độ được chỉ định, giá trị kia được ngầm định như sau:

- `x-start`, `self-x-start`, `x-end`, `self-x-end`, `y-start`, `self-y-start`, `y-end` hoặc `self-y-end`
  - : Giá trị kia mặc định là [`span-all`](#span-all_2), chọn các ô lưới trải qua cả ba ô của cột hoặc hàng mà nó được đặt ban đầu. Ví dụ, `x-start` tương đương với `x-start span-all`.

- `span-x-start`, `span-x-end`, `span-y-start`, `span-y-end`, `span-self-x-start`, `span-self-x-end`, `span-self-y-end` hoặc `span-self-y-start`
  - : Giá trị kia mặc định là `center`. Ví dụ, `span-start` tương đương với `span-start center`.

## `span-all`

`span-all` là một từ khóa đặc biệt có thể dùng với tất cả các từ khóa hàng và cột được liệt kê trong các mục trên. Khi bạn chỉ định hai giá trị — một từ khóa hàng/cột và `span-all`, phần tử được đặt trong hàng hoặc cột được chỉ định, và sau đó nó kéo dài qua tất cả các ô trong hàng hoặc cột đó.

## Ví dụ

Xem trang thuộc tính {{cssxref("position-area")}}.

Để biết thông tin chi tiết về các tính năng và cách sử dụng neo, hãy xem mô-đun [CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Using CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("position-area")}}
- {{cssxref("anchor-name")}}
- {{cssxref("position-anchor")}}
- Hàm [`anchor()`](/vi/docs/Web/CSS/Reference/Values/anchor)
- Hướng dẫn [Using CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using)
- Hướng dẫn [Fallback options and conditional hiding for overflow](/vi/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
- Mô-đun [CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning)
