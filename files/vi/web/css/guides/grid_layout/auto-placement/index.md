---
title: Auto-placement in grid layout
short-title: Using auto-placement
slug: Web/CSS/Guides/Grid_layout/Auto-placement
page-type: guide
sidebar: cssref
---

[CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) chứa các quy tắc kiểm soát điều gì xảy ra khi bạn tạo một grid và không đặt rõ ràng một số hoặc tất cả các mục con trong grid. Khi bạn không cần kiểm soát rõ ràng việc đặt nội dung, "auto-placement" này là cách đơn giản nhất để tạo một grid cho một tập hợp các mục.

## Vị trí mặc định

Nếu bạn không cung cấp thông tin placement cho các mục, chúng sẽ tự động định vị trên grid, đặt một grid item trong mỗi ô grid.

```css hidden
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

{{EmbedLiveSample('Default_placement')}}

## Quy tắc mặc định cho auto-placement

Như bạn có thể thấy trong ví dụ trên, nếu bạn tạo một grid mà không đặt bất kỳ mục nào, các mục con sẽ tự sắp xếp, với một grid item trong mỗi ô grid theo thứ tự mã nguồn. Luồng mặc định là sắp xếp các mục theo hàng. Grid sẽ đặt một mục vào từng ô của hàng đầu tiên. Nếu bạn đã tạo thêm hàng bằng thuộc tính {{cssxref("grid-template-rows")}}, thì grid sẽ tiếp tục đặt các mục trong các hàng này. Nếu grid không có đủ hàng trong [explicit grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts#implicit_and_explicit_grids) để đặt tất cả các mục, các hàng _implicit_ mới sẽ được tạo ra.

### Kích thước hàng trong implicit grid

Mặc định cho các hàng được tạo tự động trong implicit grid là chúng được _tự động kích thước_. Điều này có nghĩa là chúng sẽ tự điều chỉnh kích thước để chứa nội dung được thêm vào mà không gây tràn.

Kích thước của các hàng này có thể được kiểm soát bằng thuộc tính {{cssxref("grid-auto-rows")}}. Ví dụ, để làm tất cả các hàng cao 100px, bạn có thể sử dụng `grid-auto-rows: 100px;`:

```css hidden
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  grid-auto-rows: 100px;
}
```

{{EmbedLiveSample('Sizing_rows_in_the_implicit_grid', '500', '230')}}

### Kích thước hàng bằng minmax()

Hàm {{cssxref("minmax")}} cho phép tạo các hàng có kích thước tối thiểu và có thể lớn hơn để vừa với nội dung khi được đặt làm giá trị `grid-auto-rows`. Bằng cách đặt `grid-auto-rows: minmax(100px, auto);` chúng ta đặt mỗi hàng tối thiểu cao 100px, trong khi cho phép mỗi hàng cao tùy theo nhu cầu:

```css hidden
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>
    Four <br />This cell <br />Has extra <br />content. <br />Max is auto
    <br />so the row expands.
  </div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  grid-auto-rows: minmax(100px, auto);
}
```

{{EmbedLiveSample('Sizing_rows_using_minmax', '500', '300')}}

### Kích thước hàng bằng danh sách track

Bạn cũng có thể truyền vào một danh sách track. Danh sách này sẽ được lặp lại. Danh sách track sau sẽ tạo một track hàng implicit ban đầu là 100 pixel và một hàng thứ hai là `200px`. Điều này sẽ tiếp tục miễn là nội dung được thêm vào implicit grid.

```css hidden
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  grid-auto-rows: 100px 200px;
}
```

{{EmbedLiveSample('Sizing_rows_using_a_track_listing', '500', '450')}}

### Auto-placement theo cột

Bạn cũng có thể yêu cầu grid tự động đặt các mục theo cột. Sử dụng thuộc tính {{cssxref("grid-auto-flow")}} với giá trị `column`. Trong trường hợp này, grid sẽ thêm các mục vào các hàng bạn đã định nghĩa bằng {{cssxref("grid-template-rows")}}. Khi lấp đầy một cột, nó sẽ chuyển sang cột explicit tiếp theo, hoặc tạo một cột track mới trong implicit grid. Giống như các track hàng implicit, các column track này sẽ được tự động kích thước. Bạn có thể kiểm soát kích thước của implicit column track bằng {{cssxref("grid-auto-columns")}}. Cách này hoạt động giống như {{cssxref("grid-auto-rows")}}.

Trong ví dụ này, chúng ta có một grid với ba track hàng cao 200px. Chúng ta khai báo `grid-auto-flow: column;` để tự động đặt theo cột. Với `grid-auto-columns: 300px 100px;`, các cột được tạo sẽ xen kẽ giữa 300px chiều rộng và 100px chiều rộng cho đến khi có đủ column track để chứa tất cả các mục.

```css
.wrapper {
  display: grid;
  grid-template-rows: repeat(3, 200px);
  gap: 10px;
  grid-auto-flow: column;
  grid-auto-columns: 300px 100px;
}
```

```css hidden
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
</div>
```

{{EmbedLiveSample('Auto-placement_by_column', '500', '650')}}

## Thứ tự của các mục được tự động đặt

Một grid có thể chứa hỗn hợp các placement mục. Một số mục có thể có vị trí được xác định cụ thể trên grid, trong khi những mục khác có thể được tự động đặt. Nếu bạn có thứ tự tài liệu phản ánh thứ tự các mục nằm trên grid, bạn có thể không cần viết quy tắc CSS để đặt mọi thứ một cách tuyệt đối. Đặc tả chứa một phần dài chi tiết về [Grid item placement algorithm](https://drafts.csswg.org/css-grid/#auto-placement-algo); tuy nhiên, đối với hầu hết chúng ta, chúng ta chỉ cần nhớ một vài quy tắc cho các mục của mình.

### Thứ tự tài liệu được sửa đổi bởi order

Grid đặt các mục chưa được gán vị trí grid theo những gì được mô tả trong đặc tả là "order modified document order". Điều này có nghĩa là nếu bạn đã sử dụng thuộc tính `order`, các mục sẽ được đặt theo thứ tự đó, không phải thứ tự DOM của chúng. Nếu không, chúng sẽ giữ theo thứ tự mặc định mà chúng được nhập vào nguồn tài liệu.

### Các mục có thuộc tính placement

Điều đầu tiên grid sẽ làm là đặt bất kỳ mục nào có vị trí. Trong ví dụ dưới đây, tôi có 12 grid item. Mục 2 và mục 5 đã được đặt bằng line based placement trên grid. Bạn có thể thấy cách các mục đó được đặt và các mục khác sau đó tự động đặt vào các khoảng trống. Các mục được tự động đặt sẽ đặt mình trước các mục được đặt theo thứ tự DOM; chúng không bắt đầu sau vị trí của một mục được đặt đến trước chúng.

```css hidden
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
  <div>Nine</div>
  <div>Ten</div>
  <div>Eleven</div>
  <div>Twelve</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: 100px;
  gap: 10px;
}
.wrapper div:nth-child(2) {
  grid-column: 3;
  grid-row: 2 / 4;
}
.wrapper div:nth-child(5) {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
}
```

{{EmbedLiveSample('Items_with_placement_properties', '500', '500')}}

### Xử lý các mục trải qua nhiều track

Bạn có thể sử dụng các thuộc tính placement trong khi vẫn tận dụng auto-placement. Trong ví dụ tiếp theo, tôi đã thêm vào layout bằng cách đặt các mục 1, 5, và 9 (4n+1) để trải qua hai track cả cho hàng và cột. Tôi làm điều này với các thuộc tính {{cssxref("grid-column-end")}} và {{cssxref("grid-row-end")}} và đặt giá trị của chúng thành `span 2`. Điều này có nghĩa là đường bắt đầu của mục sẽ được đặt bởi auto-placement, và đường kết thúc sẽ trải qua hai track.

Bạn có thể thấy cách này để lại các khoảng trống trong grid, vì đối với các mục được tự động đặt, nếu grid gặp một mục không vừa vào một track, nó sẽ chuyển sang hàng tiếp theo cho đến khi tìm thấy khoảng trống mà mục có thể vừa.

```css hidden
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}
.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
  <div>Nine</div>
  <div>Ten</div>
  <div>Eleven</div>
  <div>Twelve</div>
</div>
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: 100px;
  gap: 10px;
}
.wrapper div:nth-child(4n + 1) {
  grid-column-end: span 2;
  grid-row-end: span 2;
  background-color: #ffa94d;
}
.wrapper div:nth-child(2) {
  grid-column: 3;
  grid-row: 2 / 4;
}
.wrapper div:nth-child(5) {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
}
```

{{EmbedLiveSample('Deal_with_items_that_span_tracks', '500', '800')}}

### Lấp đầy các khoảng trống

Cho đến nay, ngoài các mục chúng ta đã đặt cụ thể, grid luôn tiến về phía trước và giữ các mục theo thứ tự DOM. Đây thường là điều bạn muốn, ví dụ nếu bạn đang tạo layout cho một biểu mẫu, bạn không muốn các nhãn và trường bị xáo trộn thứ tự để lấp đầy một khoảng trống. Tuy nhiên, đôi khi chúng ta đang bố trí những thứ không có thứ tự logic và chúng ta muốn tạo một layout không có khoảng trống.

Để làm điều này, thêm thuộc tính {{cssxref("grid-auto-flow")}} với giá trị `dense` vào container. Đây là thuộc tính tương tự bạn dùng để thay đổi thứ tự luồng thành `column`, vì vậy nếu bạn đang làm việc theo cột bạn sẽ thêm cả hai giá trị `grid-auto-flow: column dense`.

Sau khi làm điều này, grid sẽ lấp đầy các khoảng trống. Khi di chuyển qua grid, nó để lại khoảng trống như trước, nhưng nếu nó tìm thấy một mục vừa với khoảng trống trước đó, nó sẽ nhặt mục đó lên và đặt nó vào khoảng trống, lấy mục đó ra khỏi thứ tự DOM. Giống như bất kỳ sắp xếp lại nào khác trong grid, điều này không thay đổi thứ tự logic. Thứ tự tab, ví dụ, vẫn sẽ theo thứ tự tài liệu. Chúng ta sẽ tìm hiểu các vấn đề accessibility tiềm năng của grid layout trong [hướng dẫn Grid layout và accessibility](/en-US/docs/Web/CSS/Guides/Grid_layout/Accessibility), nhưng bạn nên cẩn thận khi tạo ra sự ngắt kết nối giữa thứ tự trực quan và thứ tự hiển thị.

```css hidden
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}
.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```html
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
  <div>Six</div>
  <div>Seven</div>
  <div>Eight</div>
  <div>Nine</div>
  <div>Ten</div>
  <div>Eleven</div>
  <div>Twelve</div>
</div>
```

```css
.wrapper div:nth-child(4n + 1) {
  grid-column-end: span 2;
  grid-row-end: span 2;
  background-color: #ffa94d;
}
.wrapper div:nth-child(2) {
  grid-column: 3;
  grid-row: 2 / 4;
}
.wrapper div:nth-child(5) {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
}
.wrapper {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: 100px;
  gap: 10px;
  grid-auto-flow: dense;
}
```

{{EmbedLiveSample('Filling_in_the_gaps', '500', '680')}}

### Anonymous grid item

Có một đề cập trong đặc tả về anonymous grid item. Chúng được tạo ra nếu bạn có một chuỗi văn bản bên trong grid container của mình mà không được bọc trong bất kỳ phần tử nào khác. Trong ví dụ dưới đây, chúng ta có ba grid item, giả sử bạn đã đặt phần tử cha với class `grid` thành `display: grid`. Cái đầu tiên là một anonymous item vì nó không có markup bao bọc; mục này sẽ luôn được xử lý theo các quy tắc auto-placement. Hai mục kia là grid item được bọc trong div; chúng có thể được tự động đặt hoặc bạn có thể đặt chúng bằng phương pháp định vị lên grid của mình.

```html
<div class="grid">
  I am a string and will become an anonymous item
  <div>A grid item</div>
  <div>A grid item</div>
</div>
```

Anonymous item luôn được tự động đặt vì không có cách nào để nhắm mục tiêu chúng. Do đó nếu bạn có một số văn bản không được bọc vì lý do nào đó trong grid của mình, hãy biết rằng nó có thể xuất hiện ở đâu đó không mong đợi vì nó sẽ được tự động đặt theo các quy tắc auto-placement.

### Trường hợp sử dụng cho auto-placement

Auto-placement hữu ích bất cứ khi nào bạn có một tập hợp các mục. Đó có thể là các mục không có thứ tự logic như một thư viện ảnh, hoặc danh sách sản phẩm. Trong trường hợp đó, bạn có thể chọn sử dụng chế độ đóng gói dày đặc để lấp đầy các khoảng trống trong grid. Trong ví dụ thư viện ảnh, tôi có một số ảnh nằm ngang và một số ảnh dọc. Tôi đã đặt ảnh nằm ngang – với class `landscape` để trải qua hai column track. Sau đó tôi sử dụng `grid-auto-flow: dense` để tạo một grid được đóng gói dày đặc.

Hãy thử xóa dòng `grid-auto-flow: dense` để xem nội dung sắp xếp lại và để lại khoảng trống trong layout.

```html live-sample___autoplacement
<ul class="wrapper">
  <li>
    <img
      alt="A colorful hot air balloon against a clear sky"
      src="https://mdn.github.io/shared-assets/images/examples/balloon.jpg" />
  </li>
  <li class="landscape">
    <img
      alt="Three hot air balloons against a clear sky, as seen from the ground"
      src="https://mdn.github.io/shared-assets/images/examples/balloons-small.jpg" />
  </li>
  <li class="landscape">
    <img
      alt="Three hot air balloons against a clear sky, as seen from the ground"
      src="https://mdn.github.io/shared-assets/images/examples/balloons-small.jpg" />
  </li>
  <li class="landscape">
    <img
      alt="Three hot air balloons against a clear sky, as seen from the ground"
      src="https://mdn.github.io/shared-assets/images/examples/balloons-small.jpg" />
  </li>
  <li>
    <img
      alt="A colorful hot air balloon against a clear sky"
      src="https://mdn.github.io/shared-assets/images/examples/balloon.jpg" />
  </li>
  <li>
    <img
      alt="A colorful hot air balloon against a clear sky"
      src="https://mdn.github.io/shared-assets/images/examples/balloon.jpg" />
  </li>
</ul>
```

```css hidden live-sample___autoplacement
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}

.wrapper {
  list-style: none;
  margin: 1em auto;
  padding: 0;
  max-width: 800px;
}
.wrapper li {
  border: 1px solid #cccccc;
}

.wrapper li img {
  display: block;
  object-fit: cover;
  width: 100%;
  height: 100%;
}
```

```css live-sample___autoplacement
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, minmax(120px, 1fr));
  gap: 10px;
  grid-auto-flow: dense;
}

.wrapper li.landscape {
  grid-column-end: span 2;
}
```

{{EmbedLiveSample("autoplacement", "", "500px")}}

Auto-placement cũng có thể giúp bạn bố trí các phần tử giao diện có thứ tự logic. Một ví dụ là danh sách định nghĩa trong ví dụ tiếp theo. Danh sách định nghĩa là một thách thức thú vị để tạo kiểu vì chúng phẳng, không có gì bao bọc các nhóm `dt` và `dd`. Trong ví dụ này, tôi cho phép auto-placement đặt các mục, tuy nhiên tôi có các class bắt đầu một `dt` trong cột 1, và `dd` trong cột 2; điều này đảm bảo các thuật ngữ đứng một phía và định nghĩa đứng phía kia – bất kể số lượng mỗi loại.

```css hidden live-sample___use-cases-for-auto-placement
body {
  font: 1.2em sans-serif;
}
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}
```

```html live-sample___use-cases-for-auto-placement
<div class="wrapper">
  <dl>
    <dt>Mammals</dt>
    <dd>Cat</dd>
    <dd>Dog</dd>
    <dd>Mouse</dd>
    <dt>Birds</dt>
    <dd>Pied Wagtail</dd>
    <dd>Owl</dd>
    <dt>Fish</dt>
    <dd>Guppy</dd>
  </dl>
</div>
```

```css live-sample___use-cases-for-auto-placement
dl {
  display: grid;
  grid-template-columns: auto 1fr;
  max-width: 300px;
  margin: 1em;
  line-height: 1.4;
}
dt {
  grid-column: 1;
  font-weight: bold;
}
dd {
  grid-column: 2;
}
```

{{EmbedLiveSample('use-cases-for-auto-placement', '500', '230')}}

## Những gì chúng ta chưa thể làm với auto-placement (hiện tại)?

Có một vài điều thường được đặt ra như câu hỏi. Hiện tại chúng ta không thể nhắm mục tiêu mọi ô khác của grid với các mục. Một vấn đề liên quan có thể đã xuất hiện trong đầu bạn nếu bạn đã theo dõi hướng dẫn trước đó về named lines trên grid. Đó là định nghĩa một quy tắc nói "tự động đặt các mục chống lại đường tiếp theo có tên là 'n'", và grid sau đó sẽ bỏ qua các đường khác. Có [một vấn đề được đặt ra về điều này](https://github.com/w3c/csswg-drafts/issues/796) trên kho GitHub CSSWG, và bạn được chào đón để thêm các trường hợp sử dụng của riêng bạn vào đó.

Có thể bạn sẽ nghĩ ra các trường hợp sử dụng của riêng mình cho auto-placement hoặc bất kỳ phần nào khác của grid layout. Nếu bạn làm vậy, hãy đặt chúng là các vấn đề hoặc thêm vào một vấn đề hiện có có thể giải quyết trường hợp sử dụng của bạn. Điều này sẽ giúp làm cho các phiên bản tương lai của đặc tả tốt hơn.
