---
title: "Thử thách: Tạo kiểu ứng dụng tìm kiếm bảng màu nội thất"
short-title: "Thử thách: Tạo kiểu tìm kiếm bảng màu"
slug: Learn_web_development/Core/Styling_basics/Home_color_scheme_search
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Tables", "Learn_web_development/Core/Styling_basics/Debugging_CSS", "Learn_web_development/Core/Styling_basics")}}

Thử thách cuối cùng của mô-đun [kiến thức cơ bản về tạo kiểu](/en-US/docs/Learn_web_development/Core/Styling_basics) của chúng tôi có một bản mô phỏng giao diện "Ứng dụng tìm kiếm màu nội thất", ý tưởng là cho phép người dùng nhập một màu và lấy ra một loạt các biến thể cùng với các ý tưởng bảng màu mẫu. Nhiệm vụ của bạn là tạo kiểu cho các điều khiển biểu mẫu, bảng và nút được cung cấp, đồng thời đảm bảo các hình ảnh hiển thị như mong đợi.

> [!NOTE]
> Các hình ảnh có màu sắc được dùng trong thử thách này đã được điều chỉnh từ bản gốc trên Flickr: [Chic Living Room](https://flickr.com/photos/145464578@N08/28362250492/), được xuất bản bởi [Houseology Interiors](https://flickr.com/photos/145464578@N08/) theo giấy phép [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/deed.en).

## Điểm khởi đầu

Để bắt đầu, hãy nhấp vào nút **Play** ở một trong các bảng code bên dưới để mở ví dụ trong MDN Playground. Sau đó bạn sẽ theo dõi các hướng dẫn trong phần [Mô tả dự án](#project_brief) để tạo kiểu trang phù hợp.

```html live-sample___app-start live-sample___app-finish
<section>
  <h1>Home color search</h1>
  <form>
    <div>
      <label for="color">Color to search for:</label>
      <input type="text" id="color" name="color" value="pink" />
    </div>
    <div>
      <label for="results-per-page">Results per page:</label>
      <input
        type="text"
        id="results-per-page"
        name="results-per-page"
        value="4" />
    </div>
    <div>
      <button type="button">Submit</button>
    </div>
  </form>
</section>
<hr />
<section>
  <h2>Search results</h2>
  <table>
    <caption>
      Sample colors and color schemes
    </caption>
    <thead>
      <tr>
        <th scope="col">Color</th>
        <th scope="col">Raw color</th>
        <th scope="col">Tags</th>
        <th scope="col">Sample color scheme</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Pink</td>
        <td><code>rgb(255 192 203)</code></td>
        <td>pink, pale, light</td>
        <td>
          <img
            src="https://mdn.github.io/shared-assets/images/examples/learn/home-color-schemes/living-room-pink.png"
            alt="Image of living room in a pink color scheme" />
        </td>
      </tr>
      <tr>
        <td>Baker-Miller pink</td>
        <td><code>rgb(255 145 175)</code></td>
        <td>pink, pale, bright</td>
        <td>
          <img
            src="https://mdn.github.io/shared-assets/images/examples/learn/home-color-schemes/living-room-baker-miller-pink.png"
            alt="Image of living room in a Baker-Miller pink color scheme" />
        </td>
      </tr>
      <tr>
        <td>Hotpink</td>
        <td><code>rgb(255 105 180)</code></td>
        <td>pink, bright, vivid</td>
        <td>
          <img
            src="https://mdn.github.io/shared-assets/images/examples/learn/home-color-schemes/living-room-hotpink.png"
            alt="Image of living room in a hotpink color scheme" />
        </td>
      </tr>
      <tr>
        <td>Fuchsia</td>
        <td><code>rgb(255 0 255)</code></td>
        <td>pink, medium, bright</td>
        <td>
          <img
            src="https://mdn.github.io/shared-assets/images/examples/learn/home-color-schemes/living-room-fuchsia.png"
            alt="Image of living room in a fuchsia color scheme" />
        </td>
      </tr>
    </tbody>
  </table>
  <div class="controls">
    <button disabled>Previous</button>
    <p>Showing page 1 of 20</p>
    <button>Next</button>
  </div>
</section>
```

```css live-sample___app-start
* {
  box-sizing: border-box;
}

html {
  font-family: "Helvetica", "Arial", sans-serif;
}

body {
  margin: 0 10px;
}

hr {
  margin: 3em 0;
}

h2 {
  margin-top: 0;
}

/* Prev/next control layout */

.controls {
  display: flex;
  padding: 10px 0;
  justify-content: space-between;
  align-items: center;
}

/* Form and button styling */

form div {
  display: flex;
  align-items: center;
  gap: 2em;
  margin-bottom: 1em;
}

label {
  text-align: right;
  flex: 1;
}

input {
  flex: 3;
}

/* Table styling */

table img {
  width: 100%;
  height: 150px;
}
```

{{embedlivesample("app-start", "100%", 650)}}

## Mô tả dự án

Hãy làm theo các bước dưới đây để hoàn thiện dự án, định kích thước bảng điều khiển nội dung phù hợp và thêm các trang trí cần thiết.

### Thêm reset biểu mẫu

Trước tiên, hãy thêm một số kiểu "reset" vào các phần tử `<button>` và `<input>` để đặt cho chúng trạng thái ban đầu nhất quán trên các trình duyệt.

Cụ thể:

1. Cho chúng kế thừa họ phông chữ được đặt trên phần còn lại của trang.
2. Đặt cỡ chữ là `100%`.
3. Xóa tất cả khoảng đệm và lề của chúng.

### Tạo kiểu cho các trường nhập biểu mẫu

Đặt cho các phần tử `<input>`:

1. Đường viền đặc `2px` với màu `#999999`.
2. `10px` khoảng đệm.
3. Góc bo tròn `5px`.

### Tạo kiểu cho các nút

Đặt cho các phần tử `<button>`:

1. Không có đường viền.
2. Màu nền `black` và màu chữ `white`.
3. Góc bo tròn `5px`.
4. Khoảng đệm dọc `10px` và khoảng đệm ngang `2em`.
5. Màu nền `#666666` khi rê chuột hoặc được truy cập bằng bàn phím.
6. Màu nền `#aaaaaa` khi bị vô hiệu hóa.

### Tạo kiểu cho bảng

Bây giờ bạn nên thêm một số kiểu thực hành tốt nhất vào bảng, như đã học trước đó trong mô-đun, cộng thêm một vài kiểu bổ sung.

Cụ thể:

1. Đặt bảng có bố cục cố định, chiều rộng `100%` và các đường viền thu gọn.
2. Đặt đường viền trên và dưới của bảng dày `1px`, đặc và màu `#999999`.
3. Đặt khoảng đệm `0.6em` cho các ô tiêu đề và ô thông thường của bảng, và căn chỉnh nội dung của chúng theo chiều dọc lên đầu ô.
4. Đặt đường viền dưới cho các ô tiêu đề bảng dày `1px`, đặc và màu `#999999`.
5. Đặt tất cả các hàng trong bảng có chiều rộng `20%`, ngoại trừ hàng thứ tư có chiều rộng `40%`.
6. Bên trong thân bảng, có bốn hàng. Ô thứ hai trong mỗi hàng này chứa văn bản cho màu `rgb()`. Đặt cho mỗi ô này màu nền tương ứng với văn bản của nó.
7. Tạo sọc ngựa vằn: Đặt màu nền `#eeeeee` cho mỗi hàng lẻ, chỉ bên trong thân bảng.
8. Đặt cho chú thích khoảng đệm `1em`, kiểu chữ nghiêng và khoảng cách chữ `1px`.

### Sửa hiển thị hình ảnh

Tại thời điểm này, có một vấn đề với các hình ảnh trong bảng — chúng tôi đã đặt mỗi hình ảnh thành `100%` chiều rộng của ô bảng chứa nó và chiều cao cụ thể là `150px`, vì chúng tôi không muốn các hàng bảng quá cao. Tuy nhiên, điều này đã làm méo tỉ lệ khung hình của các hình ảnh, khiến chúng trông hơi bị ép.

Chúng tôi muốn bạn tạo kiểu các hình ảnh sao cho:

1. Chúng được hiển thị ở tỉ lệ khung hình cố hữu, nhưng với một phần hình ảnh bị cắt để chúng vẫn vừa với kích thước của các phần tử `<img>`.
2. Phần dưới của hình ảnh được hiển thị, nhưng phần trên của hình ảnh bị cắt.

## Gợi ý và mẹo

- Bạn không cần thay đổi HTML theo bất kỳ cách nào.

## Ví dụ

Dự án hoàn chỉnh sẽ trông như thế này:

{{EmbedLiveSample("app-finish", "100%", 700)}}

<details>
<summary>Nhấp vào đây để xem giải pháp</summary>

Một giải pháp có thể là:

```css live-sample___app-finish
* {
  box-sizing: border-box;
}

html {
  font-family: "Helvetica", "Arial", sans-serif;
}

body {
  margin: 0 10px;
}

hr {
  margin: 3em 0;
}

h2 {
  margin-top: 0;
}

/* Prev/next control layout */

.controls {
  display: flex;
  padding: 10px 0;
  justify-content: space-between;
  align-items: center;
}

/* Form and button styling */

form div {
  display: flex;
  align-items: center;
  gap: 2em;
  margin-bottom: 1em;
}

label {
  text-align: right;
  flex: 1;
}

/* Solution: Add a form reset */

button,
input {
  font-family: inherit;
  font-size: 100%;
  padding: 0;
  margin: 0;
}

input {
  flex: 3;
  /* Solution: Style the form inputs */
  border: 2px solid #999999;
  padding: 10px;
  border-radius: 5px;
}

/* Solution: Style the buttons */

button {
  background-color: black;
  border: none;
  color: white;
  border-radius: 5px;
  padding: 10px 2em;
}

button:hover,
button:focus {
  background-color: #666666;
}

button:disabled {
  background-color: #aaaaaa;
}

/* Table styling */

table img {
  width: 100%;
  height: 150px;
  /* Solution: Fixing the image display */
  object-fit: cover;
  object-position: bottom;
}

/* Solution: Style the table */

table {
  table-layout: fixed;
  width: 100%;
  border-collapse: collapse;
  border-top: 1px solid #999999;
  border-bottom: 1px solid #999999;
}

th,
td {
  vertical-align: top;
  padding: 0.6em;
}

th {
  border-bottom: 1px solid #999999;
}

tr {
  width: 20%;
}

tr :nth-of-type(4) {
  width: 40%;
}

/* Solution: Provide background colors for the "Raw color" cells */

tr:nth-of-type(1) td:nth-of-type(2) {
  background-color: pink;
}

tr:nth-of-type(2) td:nth-of-type(2) {
  background-color: rgb(255 145 175);
}

tr:nth-of-type(3) td:nth-of-type(2) {
  background-color: hotpink;
}

tr:nth-of-type(4) td:nth-of-type(2) {
  background-color: magenta;
}

tbody tr:nth-child(odd) {
  background-color: #eeeeee;
}

caption {
  padding: 1em;
  font-style: italic;
  letter-spacing: 1px;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Tables", "Learn_web_development/Core/Styling_basics/Debugging_CSS", "Learn_web_development/Core/Styling_basics")}}
